from pydantic import BaseModel


class ECGEvent(BaseModel):
    event_type: str
    confidence: float
    timestamp: str


class PatchSessionUpload(BaseModel):
    patch_id: str
    synced_at: str
    hr_bpm: int
    respiration_per_min: int
    stress_score: float
    ecg_quality: float
    sweat_quality: float
    ecg_events: list[ECGEvent]


class PatchSessionResponse(BaseModel):
    session_id: str
    patch_id: str
    samples_received: int
    stored: bool
