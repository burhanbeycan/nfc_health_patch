class PatchSummary {
  final String patchId;
  final int batteryPct;
  final int heartRate;
  final int respirationRate;
  final int spo2;
  final int hrvMs;
  final double skinTempC;
  final double stressScore;
  final double ecgQuality;
  final double sweatQuality;
  final String glucoseTrend;
  final int medicationAdherencePct;
  final int fallRiskScore;
  final String lastSyncLabel;

  const PatchSummary({
    required this.patchId,
    required this.batteryPct,
    required this.heartRate,
    required this.respirationRate,
    required this.spo2,
    required this.hrvMs,
    required this.skinTempC,
    required this.stressScore,
    required this.ecgQuality,
    required this.sweatQuality,
    required this.glucoseTrend,
    required this.medicationAdherencePct,
    required this.fallRiskScore,
    required this.lastSyncLabel,
  });
}
