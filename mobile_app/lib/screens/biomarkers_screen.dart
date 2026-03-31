import 'package:flutter/material.dart';
import '../services/mock_data_service.dart';

class BiomarkersScreen extends StatelessWidget {
  const BiomarkersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final summary = MockDataService.summary;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Biomarkers', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.water_drop_outlined),
              title: const Text('Glucose trend'),
              subtitle: Text('${summary.glucoseTrend} • confidence 0.68'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.thermostat_outlined),
              title: const Text('Skin temperature'),
              subtitle: Text('${summary.skinTempC.toStringAsFixed(1)} °C • within target range'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.science_outlined),
              title: const Text('Sweat chemistry quality'),
              subtitle: Text(
                '${(summary.sweatQuality * 100).toStringAsFixed(0)}% usable signal • hydration advised for stronger confidence',
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Clinical context flags'),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Chip(label: Text('No fever pattern')),
                      Chip(label: Text('Hydration watch')),
                      Chip(label: Text('Electrolyte trend stable')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
