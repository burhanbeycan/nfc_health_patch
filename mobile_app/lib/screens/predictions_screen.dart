import 'package:flutter/material.dart';
import '../widgets/status_banner.dart';

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
          const StatusBanner(
            message:
                'Current model outputs are low-to-moderate risk. Review confidence and corroborate with symptoms.',
            icon: Icons.insights_outlined,
          ),
          const SizedBox(height: 16),
          const _RiskCard(
            title: 'Rhythm screening',
            detail: 'Low concern',
            confidence: 0.92,
            recommendation: 'Continue passive monitoring and routine follow-up.',
            icon: Icons.favorite_outline,
          ),
          const SizedBox(height: 12),
          const _RiskCard(
            title: 'Stress load',
            detail: 'Moderate (31/100)',
            confidence: 0.81,
            recommendation: 'Prompt breathing exercise and check medication schedule.',
            icon: Icons.psychology_outlined,
          ),
          const SizedBox(height: 12),
          const _RiskCard(
            title: 'Decompensation watch',
            detail: 'Low (early warning index 0.19)',
            confidence: 0.76,
            recommendation: 'No escalation needed; keep trend surveillance active.',
            icon: Icons.monitor_heart_outlined,
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Top drivers'),
                  SizedBox(height: 12),
                  Text('• Lower HRV than baseline'),
                  Text('• Elevated EDA during afternoon window'),
                  Text('• Mild skin temperature increase'),
                  Text('• Preserved nocturnal recovery pattern'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RiskCard extends StatelessWidget {
  const _RiskCard({
    required this.title,
    required this.detail,
    required this.confidence,
    required this.recommendation,
    required this.icon,
  });

  final String title;
  final String detail;
  final double confidence;
  final String recommendation;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(title, style: Theme.of(context).textTheme.titleMedium),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(detail),
            const SizedBox(height: 10),
            LinearProgressIndicator(value: confidence),
            const SizedBox(height: 6),
            Text('Confidence ${(confidence * 100).toStringAsFixed(0)}%'),
            const SizedBox(height: 8),
            Text(recommendation),
          ],
        ),
      ),
    );
  }
}
