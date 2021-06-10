import 'package:flutter/material.dart';
import '../services/authentication.dart';

// Creating a challange form
class LoginScreen extends StatefulWidget {
  static const routeName = "/add_challange_screen";
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  bool signIn = true;
  // ONCE ALL THE FIELDS ARE FILLED IT WILL BE VALIDATED AND SUBMITTED.
  void _submitData(AuthService _auth) async {
    final isValid = _form.currentState.validate();
    if (!isValid)
      return;
    else {
      _form.currentState.save();
      dynamic result;
      if(signIn){
        result = await _auth.signInEmailPassword(_email, _password);
      }
      else{
        result = await _auth.registerEmailPassword(_email, _password);
      }
      if (result == null) {
        final snackBar =
            SnackBar(content: Text('There seems to have been an error.'));
        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print('error error');
      }
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
                  onSaved: (email) {
                    _email = email;
                  },
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
                  onSaved: (password) {
                    _password = password;
                  },
                ),
                signIn ? Container(
                  height: 60,
                  child: TextButton(
                    child: Text('Sign In',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    onPressed: () {
                      _submitData(_auth);
                    },
                  ),
                ) : Container(
                  height: 60,
                  child: TextButton(
                    child: Text('Register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    onPressed: () {
                      _submitData(_auth);
                    },
                  ),
                ),
                signIn ? Container(
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
                      setState(() {signIn = false;});
                    },
                  ),
                ) : Container(
                  height: 60,
                  child: TextButton(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      setState(() {signIn = true;});
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
