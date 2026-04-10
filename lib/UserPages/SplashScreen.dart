import 'dart:async';
import 'package:flutter/material.dart';
import 'OnBoarding_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    movetoNextScreen();
  }

  Future<void> movetoNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.home_work_outlined,
                      size: 80, color: Color(0xFF101D42)),
                ),
                const SizedBox(height: 20),
                const Text(
                  "SHEBA FINDER BD",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF101D42),
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "HOME SERVICE",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),


          Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: Column(
              children: [

                const SizedBox(
                  width: 100,
                  child: LinearProgressIndicator(
                    backgroundColor: Color(0xFFF0F2F8),
                    color: Color(0xFF101D42),
                    minHeight: 3,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}