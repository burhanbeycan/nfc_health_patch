import '../models/patch_summary.dart';

class MockDataService {
  static const PatchSummary summary = PatchSummary(
    patchId: 'PX-1042',
    batteryPct: 78,
    heartRate: 72,
    respirationRate: 14,
    spo2: 98,
    hrvMs: 49,
    skinTempC: 36.9,
    stressScore: 31,
    ecgQuality: 0.93,
    sweatQuality: 0.71,
    glucoseTrend: 'Rising',
    medicationAdherencePct: 96,
    fallRiskScore: 14,
    lastSyncLabel: '2 min ago',
  );
}
