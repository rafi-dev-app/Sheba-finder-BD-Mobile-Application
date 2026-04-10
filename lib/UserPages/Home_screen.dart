import 'package:flutter/material.dart';
import 'package:shebafinderbd/UserPages/Booking_List_page.dart';
import 'package:shebafinderbd/UserPages/Contact_us_screen.dart';
import 'package:shebafinderbd/UserPages/Technician_List_Screen.dart';
import 'package:shebafinderbd/UserPages/Technician_Profile_Booking.dart';

import 'Profile_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current_index = 0;

  // ১. এখানে আমরা সব গুলো পেজ লিস্ট করে রাখলাম
  // আপনি চাইলে Messages এবং Profile এর জন্য আলাদা ফাইল তৈরি করে এখানে বসাতে পারেন
  final List<Widget> _pages = [
    const MainDashboard(),     // হোম বা ড্যাশবোর্ড সেকশন (নিচে আলাদা মেথড করা আছে)
    const BookingListPage(),   // আপনার তৈরি করা বুকিং লিস্ট পেজ
    const ContactUsPage(), // ডামি মেসেজ
    const ProfilePage(),  // ডামি প্রোফাইল
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),

      // ২. বডিতে এখন current_index অনুযায়ী পেজ দেখাবে
      body: _pages[current_index],

      // ৩. বটম ন্যাভিগেশন বার
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            current_index = value;
          });
        },
        currentIndex: current_index,
        showUnselectedLabels: true, // লেবেল দেখালে ইউজার বুঝতে সুবিধা হয়
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.shifting, // shifting এর বদলে fixed দিলে ডার্ক থিমে ভালো দেখায়
        selectedItemColor: const Color(0xFF101D42),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// ৪. মেইন ড্যাশবোর্ড (যেখানে সার্চ, ক্যাটাগরি এবং টেকনিশিয়ান লিস্ট থাকে)
class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // প্রোফাইল এবং সার্চ বার
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.white24,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Services...",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search, color: Color(0xFF101D42)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text("Categories", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            // ক্যাটাগরি লিস্ট
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  categoryItem(context, Icons.electric_bolt, "Electrician"),
                  categoryItem(context, Icons.plumbing, "Plumber"),
                  categoryItem(context, Icons.cleaning_services, "Cleaner"),
                  categoryItem(context, Icons.chair, "Carpenter"),
                  categoryItem(context, Icons.format_paint, "Painter"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Top Rated Technicians", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            // টেকনিশিয়ান কার্ডস
            technicianCard(context, "Rahim Ali", "Expert Electrician", 4.9),
            technicianCard(context, "Suman Mia", "Professional Plumber", 4.7),
            technicianCard(context, "Kader Khan", "House Painter", 4.5),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ক্যাটাগরি আইটেম উইজেট
  Widget categoryItem(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TechnicianListScreen(categoryName: label)));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 18),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(15)),
              child: Icon(icon, color: Colors.white, size: 32),
            ),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  // টেকনিশিয়ান কার্ড উইজেট
  Widget technicianCard(BuildContext context, String name, String desc, double rating) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TechnicianProfilePage(
                techData: {
                  'name': name,
                  'imageUrl': 'assets/placeholder.png', // পরে ডাইনামিক হবে
                  'location': 'Uttara, Dhaka',
                  'bio': 'Expert $desc with years of experience.',
                },
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                height: 70, width: 70,
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                child: const Icon(Icons.person, size: 40, color: Colors.grey),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        const SizedBox(width: 4),
                        Text(rating.toString(), style: const TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(desc, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}