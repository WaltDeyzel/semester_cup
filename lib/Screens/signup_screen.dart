import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/authentication.dart';

// Creating a challange form
class SignUpScreen extends StatefulWidget {
  static const routeName = "/signUp_screen";
  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final _form = GlobalKey<FormState>();
  final picker = ImagePicker();

  // ONCE ALL THE FIELDS ARE FILLED IT WILL BE VALIDATED AND SUBMITTED.
  void _submitData(AuthService _auth) async {
    final isValid = _form.currentState.validate();
    if (!isValid)
      return;
    else {
      _form.currentState.save();
      dynamic result = await _auth.registerEmailPassword(_email, _password);
      if (result == null) {
        final snackBar = SnackBar(content: Text('There seems to have been an error.'));
        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print('error error');
      }else {
        Navigator.of(context).pop();
      }
    }
  }

  String _password = '';
  String _email = '';

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
                // SPACING
                SizedBox(height: 80),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  onSaved: (value) => _email = value,
                ),
                // SPACING
                SizedBox(height: 5),
                // DESCRIPTION SELECTION FRO CHALLANEG
                TextFormField(
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  onSaved: (value) => _password = value,
                  validator: (value) {
                    if (value.isEmpty) return ('Enter password');
                    if (value.length < 6)
                      return ('Password must be at least 6 characters long.');
                    return null;
                  },
                ),
                // SPACING
                SizedBox(height: 5),
                Container(
                  height: 60,
                  child: TextButton(
                    child: Text(
                      'Register',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    onPressed: () {
                      _submitData(_auth);
                    },
                  ),
                ),
                Container(
                  height: 60,
                  child: TextButton(
                    child: Text(
                      'cancel',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
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
