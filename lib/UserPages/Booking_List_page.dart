import 'package:flutter/material.dart';

import 'Home_screen.dart';

class BookingListPage extends StatelessWidget {
  const BookingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // তোমার অ্যাপের মেইন ডার্ক থিম
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "My Bookings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false,
            );
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3, // আপাতত ৩টি ডামি বুকিং দেখাচ্ছি
        itemBuilder: (context, index) {
          return buildBookingCard(index);
        },
      ),
    );
  }

  // বুকিং লিস্ট কার্ড
  Widget buildBookingCard(int index) {
    // ডামি ডেটা (পরে এগুলো ফায়ারবেস থেকে আসবে)
    List<String> services = ["Electrician", "House Painter", "Plumber"];
    List<String> dates = ["12 April, 2026", "15 April, 2026", "18 April, 2026"];
    List<String> status = ["Pending", "In Progress", "Completed"];
    List<Color> statusColors = [Colors.orange, Colors.blue, Colors.green];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B), // ডার্ক কার্ড কালার
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // বাম পাশের আইকন বা ইমেজ
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.handyman,
              color: Color(0xFFFFC65C),
              size: 30,
            ),
          ),
          const SizedBox(width: 15),

          // মাঝখানের টেক্সট সেকশন
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  services[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  dates[index],
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          // ডান পাশের স্ট্যাটাস ব্যাজ
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: statusColors[index].withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: statusColors[index]),
            ),
            child: Text(
              status[index],
              style: TextStyle(
                color: statusColors[index],
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
