# Artifacts Summary - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [PSV ActivityDefinition (Verification Activity)](StructureDefinition-psv-activity-definition.md) | Defines a concrete verification activity to be performed by a worker/system. |
| [PSV AuditEvent](StructureDefinition-psv-audit-event.md) | System-level audit of verification operations. |
| [PSV Endpoint (US Core derived)](StructureDefinition-psv-endpoint.md) | Endpoints for boards/registries/verifiers. |
| [PSV Evidence Binary](StructureDefinition-psv-evidence-binary.md) | Raw binary artifact (hashable). |
| [PSV Evidence Document](StructureDefinition-psv-evidence-document.md) | Stores document artifacts (PDF, CSV, screenshots) used as evidence. |
| [PSV Measure](StructureDefinition-psv-measure.md) | Aggregates verification coverage or SLA metrics. |
| [PSV MeasureReport](StructureDefinition-psv-measure-report.md) | Reports metrics for verification coverage/SLA. |
| [PSV Organization (US Core derived)](StructureDefinition-psv-organization.md) | Represents employers, boards (validators), certifying bodies, accreditors. |
| [PSV OrganizationAffiliation](StructureDefinition-psv-organizationaffiliation.md) | Privileges and affiliations between organizations and practitioners. |
| [PSV PlanDefinition (Policy)](StructureDefinition-psv-plan-definition.md) | Defines policy (frequency, method, failure action) for verification types. |
| [PSV Practitioner with Qualification Slices (Common Pattern + Rules)](StructureDefinition-PSVPractitioner.md) | Practitioner profile with typed qualification slices and shared invariants for credentialing. |
| [PSV PractitionerRole (US Core derived)](StructureDefinition-psv-practitionerrole.md) | PractitionerRole for roles/specialties linked to organizations. |
| [PSV Provenance (US Core derived)](StructureDefinition-psv-provenance.md) | Audits VerificationResult with evidence entities (CSV snapshot, API receipt, PDF). |
| [PSV Verification Task](StructureDefinition-psv-verification-task.md) | Requests execution of a verification (e.g., LEIE monthly, license quarterly). |
| [PSV VerificationResult](StructureDefinition-psv-verificationresult.md) | Standard verification evidence linking validators to verified targets. |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Action](StructureDefinition-action.md) |  |
| [Flag Evidence (VerificationResult link)](StructureDefinition-flag-evidence.md) | Carries a reference to the VerificationResult that justifies this Flag. |
| [Flag Target Location (element path)](StructureDefinition-flag-targetLocation.md) | Optional element path (e.g., qualification[license][0]) for UI deep-linking. |
| [Qualification Restriction](StructureDefinition-qualification-restriction.md) |  |
| [Qualification Specialty](StructureDefinition-qualification-specialty.md) |  |
| [Qualification Status](StructureDefinition-qualification-status.md) | Status of a credential/qualification entry (e.g., active, expired, suspended). |
| [Training Completion Status](StructureDefinition-completion-status.md) |  |
| [Training Type](StructureDefinition-training-type.md) |  |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [PSV Action](ValueSet-psv-action-vs.md) |  |
| [PSV Verification Type](ValueSet-psv-verification-type-vs.md) |  |
| [VS - Qualification Status](ValueSet-psvVS-qualification-status.md) |  |
| [VS — Board/Training Specialty](ValueSet-psvVS-board-specialty.md) | Allowed specialties used for training/board examples. |
| [VS — DEA Controlled Substance Schedules (II–V)](ValueSet-psvVS-dea-schedule.md) | Allowed DEA schedules for clinician prescribing context. |
| [VS — DEA Registrant Type](ValueSet-psvVS-dea-registrant-type.md) | Allowed DEA registrant categories for practitioner credentialing. |
| [VS — Training Completion Status](ValueSet-psvVS-completion-status.md) | Allowed values for training completion status. |
| [VS — Training Type](ValueSet-psvVS-training-type.md) | Allowed training types for practitioner qualifications. |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Board/Training Specialty (Minimal)](CodeSystem-psv-board-specialty-cs.md) | Minimal specialty codes used in examples. Replace/expand with your authoritative list. |
| [DEA Controlled Substance Schedules (II–V)](CodeSystem-psv-dea-schedule-cs.md) | Subset of U.S. controlled substance schedules commonly applicable to prescribers. Schedule I excluded. |
| [DEA Registrant Type](CodeSystem-psv-dea-registrant-type-cs.md) | DEA registrant categories relevant to care delivery and dispensing. |
| [PSV Action CodeSystem](CodeSystem-psv-action-cs.md) |  |
| [PSV Verification Type CodeSystem](CodeSystem-psv-verification-type-cs.md) |  |
| [Qualification Status](CodeSystem-psv-qualification-status-cs.md) |  |
| [Training Completion Status](CodeSystem-psv-completion-status-cs.md) | Completion state for a training program. |
| [Training Type](CodeSystem-psv-training-type-cs.md) | Types of postgraduate clinical training programs. |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| |
| :--- |
| [Active Sanction Flag (Board Suspension)](Flag-flag-license-sanction.md) |
| [Board Final Order (Suspension)](DocumentReference-doc-suspension-order.md) |
| [Board Verification Response (JSON)](DocumentReference-docref-board-response.md) |
| [CSR Lookup — Florida (CSR-7744)](DocumentReference-docref-csr-fl-7744.md) |
| [CSR Lookup — Georgia (CSR-GA-2219)](DocumentReference-docref-csr-ga-2219.md) |
| [City Medical Center GME — Verification API](Endpoint-endpoint-citymed-gme.md) |
| [City Medical Center — GME](Organization-org-citymed-gme.md) |
| [DEA Diversion Control Division](Organization-org-dea-diversion.md) |
| [DEA Diversion Control — Verification API](Endpoint-endpoint-dea-diversion.md) |
| [DEA Registration Lookup (AB1234567)](DocumentReference-docref-dea-AB1234567.md) |
| [DEA Registration Lookup (BA7654321)](DocumentReference-docref-dea-BA7654321.md) |
| [Degree Verification — BS](DocumentReference-docref-education-bs.md) |
| [Diploma / Degree Verification — MD](DocumentReference-docref-education-md.md) |
| [Fellowship Verification — Cardiovascular Disease](DocumentReference-docref-training-fellowship-card.md) |
| [Florida Board of Medicine](Organization-org-florida-medical-board.md) |
| [Florida CSR — Verification API](Endpoint-endpoint-florida-csr-verify.md) |
| [Florida Department of Health — CSR](Organization-org-florida-csr-authority.md) |
| [Heart Institute — Fellowship Verification API](Endpoint-endpoint-heartinst-fellowships.md) |
| [National Heart Institute](Organization-org-heart-institute.md) |
| [PSVPractitioner — Board certification(s) with VR, Provenance, Evidence](Practitioner-prac-boards-with-vr.md) |
| [PSVPractitioner — DEA registration(s) with VR, Provenance, Evidence](Practitioner-prac-dea-with-vr.md) |
| [PSVPractitioner — Education (degree) with VR, Provenance, Evidence](Practitioner-prac-education-with-vr.md) |
| [PSVPractitioner — License slice populated](Practitioner-prac-jordan-rivera-license-only.md) |
| [PSVPractitioner — State CSR with VR, Provenance, Evidence](Practitioner-prac-state-csr-with-vr.md) |
| [PSVPractitioner — Training (residency & fellowship) with VR, Provenance, Evidence](Practitioner-prac-training-with-vr.md) |
| [Practitioner with License, Sanction, Flag, Evidence](Practitioner-prac-sanction-demo.md) |
| [Provenance for VR — Alex Smith License](Provenance-prov-vr-alex-smith-license-2025Q1.md) |
| [Provenance for VR — DEA AB1234567](Provenance-prov-vr-dea-AB1234567.md) |
| [Provenance for VR — DEA BA7654321](Provenance-prov-vr-dea-BA7654321.md) |
| [Provenance — Apply Board Suspension](Provenance-prov-sanction-apply.md) |
| [Provenance — FL CSR VR](Provenance-prov-vr-csr-fl-7744.md) |
| [Provenance — GA CSR VR](Provenance-prov-vr-csr-ga-2219.md) |
| [Provenance — VR BS Degree](Provenance-prov-vr-education-bs.md) |
| [Provenance — VR Fellowship (Cardiology)](Provenance-prov-vr-training-fellowship-card.md) |
| [Provenance — VR MD Degree](Provenance-prov-vr-education-md.md) |
| [Provenance — VR Residency (IM)](Provenance-prov-vr-training-residency-im.md) |
| [Residency Verification — Internal Medicine](DocumentReference-docref-training-residency-im.md) |
| [State University College of Medicine](Organization-org-state-university-med.md) |
| [State University Registrar — Verification API](Endpoint-endpoint-state-university-registrar.md) |
| [VR — Alex Smith License (2025 Q1)](VerificationResult-vr-alex-smith-license-2025Q1.md) |
| [VR — BS Degree (Primary Source)](VerificationResult-vr-education-bs.md) |
| [VR — DEA AB1234567 (Primary Source)](VerificationResult-vr-dea-AB1234567.md) |
| [VR — DEA BA7654321 (Primary Source)](VerificationResult-vr-dea-BA7654321.md) |
| [VR — FL CSR (Primary Source)](VerificationResult-vr-csr-fl-7744.md) |
| [VR — Fellowship (Cardiology) Primary Source](VerificationResult-vr-training-fellowship-card.md) |
| [VR — GA CSR (Primary Source)](VerificationResult-vr-csr-ga-2219.md) |
| [VR — License Suspension from State Board](VerificationResult-vr-license-suspension.md) |
| [VR — MD Degree (Primary Source)](VerificationResult-vr-education-md.md) |
| [VR — Residency (IM) Primary Source](VerificationResult-vr-training-residency-im.md) |
| [VR — State License Primary Source](VerificationResult-vr-license-jordan-rivera.md) |
| [docref-abem-verification](DocumentReference-docref-abem-verification.md) |
| [docref-abim-verification](DocumentReference-docref-abim-verification.md) |
| [endpoint-abem-verify](Endpoint-endpoint-abem-verify.md) |
| [endpoint-abim-verify](Endpoint-endpoint-abim-verify.md) |
| [endpoint-florida-board-verify](Endpoint-endpoint-florida-board-verify.md) |
| [flag-license-sanction-example](Flag-flag-license-sanction-example.md) |
| [org-abem](Organization-org-abem.md) |
| [org-abim](Organization-org-abim.md) |
| [prov-vr-prac-boards-abem](Provenance-prov-vr-prac-boards-abem.md) |
| [prov-vr-prac-boards-abim](Provenance-prov-vr-prac-boards-abim.md) |
| [vr-prac-boards-abem](VerificationResult-vr-prac-boards-abem.md) |
| [vr-prac-boards-abim](VerificationResult-vr-prac-boards-abim.md) |

