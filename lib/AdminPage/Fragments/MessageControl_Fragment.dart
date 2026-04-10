import 'package:flutter/material.dart';

class MessageControlFragment extends StatelessWidget {
  const MessageControlFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Message Center",
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // ১. টপ কুইক অ্যাকশন কার্ডস (Messages, Notifications, Settings)
          Row(
            children: [
              Expanded(child: _buildQuickActionCard("Messages", Icons.chat_bubble_outline, true)),
              const SizedBox(width: 12),
              Expanded(child: _buildQuickActionCard("Alerts", Icons.notifications_none, false)),
              const SizedBox(width: 12),
              Expanded(child: _buildQuickActionCard("Config", Icons.settings_outlined, false)),
            ],
          ),

          const SizedBox(height: 35),
          const Text(
            "Recent Inbox",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),

          // ২. ইনবক্স লিস্ট (ইউজারদের মেসেজগুলো এখানে শো করবে)
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B), // ডার্ক কন্টেইনার
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white10),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              separatorBuilder: (context, index) => const Divider(color: Colors.white10, height: 1),
              itemBuilder: (context, index) {
                // ডামি ডাটা (ভবিষ্যতে Firebase থেকে আসবে)
                final users = ["Mehedi Hasan Rafi", "John Doe", "Jane Smith", "Tanvir Ahmed"];
                final issues = ["Service Issue", "Account Alert", "Feedback", "Payment Failed"];

                return ListTile(
                  contentPadding: const EdgeInsets.all(15),
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFFFFC65C).withOpacity(0.2),
                    child: const Icon(Icons.person_outline, color: Color(0xFFFFC65C)),
                  ),
                  title: Text(users[index],
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  subtitle: Text("user${index + 1}@email.com",
                      style: const TextStyle(color: Colors.white54, fontSize: 12)),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(issues[index],
                          style: const TextStyle(color: Color(0xFFFFC65C), fontWeight: FontWeight.w500, fontSize: 12)),
                      const SizedBox(height: 4),
                      const Text("12:30 PM", style: TextStyle(color: Colors.white24, fontSize: 10)),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 30),

          // ৩. অ্যাকশন বাটনস (Delete, Mark as Read, View)
          Column(
            children: [
              _buildActionButton("View Conversation", const Color(0xFF3B82F6), true),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildActionButton("Mark as Read", Colors.white12, false)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildActionButton("Delete", Colors.redAccent.withOpacity(0.1), false, textColor: Colors.redAccent)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // কুইক অ্যাকশন কার্ড উইজেট
  Widget _buildQuickActionCard(String title, IconData icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFFC65C).withOpacity(0.1) : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: isActive ? const Color(0xFFFFC65C) : Colors.white10),
      ),
      child: Column(
        children: [
          Icon(icon, color: isActive ? const Color(0xFFFFC65C) : Colors.white60, size: 28),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(color: isActive ? Colors.white : Colors.white60, fontSize: 12)),
        ],
      ),
    );
  }

  // অ্যাকশন বাটন উইজেট
  Widget _buildActionButton(String label, Color bgColor, bool isFullColor, {Color textColor = Colors.white}) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isFullColor ? BorderSide.none : BorderSide(color: textColor.withOpacity(0.3)),
          ),
        ),
        child: Text(label, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
      ),
    );
  }
}