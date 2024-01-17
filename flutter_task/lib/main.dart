import 'package:flutter/material.dart';
import 'package:flutter_task/Screens/home/home.dart';
import 'package:flutter_task/Screens/login/login.dart';
import 'package:flutter_task/Screens/profile/profile.dart';
import 'package:flutter_task/Screens/restaurants/restaurants.dart';
import 'package:flutter_task/Screens/signUp/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
