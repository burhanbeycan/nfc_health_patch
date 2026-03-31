import 'package:flutter/material.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appointments')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _AppointmentCard(
            title: 'Cardiology Follow-up',
            when: 'Apr 3, 2026 • 09:30 AM',
            location: 'River Valley Clinic • Room 204',
          ),
          SizedBox(height: 12),
          _AppointmentCard(
            title: 'Telehealth Check-in',
            when: 'Apr 8, 2026 • 02:00 PM',
            location: 'Virtual visit link in Messages',
          ),
        ],
      ),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  const _AppointmentCard({
    required this.title,
    required this.when,
    required this.location,
  });

  final String title;
  final String when;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_month_outlined),
        title: Text(title),
        subtitle: Text('$when\n$location'),
        isThreeLine: true,
        trailing: TextButton(onPressed: () {}, child: const Text('Details')),
      ),
    );
  }
}
