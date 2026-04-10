import 'package:flutter/material.dart';
import 'package:shebafinderbd/UserPages/Login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "User Signup",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B264D),
              ),
            ),
            const SizedBox(height: 40),

            // ১. ফুল নেম ফিল্ড
            buildSignupField(
              hint: "Full Name",
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 20),

            // ২. ইমেইল ফিল্ড
            buildSignupField(
              hint: "Email",
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 20),

            // ৩. পাসওয়ার্ড ফিল্ড
            buildSignupField(
              hint: "Password",
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            const SizedBox(height: 20),

            // ৪. রি-পাসওয়ার্ড ফিল্ড (Re-password)
            buildSignupField(
              hint: "Re-password",
              icon: Icons.lock_reset_outlined,
              isPassword: true,
            ),
            const SizedBox(height: 25),

            // ৫. টার্মস এন্ড কন্ডিশনস
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  activeColor: const Color(0xFF1B264D),
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    "I agree to the Terms and conditions",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            // ৬. ক্রিয়েট অ্যাকাউন্ট বাটন (Navy Blue Color)
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B264D), // আপনার ডিমান্ড অনুযায়ী কালার
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ফিল্ড তৈরির কমন ফাংশন
  Widget buildSignupField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}