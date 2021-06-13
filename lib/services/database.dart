import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:semester_cup/Classes/challenge.dart';
import '../Classes/user.dart' as current;
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

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
  Future<String> uploadImageToFirebase(
      File file, String uid, String path) async {
    FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
    UploadTask uploadTask =
        _firebaseStorage.ref().child(path + uid + '.jpg').putFile(file);
    String imageUrl = await (await uploadTask).ref.getDownloadURL();
    return imageUrl;
  }

  // Update profile settings from profile_settings_Screen using this method.
  void profileSettingsUpdate(current.User _user, File _profileImage) async {
    String imgURL;
    if (_profileImage != null) {
      imgURL = await (this
          .uploadImageToFirebase(_profileImage, _user.uid, 'profile-images/'));
    }
    this.updateUserData(_uid, _user.name, _user.email, imgURL);
  }

  //--------------------------------------------------------------------

  Future createChallenge(
      String uid, String title, String description, String imageUrl) async {
    CollectionReference challenges =
        FirebaseFirestore.instance.collection('challenges');
    return await challenges.doc(uid).set({
      "creater-id": uid,
      "title": title,
      "description": description,
      "challenge-cover-image": imageUrl,
    });
  }

  void addChallenge(Challenge _challenge, File _challengeCoverImage) async {
    String imgURL;
    if (_challengeCoverImage != null) {
      imgURL = await (this.uploadImageToFirebase(
          _challengeCoverImage, _uid, 'challenge-cover-image/'));
    }
    this.createChallenge(
        _uid, _challenge.title, _challenge.description, imgURL);
  }

  List<Challenge> _challengeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return Challenge(
          id: e.id,
          title: e['title'],
          description: e['description'],
          coverPhoto: e['challenge-cover-image'],
          created: null,
          deadline: null);
    }).toList();
  }

  Stream<List<Challenge>> get getChallenges {
    CollectionReference challenge =
        FirebaseFirestore.instance.collection('challenges');
    return challenge.snapshots().map(_challengeListFromSnapshot);
  }

  //--------------------------------------------------------------------

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

  Stream<List<current.User>> get getUsers {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users.snapshots().map(_userListFromSnapshot);
  }
}
