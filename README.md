# NFC Health Patch Platform

Monorepo starter for an NFC-enabled wearable health patch platform with:

- `mobile_app/` – Flutter patient app
- `backend_api/` – FastAPI backend
- `clinician_portal/` – Next.js clinician dashboard
- `ml/` – ML interfaces and baseline pipelines
- `firmware/` – firmware notes and protocol stubs
- `docs/` – architecture and product requirements

## MVP scope

This starter repo is designed for a chest-worn wearable patch that:

- logs ECG, respiration, motion, temperature, and EDA/GSR
- optionally captures sweat chemistry metadata
- syncs summaries and event windows by NFC tap
- runs confidence-aware predictions for stress and rhythm screening
- exports clinician-facing summaries

## Recommended stack

- Mobile: Flutter
- Backend: FastAPI + PostgreSQL
- Portal: Next.js 14
- ML: Python + scikit-learn / PyTorch
- Infra: Docker Compose for local development

## Repository layout

```text
.
├── .github/
├── assets/
├── backend_api/
├── clinician_portal/
├── docs/
├── firmware/
├── ml/
├── mobile_app/
├── .gitignore
└── docker-compose.yml
```

## Quick start

### 1) Backend

```bash
cd backend_api
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r requirements.txt
uvicorn app.main:app --reload --port 8000
```

### 2) Clinician portal

```bash
cd clinician_portal
npm install
npm run dev
```

### 3) Mobile app

```bash
cd mobile_app
flutter pub get
flutter run
```

## NFC design note

The mobile app is structured around **tap-to-sync**, not continuous streaming. The patch should store rolling summaries and selected raw event windows, then transfer them during an NFC session.

## GitHub setup checklist

1. Create a new GitHub repository.
2. Upload this monorepo.
3. Add repository secrets later for production deployments.
4. Enable branch protection on `main`.
5. Turn on Dependabot and code scanning.
6. Add issue labels for `mobile`, `backend`, `portal`, `firmware`, `ml`, and `regulatory`.

## Production notes

This repo is a strong engineering starter, not a finished medical device. Before clinical deployment, add:

- full cybersecurity controls
- biocompatibility documentation
- risk management and traceability
- verification/validation protocols
- regulatory and privacy controls
