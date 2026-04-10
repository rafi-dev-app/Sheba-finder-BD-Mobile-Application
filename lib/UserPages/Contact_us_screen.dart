import 'package:flutter/material.dart';

import 'Home_screen.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Contact Us", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // ১. ইউনিক লোগো সেকশন
              Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF1E293B),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFFC65C).withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 10,
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.support_agent_rounded,
                        size: 80,
                        color: Color(0xFFFFC65C),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "How can we help you?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Our team is here to support you 24/7",
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // ২. কন্টাক্ট ফরম
              buildContactField(label: "Full Name", icon: Icons.person_outline, hint: "Enter your name"),
              const SizedBox(height: 20),
              buildContactField(label: "Email Address", icon: Icons.email_outlined, hint: "Enter your email"),
              const SizedBox(height: 20),
              buildContactField(
                  label: "Your Message",
                  hint: "Write your query here...",
                  maxLines: 5
              ),

              const SizedBox(height: 40),

              // ৩. সেন্ড বাটন
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Message Sent Successfully!")),
                    );
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()),(route)=>false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC65C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Send Message",
                    style: TextStyle(
                      color: Color(0xFF0F172A),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContactField({
    required String label,
     IconData? icon,
    required String hint,
    int maxLines = 1
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white24),
            prefixIcon: Icon(icon, color: const Color(0xFFFFC65C)),
            filled: true,
            fillColor: const Color(0xFF1E293B),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.05)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xFFFFC65C), width: 1),
            ),
          ),
        ),
      ],
    );
  }
}