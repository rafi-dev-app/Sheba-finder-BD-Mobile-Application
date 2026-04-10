import 'package:flutter/material.dart';
import 'package:shebafinderbd/UserPages/Booking_Success_screen.dart';

class TechnicianProfilePage extends StatelessWidget {
  final Map<String, dynamic> techData;

  const TechnicianProfilePage({super.key, required this.techData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Technician Profile", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // মেথডে ডেটা পাস করা হচ্ছে
            buildProfileCard(techData),
            const SizedBox(height: 30),
            buildBookingForm(context),
          ],
        ),
      ),
    );
  }

  Widget buildProfileCard(Map<String, dynamic> techData) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey[300],
                  // ডাইনামিক ইমেজ
                  child: Image.asset(
                    techData['imageUrl'] ?? 'assets/placeholder.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 50),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      techData['name'] ?? "Unknown Name", // ডাইনামিক নাম
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: List.generate(5, (index) => const Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.orange,
                      )),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 16, color: Colors.white),
                        const SizedBox(width: 6),
                        Text(
                          techData['location'] ?? "Uttara, Dhaka", // ডাইনামিক লোকেশন
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Bio",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            techData['bio'] ?? "No bio available for this technician.", // ডাইনামিক বায়ো
            style: const TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }

  // ২. বুকিং ফর্ম উইজেট (আগের মতোই থাকবে)
  Widget buildBookingForm(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.calendar_month, color: Color(0xFFFFC65C), size: 30),
              SizedBox(width: 15),
              Text(
                "Booking Form",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 25),
          TextField(
            decoration: InputDecoration(
              hintText: "Select Date",
              suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Explain your problem",
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>BookingSuccessPage() ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC65C),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text(
                "Confirm Booking & Proceed",
                style: TextStyle(color: Color(0xFF101D42), fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}