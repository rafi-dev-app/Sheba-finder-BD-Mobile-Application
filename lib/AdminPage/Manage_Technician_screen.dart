import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // ৪টি ট্যাবের জন্য কন্ট্রোলার
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // ডাইনামিক স্ট্যাটস ডাটা (ভবিষ্যতে Firebase থেকে আসবে)
  final Map<String, dynamic> statsData = {
    'activeTechs': 125,
    'pendingRequests': 37,
    'monthlyRevenue': 124567,
    'reports': 24,
  };

  // ডাইনামিক টেবিল ডাটা (ভবিষ্যতে Firebase থেকে আসবে)
  final List<Map<String, String>> pendingApprovals = [
    {'id': '1225', 'name': 'Rahim Ali', 'type': 'Electrician', 'date': '24/05/26', 'status': 'Pending'},
    {'id': '1226', 'name': 'Suman Mia', 'type': 'Plumber', 'date': '23/05/26', 'status': 'Pending'},
    {'id': '1227', 'name': 'Kader Khan', 'type': 'Painter', 'date': '23/05/26', 'status': 'Pending'},
    {'id': '1228', 'name': 'Mehedi Hasan', 'type': 'Cleaner', 'date': '22/05/26', 'status': 'Pending'},
    {'id': '1229', 'name': 'Asif Rafi', 'type': 'Carpenter', 'date': '21/05/26', 'status': 'Pending'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // ডার্ক থিম
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.apps_rounded, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            const Text(
              "Sheba Finder Admin",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.account_circle_outlined, color: Colors.white), onPressed: () {}),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ১. নেভিগেশন ট্যাব
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: const Color(0xFFFFC65C),
                labelColor: const Color(0xFFFFC65C),
                unselectedLabelColor: Colors.white70,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(text: "Dashboard"),
                  Tab(text: "Technicians"),
                  Tab(text: "Categories"),
                  Tab(text: "Bookings"),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ২. স্ট্যাটস কার্ড সেকশন
            const Text("Quick Stats", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildStatsCard("Active Techs", statsData['activeTechs'].toString(), Icons.engineering_rounded, const Color(0xFFF05252)),
                  buildStatsCard("Pending Requests", statsData['pendingRequests'].toString(), Icons.hourglass_top_rounded, const Color(0xFF3F83F8)),
                  buildStatsCard("Monthly Revenue", "\$${statsData['monthlyRevenue'].toString()}", Icons.account_balance_wallet_rounded, const Color(0xFFFFC65C), isRevenue: true),
                  buildStatsCard("Reports", statsData['reports'].toString(), Icons.report_problem_rounded, const Color(0xFF9061F9)),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ৩. পেন্ডিং অ্যাপ্রুভাল টেবিল সেকশন
            const Text("Pending Approvals", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            buildPendingApprovalsTable(),
          ],
        ),
      ),
    );
  }

  // স্ট্যাটস কার্ড উইজেট
  Widget buildStatsCard(String title, String value, IconData icon, Color cardColor, {bool isRevenue = false}) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: cardColor.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: isRevenue ? const Color(0xFF0F172A) : Colors.white, size: 28),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: isRevenue ? const Color(0xFF0F172A).withOpacity(0.7) : Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 5),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  value,
                  style: TextStyle(color: isRevenue ? const Color(0xFF0F172A) : Colors.white, fontSize: isRevenue ? 20 : 28, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // পেন্ডিং অ্যাপ্রুভাল টেবিল উইজেট
  Widget buildPendingApprovalsTable() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B), // কার্ড ব্যাকগ্রাউন্ড
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          horizontalMargin: 10,
          columnSpacing: 20,
          headingRowHeight: 40,
          dataRowHeight: 60,
          columns: const [
            DataColumn(label: Text('ID', style: TextStyle(color: Colors.white54, fontSize: 13))),
            DataColumn(label: Text('Name', style: TextStyle(color: Colors.white54, fontSize: 13))),
            DataColumn(label: Text('Service', style: TextStyle(color: Colors.white54, fontSize: 13))),
            DataColumn(label: Text('Date', style: TextStyle(color: Colors.white54, fontSize: 13))),
            DataColumn(label: Text('Action', style: TextStyle(color: Colors.white54, fontSize: 13))),
          ],
          // ডাইনামিকালি টেবিল রো তৈরি করা
          rows: pendingApprovals.map((approval) {
            return DataRow(cells: [
              DataCell(Text(approval['id']!, style: const TextStyle(color: Colors.white70, fontSize: 13))),
              DataCell(Text(approval['name']!, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500))),
              DataCell(Text(approval['type']!, style: const TextStyle(color: Colors.white70, fontSize: 13))),
              DataCell(Text(approval['date']!, style: const TextStyle(color: Colors.white54, fontSize: 12))),
              DataCell(
                Row(
                  children: [
                    buildActionButton("Approve", const Color(0xFF3F83F8), () {
                      // অ্যাপ্রুভ লজিক
                    }),
                    const SizedBox(width: 8),
                    buildActionButton("Reject", const Color(0xFFF05252), () {
                      // রিজেক্ট লজিক
                    }),
                  ],
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }

  // অ্যাকশন বাটন (Approve/Reject)
  Widget buildActionButton(String label, Color color, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        foregroundColor: color,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: BorderSide(color: color, width: 1),
      ),
      child: Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }
}