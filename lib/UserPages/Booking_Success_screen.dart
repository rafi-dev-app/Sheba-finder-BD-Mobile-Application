import 'package:flutter/material.dart';
import 'package:shebafinderbd/UserPages/Booking_List_page.dart';
import 'package:shebafinderbd/UserPages/Home_screen.dart';

class BookingSuccessPage extends StatelessWidget {
  const BookingSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // ডার্ক ব্যাকগ্রাউন্ড
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // ১. গোল্ডেন টিক মার্ক এবং গ্লো ইফেক্ট
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // গ্লো ইফেক্ট (পেছনের হালকা আলো)
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orangeAccent.withOpacity(0.3),
                            blurRadius: 100,
                            spreadRadius: 20,
                          ),
                        ],
                      ),
                    ),
                    // মেইন গোল্ডেন আইকন
                    const Icon(
                      Icons.check_circle,
                      size: 140,
                      color: Color(0xFFFFC65C), // গোল্ডেন কালার
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // ২. সাকসেস মেসেজ
              const Text(
                "Request Successfully Sent!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Our technician will contact you shortly.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),

              const Spacer(),

              // ৩. বাটন সেকশন
              Row(
                children: [
                  // View My Bookings বাটন
                  Expanded(
                    child: SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BookingListPage()),
                            );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2563EB), // ব্লু কালার
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "View My Bookings",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  // Back to Home বাটন (Outline Style)
                  Expanded(
                    child: SizedBox(
                      height: 55,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()),(route)=>false);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white54),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Back to Home",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}