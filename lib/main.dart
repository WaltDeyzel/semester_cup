import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import './services/database.dart';

import './services/authentication.dart';
import './Screens/profile_screen.dart';
import './Screens/spesific_challange_screen.dart';
import './Screens/leaderboard_screen.dart';
import './Screens/challenge_list_screen.dart';
import './Screens/add_challenge_screen.dart';
import './Screens/add_entry_screen.dart';
import './Screens/profile_settings_screen.dart';

import './Classes/user.dart' as current;
import './Classes/challenge.dart';

import './Widgets/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<current.User>>.value(
          value: DatabaseService('').getUsers,
        ),
        StreamProvider<current.User>.value(
          value: AuthService().user,
        ),
        // StreamProvider<List<Challenge>>.value(
        //   value: DatabaseService('').getChallenges,
        // ),
        FutureProvider<List<Challenge>>.value(
          value: DatabaseService('').getChallenges2,
        ),
        // FutureProvider<List<ChallengeEntry>>.value(
        //   value: DatabaseService('').getEntires,
        // ),
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
              headline1: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.teal),
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
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.teal)),
        ),
        routes: {
          '/': (ctx) =>
              Wrapper(), // Wrapper toggles between Home Screen and SignIn/SignUp screen depending on if user is signed in.
          ChallengeListScreen.routeName: (ctx) => ChallengeListScreen(),
          LeaderboardScreen.routeName: (ctx) => LeaderboardScreen(),
          SpesificChallengeScreen.routeName: (ctx) => SpesificChallengeScreen(),
          AddChallengeScreen.routeName: (ctx) => AddChallengeScreen(),
          AddEntryScreen.routeName: (ctx) => AddEntryScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          ProfileSettingsScreen.routeName: (ctx) => ProfileSettingsScreen(),
        },
      ),
    );
  }
}
