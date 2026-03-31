from pydantic import BaseModel


class DeviceRegistrationRequest(BaseModel):
    device_id: str
    patch_id: str
    firmware_version: str


class DeviceRegistrationResponse(BaseModel):
    device_id: str
    patch_id: str
    registered: bool
