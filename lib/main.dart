import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/profile_screen.dart';
import './Screens/spesific_challange_screen.dart';
import './Screens/home_screen.dart';
import './Screens/leaderboard_screen.dart';
import './Screens/challenge_list_screen.dart';
import './Screens/add_challenge_screen.dart';
import './Screens/add_entry_screen.dart';

import './Classes/challenges_demo.dart';
import './Classes/users_demo.dart';

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
          ChangeNotifierProvider(
            create: (context) => UserListDemo(),
          ),
        ],
        child: MaterialApp(
          title: 'SemesterCup',
          // THEME OF APP
          theme: ThemeData(
            primarySwatch: Colors.teal,
            accentColor: Colors.white,
            fontFamily: 'Georgia',
            textTheme: TextTheme(
              // App bar title
              headline1: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.teal),
              // Challenge title
              headline2: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 24,
                  color: Colors.black),
              // Challenge description.
              headline3: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 16,
                  color: Colors.black),
              // Spesific challenge page app bar title
              headline4: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.teal)
            ),
          ),
          routes: {
            '/': (ctx) => HomeScreen(),
            ChallengeListScreen.routeName: (ctx) => ChallengeListScreen(),
            LeaderboardScreen.routeName: (ctx) => LeaderboardScreen(),
            SpesificChallengeScreen.routeName: (ctx) =>
                SpesificChallengeScreen(),
            AddChallengeScreen.routeName: (ctx) => AddChallengeScreen(),
            AddEntryScreen.routeName: (ctx) => AddEntryScreen(),
            UserScreen.routeName: (ctx) => UserScreen(),
          },
        ));
  }
}
