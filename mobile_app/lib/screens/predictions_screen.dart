import 'package:flutter/material.dart';

class PredictionsScreen extends StatelessWidget {
  const PredictionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Predictions', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              title: const Text('Rhythm screening'),
              subtitle: const Text('Low concern • confidence 0.92'),
              leading: const Icon(Icons.favorite_outline),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Stress load'),
              subtitle: const Text('Moderate • score 31/100 • confidence 0.81'),
              leading: const Icon(Icons.psychology_outlined),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Top drivers'),
                  SizedBox(height: 12),
                  Text('• Lower HRV than baseline'),
                  Text('• Elevated EDA'),
                  Text('• Mild skin temperature increase'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
