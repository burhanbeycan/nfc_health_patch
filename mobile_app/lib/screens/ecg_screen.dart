import 'package:flutter/material.dart';
import '../services/mock_data_service.dart';

class EcgScreen extends StatelessWidget {
  const EcgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final summary = MockDataService.summary;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('ECG Review', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text('Signal quality ${(summary.ecgQuality * 100).toStringAsFixed(0)}%'),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Latest strip', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFFE8F4FA),
                      border: Border.all(color: const Color(0xFFB3D8E6)),
                    ),
                    alignment: Alignment.center,
                    child: const Text('Waveform rendering zone\n(Lead I, 25 mm/s)'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Automated interpretation is decision support only and must be reviewed by a licensed clinician.',
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
                children: const [
                  Text('Recent events'),
                  SizedBox(height: 10),
                  _EventRow(time: '08:42', label: 'Sinus rhythm', severity: 'Routine'),
                  _EventRow(
                    time: '11:16',
                    label: 'Transient tachycardia',
                    severity: 'Review',
                  ),
                  _EventRow(time: '13:02', label: 'Motion artifact', severity: 'Filtered'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EventRow extends StatelessWidget {
  const _EventRow({
    required this.time,
    required this.label,
    required this.severity,
  });

  final String time;
  final String label;
  final String severity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(width: 54, child: Text(time)),
          Expanded(child: Text(label)),
          Chip(label: Text(severity)),
        ],
      ),
    );
  }
}
