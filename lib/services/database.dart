import 'package:cloud_firestore/cloud_firestore.dart';
import '../Classes/user.dart' as current;
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class DatabaseService {
  final String uid;
  DatabaseService(this.uid);

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('user');

  Future updateUserData(String uid, String name, String email, String profileURL) async {
    return await collection.doc(uid).set({
      "uid": uid,
      "name": name,
      "email": email,
      'profileImage': profileURL,
    });
  }

  // Get user data and return User model
  Future<current.User> getUserData() async {
    current.User user = await collection.doc(uid).get().then((document){
      return current.User(uid: document['uid'], name: document['name'], email: document['email'],  profileImage: document['profileImage'], points: 0);;
    });
    return user;
  }

  // Upload user file and return a URL to file on database
  Future<String> uploadImageToFirebase(File file, String uid) async {
    FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
    UploadTask uploadTask = _firebaseStorage.ref().child('images/'+uid+'.jpg').putFile(file);
    String imageUrl = await (await uploadTask).ref.getDownloadURL();
    return imageUrl;
  }
}
