import 'package:flutter/material.dart';

class CarePlanScreen extends StatelessWidget {
  const CarePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Care Plan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _TaskCard(
            title: 'Morning routine',
            items: [
              'Take prescribed beta blocker at 08:00',
              'Record symptom check-in',
              'Hydration goal: 500 ml before noon',
            ],
          ),
          SizedBox(height: 12),
          _TaskCard(
            title: 'Activity & recovery',
            items: [
              '20-minute low-impact walk',
              'Guided breathing (5 minutes)',
              'Avoid high caffeine intake after 14:00',
            ],
          ),
          SizedBox(height: 12),
          _TaskCard(
            title: 'Evening routine',
            items: [
              'Patch reposition and skin check',
              'Confirm medication adherence in app',
              'Sleep target: 7+ hours',
            ],
          ),
        ],
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            ...items.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Icon(Icons.check_circle_outline, size: 18),
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text(item)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
