// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:semester_cup/services/database.dart';
// import 'package:firebase_core/firebase_core.dart';
import '../Classes/user.dart' as current;
class AuthService {
        
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future signInAnom() async {
      try{
        UserCredential result =  await _auth.signInAnonymously();
        User user = result.user;  
        return user;
      }
      catch(e){
        print(e.toString());
        return(null);
      }
    }

    current.User _userFromFirebaseUser(User user){
      return(user != null ? current.User(name: 'Testing', email: user.email, studentNum: 'testing', points: 0): null);
    }

    Future registerEmailPassword(String email, String password) async{
      try{
        UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        User user = result.user;
        await DatabaseService(user.uid).updateUserData('', user.email);
        return _userFromFirebaseUser(user);
      }
      catch(e){
        print(e.toString());
        return null;
      }
    }

    Future signInEmailPassword(String email, String password) async{
      try{
        UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
        User user = result.user;
        return _userFromFirebaseUser(user);
      }
      catch(e){
        print(e.toString());
        return null;
      }
    }

    Stream<current.User> get user{
      // return _auth.authStateChanges().map((User user) => _userFromFirebaseUser(user));
      return _auth.authStateChanges().map(_userFromFirebaseUser);
    }

    Future signOut() async{
      try{
        return await _auth.signOut();
      }
      catch(e){
        print(e.toString());
        return(null);
      }
    }

}

