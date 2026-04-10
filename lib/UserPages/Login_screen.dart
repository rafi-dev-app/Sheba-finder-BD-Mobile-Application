import 'package:flutter/material.dart';
import 'package:shebafinderbd/UserPages/ForgetPassword_screen.dart';
import 'package:shebafinderbd/UserPages/Home_screen.dart';
import 'package:shebafinderbd/UserPages/Signup_screen.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({super.key});

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF1B264D)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // ১. লোগো কন্টেইনার
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F2F8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.person_pin, size: 50, color: Color(0xFF1B264D)),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "User Login",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1B264D)),
            ),

            const SizedBox(height: 40),

            buildUserTextField(
              controller: _emailController,
              hint: "Email Address",
              icon: Icons.alternate_email,
            ),

            const SizedBox(height: 20),

            buildUserTextField(
              controller: _passwordController,
              hint: "Password",
              icon: Icons.lock_outline,
              isPassword: true,
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordScreen()));
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ৫. লগইন বাটন
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B264D),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                ),
                child: const Text("Login Now", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),

            const SizedBox(height: 25),

            // ৬. সাইন আপ লিংক (Don't have an account?)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? ", style: TextStyle(color: Colors.grey)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color(0xFF1B264D),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // সেই অ্যাডমিন স্টাইল টেক্সট ফিল্ড
  Widget buildUserTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: const Color(0xFF1B264D)),
        filled: true,
        fillColor: const Color(0xFFF8FAFF),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF1B264D), width: 2),
        ),
      ),
    );
  }
}