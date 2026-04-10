import 'package:flutter/material.dart';
import 'package:shebafinderbd/UserPages/Login_screen.dart';
import 'package:shebafinderbd/UserPages/Role_Selection_screen.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ১. উপরের ইমেজ সেকশন
          Expanded(
            flex: 6, // স্ক্রিনের ৬০% জায়গা
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                // ছবির ব্যাকগ্রাউন্ডের সাথে মিল রেখে ডার্ক ব্লু কালার
                color: Color(0xFF101D42),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              // --- আপডেট করা অংশ শুরু ---
              child: ClipRRect(
                // কন্টেইনারের কোণা গোল করার সাথে ছবিকেও গোল করার জন্য
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                child: Image.asset(
                  "assets/Onboarding.png", // আপনার ছবির পাথ
                  fit: BoxFit.cover, // ছবিটি পুরো কন্টেইনার জুড়ে সুন্দরভাবে ফিট হবে
                ),
              ),
              // --- আপডেট করা অংশ শেষ ---
            ),
          ),

          // ২. নিচের টেক্সট এবং বাটন সেকশন (অপরিবর্তিত)
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Expert Services at\nYour Doorstep",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Find trusted professionals for your\nhome maintenance in seconds",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // আপনার নেভিগেশন লজিক
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>RoleSelectionScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFC65C),
                        foregroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}