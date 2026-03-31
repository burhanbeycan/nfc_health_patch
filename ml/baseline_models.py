from dataclasses import dataclass


@dataclass
class PredictionBundle:
    rhythm_screening: str
    rhythm_confidence: float
    glucose_trend: str
    glucose_confidence: float
    stress_band: str
    stress_score: float


class BaselineInferenceEngine:
    """Placeholder inference engine for early integration tests."""

    def predict(self, features: dict) -> PredictionBundle:
        ecg_quality = float(features.get("ecg_quality", 0.0))
        sweat_quality = float(features.get("sweat_quality", 0.0))

        glucose_trend = "rising" if sweat_quality > 0.6 else "insufficient_data"
        glucose_confidence = 0.68 if sweat_quality > 0.6 else 0.15

        return PredictionBundle(
            rhythm_screening="low_concern" if ecg_quality > 0.8 else "review_needed",
            rhythm_confidence=0.92 if ecg_quality > 0.8 else 0.44,
            glucose_trend=glucose_trend,
            glucose_confidence=glucose_confidence,
            stress_band="moderate",
            stress_score=31.0,
        )
