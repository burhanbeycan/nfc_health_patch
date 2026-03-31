class PatchSummary {
  final String patchId;
  final int batteryPct;
  final int heartRate;
  final int respirationRate;
  final double stressScore;
  final double ecgQuality;
  final double sweatQuality;
  final String glucoseTrend;
  final String lastSyncLabel;

  const PatchSummary({
    required this.patchId,
    required this.batteryPct,
    required this.heartRate,
    required this.respirationRate,
    required this.stressScore,
    required this.ecgQuality,
    required this.sweatQuality,
    required this.glucoseTrend,
    required this.lastSyncLabel,
  });
}
