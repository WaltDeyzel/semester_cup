import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Screens/home_screen.dart';
import '../Screens/login_screen.dart';

import '../Classes/user.dart';

class Wrapepr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user == null ? LoginScreen() : HomeScreen();
  }
}
