import '../models/patch_summary.dart';

class MockDataService {
  static const PatchSummary summary = PatchSummary(
    patchId: 'PX-1042',
    batteryPct: 78,
    heartRate: 72,
    respirationRate: 14,
    stressScore: 31,
    ecgQuality: 0.93,
    sweatQuality: 0.71,
    glucoseTrend: 'Rising',
    lastSyncLabel: '2 min ago',
  );
}
