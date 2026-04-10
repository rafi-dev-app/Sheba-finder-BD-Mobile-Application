import 'package:flutter/material.dart';
import 'package:shebafinderbd/AdminPage/Fragments/DashboardFragment.dart';
import 'package:shebafinderbd/AdminPage/Fragments/MessageControl_Fragment.dart';
import 'package:shebafinderbd/AdminPage/Fragments/TechnicianFragment.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Enterprise Admin Dashboard",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.menu, color: Colors.white), onPressed: () {}),
        ],

        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: "Dashboard"),
            Tab(text: "Technicians"),
            Tab(text: "Categories"),
            Tab(text: "Bookings"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          DashboardFragment(),
          TechnicianFragment(),
          Center(child: Text("Categories Page", style: TextStyle(color: Colors.white))),
          MessageControlFragment(),
        ],
      ),
    );
  }
}
