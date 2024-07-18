import 'package:flutter/material.dart';
import 'package:profile/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 226, 98, 123),
          title: Text('Profile '),
          centerTitle: true,
        ),
        body: MyProfile(),
      ),
    );
  }
}
