# Firmware Notes

Suggested firmware responsibilities:

- sensor acquisition scheduler
- signal quality gating
- summary feature generation
- event-triggered waveform chunk storage
- NFC session handling
- configuration update parser

## Suggested patch summary payload

```json
{
  "patch_id": "PX-1042",
  "battery_pct": 78,
  "hr_bpm": 72,
  "resp_per_min": 14,
  "stress_score": 31,
  "ecg_quality": 0.93,
  "sweat_quality": 0.71,
  "alerts": ["low_sweat_volume"]
}
```
