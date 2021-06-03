import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../Classes/user.dart' as User2;
class AuthService{
        
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

    User2.User _userFromFirebaseUser(User user){
      return User2.User(name: 'Testing', email: user.email, studentNum: 'testing', points: 0);
    }

    Future registerEmailPassword(String email, String password) async{
      try{
        UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        User user = result.user;
        return _userFromFirebaseUser(user);
      }
      catch(e){
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

}

