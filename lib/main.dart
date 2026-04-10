import 'package:flutter/material.dart';

import 'UserPages/Login_screen.dart';
import 'UserPages/Role_Selection_screen.dart';
import 'UserPages/SplashScreen.dart';

void main() {
  runApp(Home());
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
