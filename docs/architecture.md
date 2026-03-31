# Architecture Overview

## Product concept

An NFC-enabled wearable health patch with a reusable electronics pod and a disposable adhesive sensing patch.

## System blocks

- **Patch electronics**
  - ECG acquisition
  - respiration estimation
  - EDA/GSR
  - skin temperature
  - motion sensing
  - optional electrochemical sweat sensing
  - local storage + NFC sync

- **Mobile application**
  - onboarding and placement guide
  - NFC pairing and tap-to-sync
  - dashboard, ECG review, biomarkers, predictions
  - calibration and report generation

- **Backend API**
  - patient/device registration
  - session ingestion
  - prediction storage
  - clinician report endpoints

- **Clinician portal**
  - patient list
  - patient detail timeline
  - ECG event review
  - report generation

- **ML layer**
  - signal quality model
  - ECG event screening model
  - glucose trend estimation
  - multimodal stress scoring

## Data flow

1. Patch samples sensors and stores summarized features.
2. User taps phone to patch.
3. App reads NFC summary and optionally requests event windows.
4. App stores data locally and syncs with backend.
5. Backend persists sessions and returns predictions.
6. Clinician portal visualizes longitudinal trends.

## Key engineering principles

- confidence-aware outputs
- offline-first mobile UX
- modular sensor abstraction
- strict separation between raw signal data and predictions
- auditability of model versions and report generation
