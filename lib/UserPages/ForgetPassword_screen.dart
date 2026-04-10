import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  // ১. ইমেইল ধরার জন্য কন্ট্রোলার
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // ২. অ্যাপবার যেখানে ব্যাক অ্যারো আছে
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF1B264D)),
          onPressed: () => Navigator.pop(context), // আগের পেজে ফিরে যাওয়ার জন্য
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // ৩. লকিং আইকন বা লোগো সেকশন
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F2F8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.lock_reset_rounded,
                    size: 60, color: Color(0xFF1B264D)),
              ),
            ),

            const SizedBox(height: 40),

            // ৪. টাইটেল ও সাব-টাইটেল
            const Text(
              "Forget Password",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B264D),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Enter your registered email to receive\na password reset link",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
            ),

            const SizedBox(height: 50),

            // ৫. ইমেইল ইনপুট ফিল্ড (অ্যাডমিন স্টাইল আন্ডারলাইন)
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: "Registered Email",
                prefixIcon: Icon(Icons.email_outlined, color: Color(0xFF1B264D)),
                filled: true,
                fillColor: const Color(0xFFF8FAFF),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1B264D), width: 2),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ৬. সেন্ড বাটন
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // এখানে ইমেইল পাঠানোর লজিক হবে
                  print("Reset link sent to: ${_emailController.text}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B264D), // সেই নেভি ব্লু কালার
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  "Send Reset Link",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
}