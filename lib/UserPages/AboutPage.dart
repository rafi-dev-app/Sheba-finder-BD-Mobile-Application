import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("About Us", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. App Logo Section
            Center(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC65C),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.handyman_rounded, size: 60, color: Color(0xFF0F172A)),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Sheba Finder BD",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Version 1.0.0",
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 2. Our Mission
            const Text(
              "Our Mission",
              style: TextStyle(color: Color(0xFFFFC65C), fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Sheba Finder BD aims to provide quality and reliable home services to every household in Bangladesh. We build a bridge between skilled technicians and people in need of essential services.",
              style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
            ),

            const SizedBox(height: 30),

            // 3. Why Choose Us?
            const Text(
              "Why Choose Us?",
              style: TextStyle(color: Color(0xFFFFC65C), fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            buildFeatureItem(Icons.verified_user, "Verified Professionals", "Every technician on our platform is background-checked and highly skilled."),
            buildFeatureItem(Icons.timer, "Fast Response", "We ensure your service request is handled in the shortest time possible."),
            buildFeatureItem(Icons.price_check, "Transparent Pricing", "No hidden costs. Get the best services at budget-friendly rates."),

            const SizedBox(height: 40),

            // 4. Footer
            const Center(
              child: Text(
                "© 2026 Sheba Finder BD. All Rights Reserved.",
                style: TextStyle(color: Colors.white24, fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildFeatureItem(IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFFFC65C), size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  desc,
                  style: const TextStyle(color: Colors.white54, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}