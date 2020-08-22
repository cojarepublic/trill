import 'package:flutter/material.dart';
import 'package:trill/screens/chat_screen.dart';

import 'screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trill',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        backgroundColor: Colors.teal,
        accentColor: Colors.black38,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.teal,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
        ),
      ),
      home: AuthScreen(),
    );
  }
}

