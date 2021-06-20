import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import '../Classes/challenge.dart';
import '../Classes/challengeEntry.dart';
import '../Classes/user.dart' as current;

class DatabaseService {
  final String _uid;
  DatabaseService(this._uid);

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(
      String uid, String name, String email, String profileURL) async {
    return await collection.doc(uid).set({
      "uid": uid,
      "name": name,
      "email": email,
      'profile-image': profileURL,
    });
  }

  // Get user data and return User model
  Future<current.User> getUserData() async {
    current.User user = await collection.doc(_uid).get().then((document) {
      return current.User(
          uid: document['uid'],
          name: document['name'],
          email: document['email'],
          profileImage: document['profile-image'],
          points: 0);
    });
    return user;
  }

  // Upload user file and return a URL to file on database
  Future<String> _uploadImageToFirebase(File file, String fileName, String path) async {
    FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
    UploadTask uploadTask =_firebaseStorage.ref().child(path + fileName + '.jpg').putFile(file);
    String imageUrl = await (await uploadTask).ref.getDownloadURL();
    return imageUrl;
  }

  // Update profile settings from profile_settings_Screen using this method.
  void profileSettingsUpdate(current.User _user, File _profileImage) async {
    String imgURL = await (this._uploadImageToFirebase(_profileImage, _user.uid, 'profile-images/'));
    
    this.updateUserData(_uid, _user.name, _user.email, imgURL);
  }

  //--------------------------------------------------------------------
  
  Future _createChallenge( String uid, Challenge _challenge, File _challengeCoverImage) async {
    CollectionReference challenges = FirebaseFirestore.instance.collection('challenges');
    DocumentReference document = challenges.doc();
    String fileName =  _uid + '-' + document.id;
    String imgURL = await (this._uploadImageToFirebase(_challengeCoverImage, fileName, 'challenge-cover-image/'));
    return await document.set({
      "creator-id": uid,
      "title": _challenge.title,
      "description": _challenge.description,
      "challenge-cover-image": imgURL,
    });
  }
  // Function that is called to create challenge and upload it to firebase
  void addChallenge(Challenge _challenge, File _challengeCoverImage, String _uid) async {
     this._createChallenge(_uid, _challenge, _challengeCoverImage);
  }
  // Convert database data to objects
  List<Challenge> _challengeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return Challenge(
          id: e.id, // ID OF CHALLENGE
          title: e['title'],
          description: e['description'],
          coverPhoto: e['challenge-cover-image'],
          created: null,
          deadline: null);
    }).toList();
  }
  // Create a stream to get data from firebase continuously. 
  Stream<List<Challenge>> get getChallenges {
    CollectionReference challenge =
        FirebaseFirestore.instance.collection('challenges');
    return challenge.snapshots().map(_challengeListFromSnapshot);
  }
  // Read all data from a collection.
   Future<List<Challenge>> get getChallenges2 async{
    QuerySnapshot challenges = await FirebaseFirestore.instance.collection('challenges').get();
    return _challengeListFromSnapshot(challenges);
  }

  Future deleteChallenge(String _uid, String _challengeID, String _url) async{

    CollectionReference _collection = FirebaseFirestore.instance.collection('challenge-'+ _challengeID);
    QuerySnapshot _challengesList = await _collection.get();
    _challengesList.docs.forEach((e) => _collection.doc(e.id).delete());
    _collection.doc().delete();
    FirebaseFirestore.instance.collection('challenges').doc(_challengeID).delete();
    FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
    String _path = 'challenge-cover-image/';
    String _file = _path + _uid + '-' + _challengeID + '.jpg';
    await _firebaseStorage.ref().child(_file).delete();
    
  }

  //--------------------------------------------------------------------

  Future _createChallengeEntry(String imageUrl, String description, String uid, String challengeID) async {
    CollectionReference challenges =
        FirebaseFirestore.instance.collection('challenge-'+challengeID);
    return await challenges.doc().set({
      "creator-id": uid,
      "description": description,
      "challenge-entry-image": imageUrl,
      "votes": 0
    });
  }
  // Function that is called to create challenge entry and upload it to firebase
  void addEntry(ChallengeEntry _entry, File _challengeCoverImage, String _challengeID, String _uid) async {
    String folder = _uid+'/'; // User folder containing all files of user
    String fileName = _challengeID;
    String imgURL = await (this._uploadImageToFirebase(_challengeCoverImage, fileName, folder));

    this._createChallengeEntry(imgURL, _entry.title, _uid, _challengeID);
  }
  // Convert database data to objects
  List<ChallengeEntry> _entryListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return ChallengeEntry(id: e.id, title: e['description'], votes: e['votes'], pictureURL: e['challenge-entry-image']);
    }).toList();
  }

  Future<List<ChallengeEntry>> get getEntires async{
    QuerySnapshot entries = await FirebaseFirestore.instance.collection('challenge-'+_uid).get();
    return _entryListFromSnapshot(entries);
  }

  Future deleteChallengeEntry(String uid, String challengeID, String challengeEntryID) async{

    CollectionReference collection = FirebaseFirestore.instance.collection('challenge-'+challengeID);
    DocumentSnapshot document = await collection.doc(challengeEntryID).get();
    if(document['creator-id'] == uid){
      await collection.doc(challengeEntryID).delete();
      FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
      String path = '$uid/';
      String fileName = challengeID;
    await _firebaseStorage.ref().child(path + fileName + '.jpg').delete();
    } 
    else return; 
  }
  //--------------------------------------------------------------------
  // Convert database data to objects
  List<current.User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return current.User(
          uid: e['uid'],
          email: e['email'],
          name: e['name'],
          profileImage: e['profile-image'],
          points: 0);
    }).toList();
  }
  // Create a stream to get data from firebase continuously. 
  Stream<List<current.User>> get getUsers {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users.snapshots().map(_userListFromSnapshot);
  }
}
