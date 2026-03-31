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
            Text(
              'Patient Overview',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 6),
            Text('Patch ${summary.patchId} • Last sync ${summary.lastSyncLabel}'),
            const SizedBox(height: 12),
            StatusBanner(
              message:
                  'Monitoring active. No immediate critical alerts. Continue normal care plan and daily checks.',
              icon: Icons.health_and_safety_outlined,
              color: Colors.green.shade100,
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
                MetricCard(
                  title: 'Heart Rate',
                  value: '${summary.heartRate} bpm',
                  subtitle: 'Normal resting zone',
                ),
                MetricCard(
                  title: 'SpO₂',
                  value: '${summary.spo2}%',
                  subtitle: 'Oxygenation stable',
                ),
                MetricCard(
                  title: 'Respiration',
                  value: '${summary.respirationRate}/min',
                  subtitle: 'No distress pattern',
                ),
                MetricCard(
                  title: 'HRV',
                  value: '${summary.hrvMs} ms',
                  subtitle: 'Near patient baseline',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Care Continuity',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    _LabeledProgress(
                      label:
                          'Medication adherence ${summary.medicationAdherencePct}%',
                      value: summary.medicationAdherencePct / 100,
                    ),
                    const SizedBox(height: 10),
                    _LabeledProgress(
                      label: 'Patch battery ${summary.batteryPct}%',
                      value: summary.batteryPct / 100,
                    ),
                    const SizedBox(height: 10),
                    _LabeledProgress(
                      label:
                          'Fall risk score ${summary.fallRiskScore}/100 (lower is better)',
                      value: summary.fallRiskScore / 100,
                      invertSemantics: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daily Patient Tasks',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    const _ChecklistItem(
                      text: 'Morning symptom check-in completed',
                      done: true,
                    ),
                    const _ChecklistItem(
                      text: 'Hydration target in progress',
                      done: false,
                    ),
                    const _ChecklistItem(
                      text: 'Evening patch reposition reminder pending',
                      done: false,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton.icon(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('NFC sync initiated. Hold phone near patch.'),
                    ),
                  ),
                  icon: const Icon(Icons.nfc),
                  label: const Text('Sync Patch'),
                ),
                OutlinedButton.icon(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Symptom log opened for patient note entry.'),
                    ),
                  ),
                  icon: const Icon(Icons.note_add_outlined),
                  label: const Text('Log Symptoms'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ChecklistItem extends StatelessWidget {
  const _ChecklistItem({required this.text, required this.done});

  final String text;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            done ? Icons.check_circle : Icons.radio_button_unchecked,
            color: done ? Colors.green : Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class _LabeledProgress extends StatelessWidget {
  const _LabeledProgress({
    required this.label,
    required this.value,
    this.invertSemantics = false,
  });

  final String label;
  final double value;
  final bool invertSemantics;

  @override
  Widget build(BuildContext context) {
    final normalized = value.clamp(0.0, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: normalized,
          color: invertSemantics
              ? Colors.green
              : Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
