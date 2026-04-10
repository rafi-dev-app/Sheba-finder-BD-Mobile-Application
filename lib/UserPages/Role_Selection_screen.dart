import 'package:flutter/material.dart';
import 'package:shebafinderbd/AdminPage/Admin_LoginScreen.dart';
import 'package:shebafinderbd/UserPages/Login_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFF1B264D),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),
            // উপরের টাইটেল
            const Text(
              "Choose Your Role",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 50),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Row(
                  children: [

                    Expanded(
                      child: buildRoleCard(
                        icon: Icons.person_outline,
                        title: "User",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit duism.",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>UserLoginScreen()));
                        },
                      ),
                    ),

                    const SizedBox(width: 20),


                    Expanded(
                      child: buildRoleCard(
                        icon: Icons.shield_outlined,
                        title: "Admin",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit duism.",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLoginPage()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildRoleCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // আইকন সার্কেল
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F2F8),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: const Color(0xFF1B264D)),
            ),

            const SizedBox(height: 25),


            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 30),


            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A78DA), // বাটনের ব্লু কালার
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Click amw",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}