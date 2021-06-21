import 'package:firebase_auth/firebase_auth.dart';
import 'package:semester_cup/services/database.dart';
import '../Classes/user.dart' as current;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnom() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return (null);
    }
  }

  current.User _userFromFirebaseUser(User user) {
    // DatabaseService data = DatabaseService(user.uid);
    // Future<current.User> currenUser =  data.getUserData() ;
    return (user != null
        ? current.User(
            uid: user.uid,
            name: 'TESTING',
            email: user.email,
            points: 0)
        : null);
  }

  Future registerEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      current.User _newUser = current.User(uid: user.uid, name: 'Name', email: user.email, points: 0, profileImage:'https://thumbs-prod.si-cdn.com/Fd5JxEOpW-mu_FKIJFFG0u0KJF8=/fit-in/1072x0/https://public-media.si-cdn.com/filer/ee/c7/eec7622a-b164-4a47-a01f-a21f8ef94234/turtletop.jpg');
      await DatabaseService(user.uid).updateUserData(_newUser);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<current.User> get user {
    // return _auth.authStateChanges().map((User user) => _userFromFirebaseUser(user));
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return (null);
    }
  }
}
