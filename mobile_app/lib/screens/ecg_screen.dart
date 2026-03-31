import 'package:flutter/material.dart';

class EcgScreen extends StatelessWidget {
  const EcgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('ECG Review', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Latest strip'),
                  SizedBox(height: 12),
                  Placeholder(fallbackHeight: 180),
                  SizedBox(height: 12),
                  Text('Use this area for raw ECG waveform rendering and event markers.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
