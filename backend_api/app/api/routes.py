from fastapi import APIRouter
from app.schemas.device import DeviceRegistrationRequest, DeviceRegistrationResponse
from app.schemas.session import PatchSessionUpload, PatchSessionResponse
from app.schemas.prediction import PredictionResponse
from app.services.prediction_service import get_mock_predictions

router = APIRouter()


@router.get("/status")
def get_status() -> dict[str, str]:
    return {"message": "API online"}


@router.post("/devices/register", response_model=DeviceRegistrationResponse)
def register_device(payload: DeviceRegistrationRequest) -> DeviceRegistrationResponse:
    return DeviceRegistrationResponse(
        device_id=payload.device_id,
        patch_id=payload.patch_id,
        registered=True,
    )


@router.post("/sessions", response_model=PatchSessionResponse)
def upload_session(payload: PatchSessionUpload) -> PatchSessionResponse:
    return PatchSessionResponse(
        session_id="sess-demo-001",
        patch_id=payload.patch_id,
        samples_received=len(payload.ecg_events),
        stored=True,
    )


@router.get("/predictions/{patch_id}", response_model=PredictionResponse)
def read_predictions(patch_id: str) -> PredictionResponse:
    return get_mock_predictions(patch_id)
