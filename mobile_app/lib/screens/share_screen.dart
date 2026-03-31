import 'package:flutter/material.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Share & Reports', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Generate clinician summary', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  const Text('Create a PDF summary with latest ECG event windows, signal quality, and prediction outputs.'),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.picture_as_pdf_outlined),
                    label: const Text('Generate Report'),
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
