import 'package:flutter/material.dart';

class DashboardFragment extends StatelessWidget {
  const DashboardFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          // স্ট্যাটাস কার্ডস গ্রিড
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.4,
            children: [
              _buildModernCard("Active Techs", "125", const Color(0xFFFBBF24), Icons.image_outlined),
              _buildModernCard("Pending Requests", "37", const Color(0xFFF87171), Icons.person_outline),
              _buildModernCard("Monthly Revenue", "\$124,567", const Color(0xFF34D399), Icons.description_outlined),
              _buildModernCard("Reports", "24", const Color(0xFF6366F1), Icons.group_outlined),
            ],
          ),
          const SizedBox(height: 35),
          const Text("Pending Approvals",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          _buildApprovalTable(),
        ],
      ),
    );
  }

  // এই মেথডগুলো অবশ্যই ক্লাসের সেকেন্ড ব্র্যাকেটের ভেতরে থাকবে
  Widget _buildModernCard(String title, String value, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(4),
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white.withOpacity(0.9), size: 24),
          const Spacer(),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 12)),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildApprovalTable() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Name')),

            DataColumn(label: Text('Action')),
          ],
          rows: List.generate(5, (index) => DataRow(cells: [
            DataCell(Text("122${index+5}")),
            const DataCell(Text("User Name")),
            DataCell(Row(
              children: [
                TextButton(onPressed: () {}, child: const Text("Approve")),
                TextButton(onPressed: () {}, child: const Text("Reject", style: TextStyle(color: Colors.red))),
              ],
            )),
          ])),
        ),
      ),
    );
  }
}