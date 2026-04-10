import 'package:flutter/material.dart';

class TechnicianFragment extends StatelessWidget {
  const TechnicianFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white.withOpacity(0.05),
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading: const CircleAvatar(backgroundColor: Color(0xFFFFC65C), child: Icon(Icons.person)),
            title: Text("Technician Name $index", style: const TextStyle(color: Colors.white)),
            subtitle: const Text("Expert Electrician", style: TextStyle(color: Colors.white60)),
            trailing: const Icon(Icons.edit, color: Colors.white24, size: 18),
          ),
        );
      },
    );
  }
}