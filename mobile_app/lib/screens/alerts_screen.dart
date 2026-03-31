import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clinical Alerts')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _AlertTile(
            level: 'Review',
            color: Colors.orange,
            title: 'Transient tachycardia episode',
            detail: 'Detected at 11:16 • 48 seconds • clinician review recommended',
          ),
          SizedBox(height: 12),
          _AlertTile(
            level: 'Info',
            color: Colors.blue,
            title: 'Patch battery forecast',
            detail: 'Estimated 20 hours remaining before recharge is needed',
          ),
          SizedBox(height: 12),
          _AlertTile(
            level: 'Resolved',
            color: Colors.green,
            title: 'Signal artifact period',
            detail: 'Motion-related ECG artifact cleared at 13:10',
          ),
        ],
      ),
    );
  }
}

class _AlertTile extends StatelessWidget {
  const _AlertTile({
    required this.level,
    required this.color,
    required this.title,
    required this.detail,
  });

  final String level;
  final Color color;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.15), child: Icon(Icons.notification_important_outlined, color: color)),
        title: Text(title),
        subtitle: Text(detail),
        trailing: Chip(label: Text(level)),
      ),
    );
  }
}
