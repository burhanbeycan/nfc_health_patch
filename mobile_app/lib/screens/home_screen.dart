import 'package:flutter/material.dart';
import '../services/mock_data_service.dart';
import '../widgets/metric_card.dart';
import '../widgets/status_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final summary = MockDataService.summary;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NFC Health Patch', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 6),
            Text('Patch ${summary.patchId} • Last sync ${summary.lastSyncLabel}'),
            const SizedBox(height: 16),
            const StatusBanner(
              message: 'Patch connected. Tap phone to sync new ECG events and biomarker summaries.',
              icon: Icons.nfc,
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.25,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                MetricCard(title: 'Heart Rate', value: '${summary.heartRate} bpm', subtitle: 'Current'),
                MetricCard(title: 'Respiration', value: '${summary.respirationRate}/min', subtitle: 'Current'),
                MetricCard(title: 'Stress', value: '${summary.stressScore.toInt()}/100', subtitle: 'Moderate'),
                MetricCard(title: 'Glucose Trend', value: summary.glucoseTrend, subtitle: 'Confidence-aware'),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Signal Quality', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(value: summary.ecgQuality),
                    const SizedBox(height: 6),
                    Text('ECG ${(summary.ecgQuality * 100).toStringAsFixed(0)}%'),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(value: summary.sweatQuality),
                    const SizedBox(height: 6),
                    Text('Sweat ${(summary.sweatQuality * 100).toStringAsFixed(0)}%'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.nfc),
              label: const Text('Tap Phone to Patch'),
            ),
          ],
        ),
      ),
    );
  }
}
