# Practitioner Credentials IG — Vision, Scoping, and Alignment
_Date: 2025-10-23_

## Vision & Scoping

### Vision
Enable any primary source of practitioner credentials (state boards, education/training programs, certifying bodies, DEA, etc.) to publish high-trust, interoperable data through **consistent FHIR-based structure** based on thier legacy systems and data. The IG provides:
- A **canonical data model** for credentials and verification events.
- **Low-friction publication patterns** (file drop, Batch/Bundle, Bulk, REST).
- **Provenance and verification requirements** that elevate trust downstream.

### Problem Statement
Primary practitioner qualification sources can be understaffed and underfunded; they rely on stable but **heterogeneous legacy exports** (CSV, XML, fixed-width, proprietary DB dumps). The lack of a uniform structure and uneven provenance makes it hard for consumers (providers, payers, boards, vendors) to **trust, reconcile, and automate** credentialing processes. Many source rely on attestation as the only means of verification.

**We will:**
1. Define a minimal, testable **credential data standard** using FHIR profiles that can be populated from legacy exports.
2. Require **machine-readable provenance and verification** so consumers can measure trust.
3. Offer **migration-friendly exchange patterns** (file → FHIR transforms, Batch/Bundle, NDJSON Bulk, REST).
4. Provide **conformance tests and KPIs** to prove data quality improves over time.

### Audience
- **Primary sources (publishers):** state licensing boards, education/training programs, certifying boards, DEA registrant feed owners.
- **Relying parties (consumers):** provider organizations, delegated credentialing vendors, payers, HIEs, directories, staffing locums.
- **Platform vendors:** FHIR server vendors, ETL/MDM/DQ vendors, integration platforms.

### Target Implementers & Actors
**Actors**
- **Primary Source System** (Publisher)
- **Transformation/Mediation Service** (optional adapter that turns legacy exports into FHIR)
- **Credential Consumer System** (ingests, validates, reconciles)
- **Trust & DQ Service** (runs verification, dedupe, survivorship, KPI scoring)
- **Directory/Registry** (optional index of practitioners & endpoints)

**Implementer types**
- Providers (HR/credentialing teams), Boards, Payers, Credentialing Vendors, Directory Vendors, Middleware/ETL Vendors.

### Core Use Cases (initial wave)
1. **License publication** (state license lifecycle, status, class, discipline actions).
2. **DEA registration** (number, schedules, status, expiration).
3. **Education & training** (degree, program, dates, completion).
4. **Board certification** (issuing body, specialty, status).
5. **Verification events** (who verified what, when, against which source & criteria).
6. **Document support** (scanned letters/certificates with hashes, not as sole truth).
7. **Provenance for every assertion** (source system, authoring org, export job).

### Out of Scope (initial)
- Clinical privileges and payor enrollment determinations.
- Real-time adjudication/appeals workflows.
- Identity proofing beyond identifiers & match guidance (may be future phase).

### Assumptions & Constraints
- Publishers can **continue legacy exports**; conversion happens via adapter patterns.
- **Minimal new data capture**; prioritize fields present in 80–90% of sources.
- Prefer **codes from widely used terminologies**; supply local→canonical maps.

### Deliverables (Phase 1)
- FHIR profiles & extensions for: **Practitioner**, **PractitionerRole**, **Organization**, **VerificationResult**, **Provenance**, **DocumentReference**, **Endpoint**, **Bundle** (Batch/Transaction), **ValueSets/CodeSystems** for credential kinds/statuses.
- **Implementation patterns**: File → FHIR transforms, Batch/Bundle examples, Bulk (NDJSON), REST examples.
- **Conformance tests** (examples + test scripts).
- **KPI** (see below).
- **Field-level mapping templates** (primary source data → FHIR paths).
- **Reference transformations** (pseudo-mappings for common export archetypes).


**KPIs**
- **Completeness**: required fields per credential type filled (≥80%); optional fields prioritized by weight.
- **Freshness/Timeliness**: median lag from source update to published FHIR (e.g., ≤7 days file-based; ≤24h for REST).
- **Verification Coverage**: % credentials with an associated **VerificationResult** (target ≥80%).
- **Provenance Coverage**: % resources with **Provenance** linking to original source export (target ≥80%).
- **Identity Match Quality**: precision/recall for practitioner matching (measured against truth sets).
- **De-duplication Rate**: reduction in duplicate practitioner identifiers after ingestion (target ≥50% drop).
- **Conformance Pass Rate**: profile validation + narrative invariants (target ≥95% of instances).
- **Document Traceability**: % DocumentReference with hash/integrity checks (target ≥80%).

**Exit Artifact**: **1–2 page charter** covering the above goals, scope, stakeholders, milestones, success criteria, and KPIs.



## Landscape & Alignment

### Anchor Specs to Inherit From
- **FHIR R4 / R5** (data model & RESTful patterns)
- **US Core** (patient/practitioner/organization baselines, identifiers & search norms)
- **National Directory** (organizational & endpoint interoperability patterns; directory alignment)
- **IPA (International Patient Access)** (general cross-realm access patterns and search discipline)

### Compatibility Strategy (Inherit / Constrain / Extend)

| Spec / Asset | Why it matters | Strategy | Notes for this IG |
|---|---|---|---|
| **FHIR R4 (base)** | Broadest ecosystem support today | **Inherit** minimums | Default wire model; allow R5-inspired patterns behind extensions only if required. |
| **FHIR R5 (select resources)** | Mature **VerificationResult** refinements & Provenance richness | **Constrain (R4-compatible)**, **Extend** where needed | If gaps exist in R4 for verification, define extensions with forward-compatibility to R5 elements. |
| **US Core** | Identifier handling, Practitioner/Organization norms, search params | **Constrain** | Reuse identifier patterns (e.g., NPI), address field conventions, and supported search parameters. |
| **National Directory** | Organization/Endpoint canonicalization, exchange patterns | **Constrain / Align** | Align Organization/Endpoint/PractitionerRole structure to ease directory publication & discovery. |
| **Bulk Data (Flat FHIR)** | Large periodic exports from publishers | **Inherit** | Recommend NDJSON for periodic dumps; provide sample manifests and minimal profiles. |
| **Provenance** | Trust & lineage | **Constrain** | Mandate minimal Provenance agents/activities linking to original system/export job. |
| **VerificationResult** | First-class verification evidence | **Constrain / Extend** | Require verification status, validationType, target references; add code systems for verification outcomes. |
| **DocumentReference** | Attachments for evidence | **Constrain** | Hash/integrity metadata required; discourage PDFs as the sole truth. |

### Profiles & Slices (initial catalog)
- **Practitioner**: identifiers (NPI, state license identifiers, DEA number where appropriate), name, telecom.
- **Practitioner.qualification** (**sliced** by credential type):  
  - **state-license** (jurisdiction, status, class, expiration)  
  - **dea-registration** (number, schedules, status, expiration)  
  - **education** (institution, degree, dates)  
  - **training** (program, specialty, dates)  
  - **board-certification** (issuing body, specialty, status, cycle)
  - **ETC** (Others to be add as discovered)
- **VerificationResult**: one per assertion/qualification (or grouped by bundle run), linking to targets with validationStatus, validationType, need, frequency, primarySource, attestation if applicable.
- **Provenance**: one per resource (or per bundle) with **agent** = source org; **activity** = export job; **entity** = original file (with checksum).
- **Organization** (issuing bodies, licensing boards), **Endpoint** (for automated retrieval), **DocumentReference** (scanned artifacts with integrity).
- **Bundle**: **batch** for periodic loads; **transaction** optional for upserts.

