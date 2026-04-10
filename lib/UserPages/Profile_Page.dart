import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shebafinderbd/UserPages/AboutPage.dart';
import 'package:shebafinderbd/UserPages/Login_screen.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  File? _image;
  final ImagePicker _picker = ImagePicker();

  // ২. গ্যালারি থেকে ছবি নেওয়ার ফাংশন
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // সিলেক্ট করা ফাইল সেট করা
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // তোমার অ্যাপের ডার্ক ব্যাকগ্রাউন্ড
      body: Column(
        children: [
          // ১. টপ প্রোফাইল সেকশন (কার্ভ ডিজাইন)
          Stack(
            children: [
              Container(
                height: 220,
                decoration: const BoxDecoration(
                  color: Color(0xFF1E293B),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      // প্রোফাইল ইমেজ
                      GestureDetector(
                        onTap: _pickImage, // ছবিতে ক্লিক করলে গ্যালারি খুলবে
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[800],
                          backgroundImage: _image != null
                              ? FileImage(_image!) // সিলেক্ট করা ছবি
                              : null, // ডিফল্ট ছবি
                          child: _image == null
                              ?  Icon(Icons.camera_alt, color: Colors.white54, size: 30)
                              : null,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Mehedi Hasan Rafi",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      // এডিট বাটন
                      ElevatedButton.icon(
                        onPressed: _pickImage,
                        icon: const Icon(Icons.edit, size: 16, color: Colors.black),
                        label: const Text("Edit Profile", style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFC65C),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ২. প্রোফাইল অপশন লিস্ট
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                buildProfileOption(Icons.calendar_month, "My Bookings",context, ),
                buildProfileOption(Icons.location_on_outlined, "Saved Addresses",context),
                buildProfileOption(Icons.payment_outlined, "Payment Methods", context),
                buildProfileOption(Icons.support_agent_outlined, "Contact Support", context),
                buildProfileOption(Icons.info_outline, "About Us", context,onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUsPage()));
                }),
                buildProfileOption(Icons.privacy_tip_outlined, "Privacy Policy", context),
                buildProfileOption(Icons.settings_outlined, "Settings", context),

                const Divider(color: Colors.white10, height: 40),

                ListTile(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Logged out successfully'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => UserLoginScreen()),
                          (route) => false,
                    );
                  },
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.logout, color: Colors.redAccent),
                  ),
                  title: const Text("Logout", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 16),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // অপশন তৈরির কমন উইজেট
  Widget buildProfileOption(IconData icon, String title, BuildContext context, {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
      // onTap যদি null হয়, তবে এটি ক্লিক হবে না
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: const Color(0xFFFFC65C)),
      ),
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
      // যদি onTap দেওয়া থাকে তবেই অ্যারো আইকন দেখাবে, নাহলে দেখাবে না (Optional)
      trailing: onTap != null
          ? const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 16)
          : null,
    );
  }
}