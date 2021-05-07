import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Screens/main_screen.dart';
import './Classes/challenges_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ChallengeListDemo(),
          ),
        ],
        child: MaterialApp(
          title: 'SemesterCup',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            '/': (ctx) => MainScreen(),
          },
        ));
  }
}
