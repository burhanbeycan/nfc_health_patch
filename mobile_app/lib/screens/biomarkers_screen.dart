import 'package:flutter/material.dart';

class BiomarkersScreen extends StatelessWidget {
  const BiomarkersScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              subtitle: const Text('Rising • confidence 0.68'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.thermostat_outlined),
              title: const Text('Skin temperature'),
              subtitle: const Text('+0.4 °C from baseline'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.science_outlined),
              title: const Text('Sweat quality'),
              subtitle: const Text('Low sweat volume can reduce chemistry confidence'),
            ),
          ),
        ],
      ),
    );
  }
}
