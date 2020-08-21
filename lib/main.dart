import 'package:flutter/material.dart';
import 'package:trill/screens/chat_screen.dart';

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
      ),
      home: ChatScreen(),
    );
  }
}

