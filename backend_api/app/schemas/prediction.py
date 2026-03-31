from pydantic import BaseModel


class PredictionResponse(BaseModel):
    patch_id: str
    rhythm_screening: str
    rhythm_confidence: float
    glucose_trend: str
    glucose_confidence: float
    stress_band: str
    stress_score: float
    top_drivers: list[str]
