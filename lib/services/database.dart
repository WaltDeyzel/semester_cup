import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService(this.uid);

  final CollectionReference collection = FirebaseFirestore.instance.collection('user');

  Future updateUserData(String name, String email) async{
    return await collection.doc(uid).set({
      "name": name,
      "email": email,
    });
  }
   Stream<QuerySnapshot> get users {
      return collection.snapshots();
    }
}