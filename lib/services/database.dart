import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:semester_cup/Classes/challenge.dart';
import '../Classes/user.dart' as current;
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class DatabaseService {
  final String uid;
  DatabaseService(this.uid);

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('user');

  Future updateUserData(
      String uid, String name, String email, String profileURL) async {
    return await collection.doc(uid).set({
      "uid": uid,
      "name": name,
      "email": email,
      'profileImage': profileURL,
    });
  }

  // Get user data and return User model
  Future<current.User> getUserData() async {
    current.User user = await collection.doc(uid).get().then((document) {
      return current.User(
          uid: document['uid'],
          name: document['name'],
          email: document['email'],
          profileImage: document['profileImage'],
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

  Future createChallenge(
      String uid, String title, String description, String imageUrl) async {
    CollectionReference challenges =
        FirebaseFirestore.instance.collection('challenges');
    return await challenges.doc(uid).set({
      "creater-id": uid,
      "name": title,
      "description": description,
      "cover-photo": imageUrl,
    });
  }

  List<Challenge> _challengeListFromSnapshot(QuerySnapshot snapshot){
    print('ssdadsa');
    print(snapshot.docs.toString());
    List<Challenge> l = snapshot.docs.map((e){return Challenge(id: e.id, title: e['name'], description: e['description'], coverPhoto: e['cover-photo'], created: null, deadline: null);}).toList();
    print(l.toString());
    return l;
  }

  Stream<List<Challenge>> get challenges {
    CollectionReference challenge =
        FirebaseFirestore.instance.collection('challenges');
    return challenge.snapshots().map(_challengeListFromSnapshot);
  }
}
