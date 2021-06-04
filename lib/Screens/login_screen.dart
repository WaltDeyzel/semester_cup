import 'package:flutter/material.dart';
import '../services/authentication.dart';

import 'package:semester_cup/Screens/signup_screen.dart';

// Creating a challange form
class LoginScreen extends StatefulWidget {
  static const routeName = "/add_challange_screen";
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();

  // ONCE ALL THE FIELDS ARE FILLED IT WILL BE VALIDATED AND SUBMITTED.
  void _submitData(AuthService _auth) async{
    final isValid = _form.currentState.validate();
    if (!isValid) return;
    else {
      _form.currentState.save();
      dynamic result = await _auth.signInEmailPassword(_email, _password);
    }
  }
  
  var _email = '';
  var _password = '';
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 45),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[
                Icon(Icons.emoji_events,
                    size: 150, color: Theme.of(context).primaryColor),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "email",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  onSaved: (email){_email=email;},
                ),
                // SPACING
                SizedBox(height: 5),
                TextFormField(
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "password",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  onSaved: (password){_password=password;},
                ),
                Container(
                  height: 60,
                  child: TextButton(
                    child: Text('SignIn',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    onPressed: (){
                      _submitData(_auth);
                    },
                  ),
                ),
                Container(
                  height: 60,
                  child: TextButton(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(SignUpScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
