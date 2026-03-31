from app.schemas.prediction import PredictionResponse



def get_mock_predictions(patch_id: str) -> PredictionResponse:
    return PredictionResponse(
        patch_id=patch_id,
        rhythm_screening="low_concern",
        rhythm_confidence=0.92,
        glucose_trend="rising",
        glucose_confidence=0.68,
        stress_band="moderate",
        stress_score=31.0,
        top_drivers=[
            "lower HRV than baseline",
            "EDA elevated",
            "skin temperature mildly increased",
        ],
    )
