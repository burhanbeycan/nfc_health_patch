# Product Requirements Document

## MVP goals

- support chest patch onboarding and placement
- NFC tap-to-sync workflow
- display latest HR, respiration, stress score, and signal quality
- render ECG strips and patch event markers
- support sweat chemistry placeholders and future expansion
- export summary report for clinician review

## Functional requirements

### Mobile
- user authentication
- pairing by NFC
- dashboard with last sync status
- ECG detail screen with strip selector
- biomarker screen with confidence labels
- prediction screen with explanation cards
- PDF/JSON export

### Backend
- JWT auth
- device registration endpoint
- session upload endpoint
- prediction retrieval endpoint
- report generation endpoint

### Portal
- patient list
- patient detail page
- event review list
- report panel

## Non-functional requirements

- encrypted local storage
- role-based access control
- audit logging
- testable service interfaces
- modular NFC integration
