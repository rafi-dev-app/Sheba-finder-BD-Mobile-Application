import 'package:flutter/material.dart';

class TechnicianListScreen extends StatelessWidget {
  final String categoryName; // হোম পেজ থেকে আসা ক্যাটাগরির নাম

  const TechnicianListScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("$categoryName Experts", style: const TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5, // আপাতত ডামি ৫টি কার্ড
        itemBuilder: (context, index) {
          // এই কার্ডগুলোতে ক্লিক করলে প্রোফাইল পেজে যাবে
          return buildTechnicianCard(context, index);
        },
      ),
    );
  }

  // টেকনিশিয়ান কার্ড ডিজাইন
  Widget buildTechnicianCard(BuildContext context, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 60,
            width: 60,
            color: Colors.grey[300],
            child: const Icon(Icons.person, color: Colors.grey, size: 40),
          ),
        ),
        title: Text(
            "Technician ${index + 1}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text("$categoryName Expert"),
            const SizedBox(height: 5),
            const Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 16),
                Text(" 4.8 (120 Reviews)"),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {
          // এখানে ক্লিক করলে প্রোফাইল ও বুকিং পেজে যাবে
          // Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage()));
        },
      ),
    );
  }
}