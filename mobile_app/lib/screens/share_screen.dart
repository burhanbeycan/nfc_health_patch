import 'package:flutter/material.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  bool _includeIdentifiers = false;
  bool _includeRawEcg = true;
  bool _consentVerified = true;

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
                  Text(
                    'Clinical handoff package',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Generate a structured summary including ECG windows, biomarker trends, predictions, and adherence context.',
                  ),
                  const SizedBox(height: 8),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _includeIdentifiers,
                    onChanged: (value) => setState(() => _includeIdentifiers = value),
                    title: const Text('Include patient identifiers'),
                    subtitle: const Text('Disable for de-identified specialist review'),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _includeRawEcg,
                    onChanged: (value) => setState(() => _includeRawEcg = value),
                    title: const Text('Include raw ECG strips'),
                    subtitle: const Text('Recommended for cardiology consults'),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _consentVerified,
                    onChanged: (value) => setState(() => _consentVerified = value),
                    title: const Text('Consent verification complete'),
                    subtitle: const Text('Required before external sharing'),
                  ),
                  const SizedBox(height: 10),
                  FilledButton.icon(
                    onPressed: _consentVerified
                        ? () => ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Report queued and encrypted before transfer.',
                                ),
                              ),
                            )
                        : null,
                    icon: const Icon(Icons.picture_as_pdf_outlined),
                    label: const Text('Generate Report'),
                  ),
                ],
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
                  Text('Audit trail'),
                  SizedBox(height: 10),
                  Text('• 13:09 UTC • Shared with Dr. Rivera (Cardiology)'),
                  Text('• 09:45 UTC • Shared with Case Manager Team'),
                  Text('• Yesterday • PDF export saved to patient record'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
