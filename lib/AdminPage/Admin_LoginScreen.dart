import 'package:flutter/material.dart';
import 'package:shebafinderbd/AdminPage/Manage_Technician_screen.dart';

import 'Dashboard_screen.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final _adminIdController = TextEditingController();
  final _accessKeyController = TextEditingController();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // ডার্ক থিম
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 1.5,
            colors: [
              const Color(0xFF1E293B),
              const Color(0xFF0F172A),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // ১. সিকিউরিটি হেডার
                const Icon(Icons.security_rounded, size: 60, color: Colors.blueAccent),
                const SizedBox(height: 10),
                const Text(
                  "Admin Portal",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 40),

                // ২. মেইন লগইন কার্ড (গ্লাস ইফেক্ট)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Admin ID",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      buildInputField(
                        controller: _adminIdController,
                        hint: "Enter Admin ID",
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "Access Key",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      buildInputField(
                        controller: _accessKeyController,
                        hint: "Enter Access Key",
                        icon: Icons.vpn_key_outlined,
                        isPassword: true,
                        isObscured: _isObscured,
                        toggle: () => setState(() => _isObscured = !_isObscured),
                      ),
                      const SizedBox(height: 40),

                      // ৩. সিকিউর লগইন বাটন (গ্রেডিয়েন্ট)
                      Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF3B82F6), Color(0xFF10B981)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueAccent.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AdminDashboardPage()),

                              );

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                          child: const Text(
                            "Secure Login",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Unauthorized Access is Strictly Prohibited",
                  style: TextStyle(color: Colors.white24, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // কাস্টম টেক্সট ফিল্ড
  Widget buildInputField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool isObscured = false,
    VoidCallback? toggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: isObscured,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent, size: 20),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility, color: Colors.white24),
          onPressed: toggle,
        )
            : null,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white24, fontSize: 14),
        filled: true,
        fillColor: const Color(0xFF1E293B).withOpacity(0.5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }
}