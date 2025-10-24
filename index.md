# Index - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* **Index**

## Index

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/ImplementationGuide/credentials-psv-primarysource | *Version*:1.0.0 |
| Active as of 2020-02-26 | *Computable Name*:Credentials_PSV_PrimarySource |

# Practitioner Credentials IG — Vision, Scoping, and Alignment

**Date: 2025-10-23**

## Vision & Scoping

### Vision

Enable any primary source of practitioner credentials (state boards, education/training programs, certifying bodies, DEA, etc.) to publish high-trust, interoperable data through **consistent FHIR-based structure** based on thier legacy systems and data. The IG provides:

* A **canonical data model** for credentials and verification events.
* **Low-friction publication patterns** (file drop, Batch/Bundle, Bulk, REST).
* **Provenance and verification requirements** that elevate trust downstream.

### Problem Statement

Primary practitioner qualification sources can be understaffed and underfunded; they rely on stable but **heterogeneous legacy exports** (CSV, XML, fixed-width, proprietary DB dumps). The lack of a uniform structure and uneven provenance makes it hard for consumers (providers, payers, boards, vendors) to **trust, reconcile, and automate** credentialing processes. Many source rely on attestation as the only means of verification.

**We will:**

1. Define a minimal, testable**credential data standard**using FHIR profiles that can be populated from legacy exports.
1. Require**machine-readable provenance and verification**so consumers can measure trust.
1. Offer**migration-friendly exchange patterns**(file → FHIR transforms, Batch/Bundle, NDJSON Bulk, REST).
1. Provide**conformance tests and KPIs**to prove data quality improves over time.

### Audience

* **Primary sources (publishers):** state licensing boards, education/training programs, certifying boards, DEA registrant feed owners.
* **Relying parties (consumers):** provider organizations, delegated credentialing vendors, payers, HIEs, directories, staffing locums.
* **Platform vendors:** FHIR server vendors, ETL/MDM/DQ vendors, integration platforms.

### Target Implementers & Actors

**Actors**

* **Primary Source System** (Publisher)
* **Transformation/Mediation Service** (optional adapter that turns legacy exports into FHIR)
* **Credential Consumer System** (ingests, validates, reconciles)
* **Trust & DQ Service** (runs verification, dedupe, survivorship, KPI scoring)
* **Directory/Registry** (optional index of practitioners & endpoints)

**Implementer types**

* Providers (HR/credentialing teams), Boards, Payers, Credentialing Vendors, Directory Vendors, Middleware/ETL Vendors.

### Core Use Cases (initial wave)

1. **License publication**(state license lifecycle, status, class, discipline actions).
1. **DEA registration**(number, schedules, status, expiration).
1. **Education & training**(degree, program, dates, completion).
1. **Board certification**(issuing body, specialty, status).
1. **Verification events**(who verified what, when, against which source & criteria).
1. **Document support**(scanned letters/certificates with hashes, not as sole truth).
1. **Provenance for every assertion**(source system, authoring org, export job).

### Out of Scope (initial)

* Clinical privileges and payor enrollment determinations.
* Real-time adjudication/appeals workflows.
* Identity proofing beyond identifiers & match guidance (may be future phase).

### Assumptions & Constraints

* Publishers can **continue legacy exports**; conversion happens via adapter patterns.
* **Minimal new data capture**; prioritize fields present in 80–90% of sources.
* Prefer **codes from widely used terminologies**; supply local→canonical maps.

### Deliverables (Phase 1)

* FHIR profiles & extensions for: **Practitioner**, **PractitionerRole**, **Organization**, **VerificationResult**, **Provenance**, **DocumentReference**, **Endpoint**, **Bundle** (Batch/Transaction), **ValueSets/CodeSystems** for credential kinds/statuses.
* **Implementation patterns**: File → FHIR transforms, Batch/Bundle examples, Bulk (NDJSON), REST examples.
* **Conformance tests** (examples + test scripts).
* **KPI** (see below).
* **Field-level mapping templates** (primary source data → FHIR paths).
* **Reference transformations** (pseudo-mappings for common export archetypes).

**KPIs**

* **Completeness**: required fields per credential type filled (≥80%); optional fields prioritized by weight.
* **Freshness/Timeliness**: median lag from source update to published FHIR (e.g., ≤7 days file-based; ≤24h for REST).
* **Verification Coverage**: % credentials with an associated **VerificationResult** (target ≥80%).
* **Provenance Coverage**: % resources with **Provenance** linking to original source export (target ≥80%).
* **Identity Match Quality**: precision/recall for practitioner matching (measured against truth sets).
* **De-duplication Rate**: reduction in duplicate practitioner identifiers after ingestion (target ≥50% drop).
* **Conformance Pass Rate**: profile validation + narrative invariants (target ≥95% of instances).
* **Document Traceability**: % DocumentReference with hash/integrity checks (target ≥80%).

**Exit Artifact**: **1–2 page charter** covering the above goals, scope, stakeholders, milestones, success criteria, and KPIs.

## Landscape & Alignment

### Anchor Specs to Inherit From

* **FHIR R4 / R5** (data model & RESTful patterns)
* **US Core** (patient/practitioner/organization baselines, identifiers & search norms)
* **National Directory** (organizational & endpoint interoperability patterns; directory alignment)
* **IPA (International Patient Access)** (general cross-realm access patterns and search discipline)

### Compatibility Strategy (Inherit / Constrain / Extend)

| | | | |
| :--- | :--- | :--- | :--- |
| **FHIR R4 (base)** | Broadest ecosystem support today | **Inherit**minimums | Default wire model; allow R5-inspired patterns behind extensions only if required. |
| **FHIR R5 (select resources)** | Mature**VerificationResult**refinements & Provenance richness | **Constrain (R4-compatible)**,**Extend**where needed | If gaps exist in R4 for verification, define extensions with forward-compatibility to R5 elements. |
| **US Core** | Identifier handling, Practitioner/Organization norms, search params | **Constrain** | Reuse identifier patterns (e.g., NPI), address field conventions, and supported search parameters. |
| **National Directory** | Organization/Endpoint canonicalization, exchange patterns | **Constrain / Align** | Align Organization/Endpoint/PractitionerRole structure to ease directory publication & discovery. |
| **Bulk Data (Flat FHIR)** | Large periodic exports from publishers | **Inherit** | Recommend NDJSON for periodic dumps; provide sample manifests and minimal profiles. |
| **Provenance** | Trust & lineage | **Constrain** | Mandate minimal Provenance agents/activities linking to original system/export job. |
| **VerificationResult** | First-class verification evidence | **Constrain / Extend** | Require verification status, validationType, target references; add code systems for verification outcomes. |
| **DocumentReference** | Attachments for evidence | **Constrain** | Hash/integrity metadata required; discourage PDFs as the sole truth. |

### Profiles & Slices (initial catalog)

* **Practitioner**: identifiers (NPI, state license identifiers, DEA number where appropriate), name, telecom.
* **Practitioner.qualification** (**sliced** by credential type): 
* **state-license** (jurisdiction, status, class, expiration)
* **dea-registration** (number, schedules, status, expiration)
* **education** (institution, degree, dates)
* **training** (program, specialty, dates)
* **board-certification** (issuing body, specialty, status, cycle)
* **ETC** (Others to be add as discovered)
 
* **VerificationResult**: one per assertion/qualification (or grouped by bundle run), linking to targets with validationStatus, validationType, need, frequency, primarySource, attestation if applicable.
* **Provenance**: one per resource (or per bundle) with **agent** = source org; **activity** = export job; **entity** = original file (with checksum).
* **Organization** (issuing bodies, licensing boards), **Endpoint** (for automated retrieval), **DocumentReference** (scanned artifacts with integrity).
* **Bundle**: **batch** for periodic loads; **transaction** optional for upserts.



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "credentials-psv-primarysource",
  "url" : "http://example.com/fhir/psv/ImplementationGuide/credentials-psv-primarysource",
  "version" : "1.0.0",
  "name" : "Credentials_PSV_PrimarySource",
  "title" : "Credentials PSV Primary Source IG",
  "status" : "active",
  "date" : "2020-02-26",
  "description" : "Implementation Guide for Practitioner Qualifications and Primary Source Verification.",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
          "code" : "001",
          "display" : "World"
        }
      ]
    }
  ],
  "packageId" : "credentials-psv-primarysource",
  "license" : "CC0-1.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [
    {
      "id" : "hl7tx",
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
          "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
        }
      ],
      "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
      "packageId" : "hl7.terminology.r4",
      "version" : "6.5.0"
    },
    {
      "id" : "hl7ext",
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
          "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
        }
      ],
      "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
      "packageId" : "hl7.fhir.uv.extensions.r4",
      "version" : "5.2.0"
    }
  ],
  "definition" : {
    "extension" : [
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "copyrightyear"
          },
          {
            "url" : "value",
            "valueString" : "2025+"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "releaselabel"
          },
          {
            "url" : "value",
            "valueString" : "ci-build"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "autoload-resources"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "template/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "input/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-qa"
          },
          {
            "url" : "value",
            "valueString" : "temp/qa"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-temp"
          },
          {
            "url" : "value",
            "valueString" : "temp/pages"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-output"
          },
          {
            "url" : "value",
            "valueString" : "output"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-suppressed-warnings"
          },
          {
            "url" : "value",
            "valueString" : "input/ignoreWarnings.txt"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "path-history"
          },
          {
            "url" : "value",
            "valueString" : "http://example.com/fhir/psv/history.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "template-html"
          },
          {
            "url" : "value",
            "valueString" : "template-page.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "template-md"
          },
          {
            "url" : "value",
            "valueString" : "template-page-md.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-contact"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-context"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-copyright"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-jurisdiction"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-license"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-publisher"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-version"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "apply-wg"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "active-tables"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "fmm-definition"
          },
          {
            "url" : "value",
            "valueString" : "http://hl7.org/fhir/versions.html#maturity"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "propagate-status"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "excludelogbinaryformat"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueString" : "tabbed-snapshots"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
        "valueCode" : "hl7.fhir.uv.tools.r4#0.8.0"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "copyrightyear"
          },
          {
            "url" : "value",
            "valueString" : "2025+"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "releaselabel"
          },
          {
            "url" : "value",
            "valueString" : "ci-build"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "autoload-resources"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "template/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-liquid"
          },
          {
            "url" : "value",
            "valueString" : "input/liquid"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-qa"
          },
          {
            "url" : "value",
            "valueString" : "temp/qa"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-temp"
          },
          {
            "url" : "value",
            "valueString" : "temp/pages"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-output"
          },
          {
            "url" : "value",
            "valueString" : "output"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-suppressed-warnings"
          },
          {
            "url" : "value",
            "valueString" : "input/ignoreWarnings.txt"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "path-history"
          },
          {
            "url" : "value",
            "valueString" : "http://example.com/fhir/psv/history.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "template-html"
          },
          {
            "url" : "value",
            "valueString" : "template-page.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "template-md"
          },
          {
            "url" : "value",
            "valueString" : "template-page-md.html"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-contact"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-context"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-copyright"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-jurisdiction"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-license"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-publisher"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-version"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "apply-wg"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "active-tables"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "fmm-definition"
          },
          {
            "url" : "value",
            "valueString" : "http://hl7.org/fhir/versions.html#maturity"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "propagate-status"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "excludelogbinaryformat"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      },
      {
        "extension" : [
          {
            "url" : "code",
            "valueCode" : "tabbed-snapshots"
          },
          {
            "url" : "value",
            "valueString" : "true"
          }
        ],
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
      }
    ],
    "resource" : [
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/action"
        },
        "name" : "Action",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Flag"
          }
        ],
        "reference" : {
          "reference" : "Flag/flag-license-sanction"
        },
        "name" : "Active Sanction Flag (Board Suspension)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "DocumentReference"
          }
        ],
        "reference" : {
          "reference" : "DocumentReference/doc-suspension-order"
        },
        "name" : "Board Final Order (Suspension)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "DocumentReference"
          }
        ],
        "reference" : {
          "reference" : "DocumentReference/docref-board-response"
        },
        "name" : "Board Verification Response (JSON)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/psv-board-specialty-cs"
        },
        "name" : "Board/Training Specialty (Minimal)",
        "description" : "Minimal specialty codes used in examples. Replace/expand with your authoritative list.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Endpoint"
          }
        ],
        "reference" : {
          "reference" : "Endpoint/endpoint-citymed-gme"
        },
        "name" : "City Medical Center GME — Verification API",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Organization"
          }
        ],
        "reference" : {
          "reference" : "Organization/org-citymed-gme"
        },
        "name" : "City Medical Center — GME",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "DocumentReference"
          }
        ],
        "reference" : {
          "reference" : "DocumentReference/docref-csr-fl-7744"
        },
        "name" : "CSR Lookup — Florida (CSR-7744)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "DocumentReference"
          }
        ],
        "reference" : {
          "reference" : "DocumentReference/docref-csr-ga-2219"
        },
        "name" : "CSR Lookup — Georgia (CSR-GA-2219)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/psv-dea-schedule-cs"
        },
        "name" : "DEA Controlled Substance Schedules (II–V)",
        "description" : "Subset of U.S. controlled substance schedules commonly applicable to prescribers. Schedule I excluded.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Organization"
          }
        ],
        "reference" : {
          "reference" : "Organization/org-dea-diversion"
        },
        "name" : "DEA Diversion Control Division",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Endpoint"
          }
        ],
        "reference" : {
          "reference" : "Endpoint/endpoint-dea-diversion"
        },
        "name" : "DEA Diversion Control — Verification API",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/psv-dea-registrant-type-cs"
        },
        "name" : "DEA Registrant Type",
        "description" : "DEA registrant categories relevant to care delivery and dispensing.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "DocumentReference"
          }
        ],
        "reference" : {
          "reference" : "DocumentReference/docref-dea-AB1234567"
        },
        "name" : "DEA Registration Lookup (AB1234567)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "DocumentReference"
          }
        ],
        "reference" : {
          "reference" : "DocumentReference/docref-dea-BA7654321"
        },
        "name" : "DEA Registration Lookup (BA7654321)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "DocumentReference"
          }
        ],
        "reference" : {
          "reference" : "DocumentReference/docref-education-bs"
        },
        "name" : "Degree Verification — BS",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "DocumentReference"
          }
        ],
        "reference" : {
          "reference" : "DocumentReference/docref-education-md"
        },
        "name" : "Diploma / Degree Verification — MD",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "DocumentReference"
          }
        ],
        "reference" : {
          "reference" : "DocumentReference/docref-abem-verification"
        },
        "name" : "docref-abem-verification",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "DocumentReference"
          }
        ],
        "reference" : {
          "reference" : "DocumentReference/docref-abim-verification"
        },
        "name" : "docref-abim-verification",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Endpoint"
          }
        ],
        "reference" : {
          "reference" : "Endpoint/endpoint-abem-verify"
        },
        "name" : "endpoint-abem-verify",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Endpoint"
          }
        ],
        "reference" : {
          "reference" : "Endpoint/endpoint-abim-verify"
        },
        "name" : "endpoint-abim-verify",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Endpoint"
          }
        ],
        "reference" : {
          "reference" : "Endpoint/endpoint-florida-board-verify"
        },
        "name" : "endpoint-florida-board-verify",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "DocumentReference"
          }
        ],
        "reference" : {
          "reference" : "DocumentReference/docref-training-fellowship-card"
        },
        "name" : "Fellowship Verification — Cardiovascular Disease",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/flag-evidence"
        },
        "name" : "Flag Evidence (VerificationResult link)",
        "description" : "Carries a reference to the VerificationResult that justifies this Flag.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/flag-targetLocation"
        },
        "name" : "Flag Target Location (element path)",
        "description" : "Optional element path (e.g., qualification[license][0]) for UI deep-linking.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Flag"
          }
        ],
        "reference" : {
          "reference" : "Flag/flag-license-sanction-example"
        },
        "name" : "flag-license-sanction-example",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Organization"
          }
        ],
        "reference" : {
          "reference" : "Organization/org-florida-medical-board"
        },
        "name" : "Florida Board of Medicine",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Endpoint"
          }
        ],
        "reference" : {
          "reference" : "Endpoint/endpoint-florida-csr-verify"
        },
        "name" : "Florida CSR — Verification API",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Organization"
          }
        ],
        "reference" : {
          "reference" : "Organization/org-florida-csr-authority"
        },
        "name" : "Florida Department of Health — CSR",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Endpoint"
          }
        ],
        "reference" : {
          "reference" : "Endpoint/endpoint-heartinst-fellowships"
        },
        "name" : "Heart Institute — Fellowship Verification API",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Organization"
          }
        ],
        "reference" : {
          "reference" : "Organization/org-heart-institute"
        },
        "name" : "National Heart Institute",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Organization"
          }
        ],
        "reference" : {
          "reference" : "Organization/org-abem"
        },
        "name" : "org-abem",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Organization"
          }
        ],
        "reference" : {
          "reference" : "Organization/org-abim"
        },
        "name" : "org-abim",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Practitioner"
          }
        ],
        "reference" : {
          "reference" : "Practitioner/prac-sanction-demo"
        },
        "name" : "Practitioner with License, Sanction, Flag, Evidence",
        "exampleCanonical" : "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Provenance"
          }
        ],
        "reference" : {
          "reference" : "Provenance/prov-vr-prac-boards-abem"
        },
        "name" : "prov-vr-prac-boards-abem",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Provenance"
          }
        ],
        "reference" : {
          "reference" : "Provenance/prov-vr-prac-boards-abim"
        },
        "name" : "prov-vr-prac-boards-abim",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Provenance"
          }
        ],
        "reference" : {
          "reference" : "Provenance/prov-vr-alex-smith-license-2025Q1"
        },
        "name" : "Provenance for VR — Alex Smith License",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Provenance"
          }
        ],
        "reference" : {
          "reference" : "Provenance/prov-vr-dea-AB1234567"
        },
        "name" : "Provenance for VR — DEA AB1234567",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Provenance"
          }
        ],
        "reference" : {
          "reference" : "Provenance/prov-vr-dea-BA7654321"
        },
        "name" : "Provenance for VR — DEA BA7654321",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Provenance"
          }
        ],
        "reference" : {
          "reference" : "Provenance/prov-sanction-apply"
        },
        "name" : "Provenance — Apply Board Suspension",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Provenance"
          }
        ],
        "reference" : {
          "reference" : "Provenance/prov-vr-csr-fl-7744"
        },
        "name" : "Provenance — FL CSR VR",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Provenance"
          }
        ],
        "reference" : {
          "reference" : "Provenance/prov-vr-csr-ga-2219"
        },
        "name" : "Provenance — GA CSR VR",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Provenance"
          }
        ],
        "reference" : {
          "reference" : "Provenance/prov-vr-education-bs"
        },
        "name" : "Provenance — VR BS Degree",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Provenance"
          }
        ],
        "reference" : {
          "reference" : "Provenance/prov-vr-training-fellowship-card"
        },
        "name" : "Provenance — VR Fellowship (Cardiology)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Provenance"
          }
        ],
        "reference" : {
          "reference" : "Provenance/prov-vr-education-md"
        },
        "name" : "Provenance — VR MD Degree",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Provenance"
          }
        ],
        "reference" : {
          "reference" : "Provenance/prov-vr-training-residency-im"
        },
        "name" : "Provenance — VR Residency (IM)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/psv-action-cs"
        },
        "name" : "PSV  Action CodeSystem",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/psv-action-vs"
        },
        "name" : "PSV Action",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/psv-activity-definition"
        },
        "name" : "PSV ActivityDefinition (Verification Activity)",
        "description" : "Defines a concrete verification activity to be performed by a worker/system.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/psv-audit-event"
        },
        "name" : "PSV AuditEvent",
        "description" : "System-level audit of verification operations.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/psv-endpoint"
        },
        "name" : "PSV Endpoint (US Core derived)",
        "description" : "Endpoints for boards/registries/verifiers.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/psv-evidence-binary"
        },
        "name" : "PSV Evidence Binary",
        "description" : "Raw binary artifact (hashable).",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/psv-evidence-document"
        },
        "name" : "PSV Evidence Document",
        "description" : "Stores document artifacts (PDF, CSV, screenshots) used as evidence.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/psv-measure"
        },
        "name" : "PSV Measure",
        "description" : "Aggregates verification coverage or SLA metrics.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/psv-measure-report"
        },
        "name" : "PSV MeasureReport",
        "description" : "Reports metrics for verification coverage/SLA.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/psv-organization"
        },
        "name" : "PSV Organization (US Core derived)",
        "description" : "Represents employers, boards (validators), certifying bodies, accreditors.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/psv-organizationaffiliation"
        },
        "name" : "PSV OrganizationAffiliation",
        "description" : "Privileges and affiliations between organizations and practitioners.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/psv-plan-definition"
        },
        "name" : "PSV PlanDefinition (Policy)",
        "description" : "Defines policy (frequency, method, failure action) for verification types.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/PSVPractitioner"
        },
        "name" : "PSV Practitioner with Qualification Slices (Common Pattern + Rules)",
        "description" : "Practitioner profile with typed qualification slices and shared invariants for credentialing.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/psv-practitionerrole"
        },
        "name" : "PSV PractitionerRole (US Core derived)",
        "description" : "PractitionerRole for roles/specialties linked to organizations.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/psv-provenance"
        },
        "name" : "PSV Provenance (US Core derived)",
        "description" : "Audits VerificationResult with evidence entities (CSV snapshot, API receipt, PDF).",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/psv-verification-task"
        },
        "name" : "PSV Verification Task",
        "description" : "Requests execution of a verification (e.g., LEIE monthly, license quarterly).",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/psv-verification-type-vs"
        },
        "name" : "PSV Verification Type",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/psv-verification-type-cs"
        },
        "name" : "PSV Verification Type CodeSystem",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/psv-verificationresult"
        },
        "name" : "PSV VerificationResult",
        "description" : "Standard verification evidence linking validators to verified targets.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Practitioner"
          }
        ],
        "reference" : {
          "reference" : "Practitioner/prac-boards-with-vr"
        },
        "name" : "PSVPractitioner — Board certification(s) with VR, Provenance, Evidence",
        "exampleCanonical" : "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Practitioner"
          }
        ],
        "reference" : {
          "reference" : "Practitioner/prac-dea-with-vr"
        },
        "name" : "PSVPractitioner — DEA registration(s) with VR, Provenance, Evidence",
        "exampleCanonical" : "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Practitioner"
          }
        ],
        "reference" : {
          "reference" : "Practitioner/prac-education-with-vr"
        },
        "name" : "PSVPractitioner — Education (degree) with VR, Provenance, Evidence",
        "exampleCanonical" : "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Practitioner"
          }
        ],
        "reference" : {
          "reference" : "Practitioner/prac-jordan-rivera-license-only"
        },
        "name" : "PSVPractitioner — License slice populated",
        "exampleCanonical" : "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Practitioner"
          }
        ],
        "reference" : {
          "reference" : "Practitioner/prac-state-csr-with-vr"
        },
        "name" : "PSVPractitioner — State CSR with VR, Provenance, Evidence",
        "exampleCanonical" : "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Practitioner"
          }
        ],
        "reference" : {
          "reference" : "Practitioner/prac-training-with-vr"
        },
        "name" : "PSVPractitioner — Training (residency & fellowship) with VR, Provenance, Evidence",
        "exampleCanonical" : "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner"
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/qualification-restriction"
        },
        "name" : "Qualification Restriction",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/qualification-specialty"
        },
        "name" : "Qualification Specialty",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/qualification-status"
        },
        "name" : "Qualification Status",
        "description" : "Status of a credential/qualification entry (e.g., active, expired, suspended).",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/psv-qualification-status-cs"
        },
        "name" : "Qualification Status",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "DocumentReference"
          }
        ],
        "reference" : {
          "reference" : "DocumentReference/docref-training-residency-im"
        },
        "name" : "Residency Verification — Internal Medicine",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Organization"
          }
        ],
        "reference" : {
          "reference" : "Organization/org-state-university-med"
        },
        "name" : "State University College of Medicine",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Endpoint"
          }
        ],
        "reference" : {
          "reference" : "Endpoint/endpoint-state-university-registrar"
        },
        "name" : "State University Registrar — Verification API",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/completion-status"
        },
        "name" : "Training Completion Status",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/psv-completion-status-cs"
        },
        "name" : "Training Completion Status",
        "description" : "Completion state for a training program.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/training-type"
        },
        "name" : "Training Type",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/psv-training-type-cs"
        },
        "name" : "Training Type",
        "description" : "Types of postgraduate clinical training programs.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "VerificationResult"
          }
        ],
        "reference" : {
          "reference" : "VerificationResult/vr-alex-smith-license-2025Q1"
        },
        "name" : "VR — Alex Smith License (2025 Q1)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "VerificationResult"
          }
        ],
        "reference" : {
          "reference" : "VerificationResult/vr-education-bs"
        },
        "name" : "VR — BS Degree (Primary Source)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "VerificationResult"
          }
        ],
        "reference" : {
          "reference" : "VerificationResult/vr-dea-AB1234567"
        },
        "name" : "VR — DEA AB1234567 (Primary Source)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "VerificationResult"
          }
        ],
        "reference" : {
          "reference" : "VerificationResult/vr-dea-BA7654321"
        },
        "name" : "VR — DEA BA7654321 (Primary Source)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "VerificationResult"
          }
        ],
        "reference" : {
          "reference" : "VerificationResult/vr-training-fellowship-card"
        },
        "name" : "VR — Fellowship (Cardiology) Primary Source",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "VerificationResult"
          }
        ],
        "reference" : {
          "reference" : "VerificationResult/vr-csr-fl-7744"
        },
        "name" : "VR — FL CSR (Primary Source)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "VerificationResult"
          }
        ],
        "reference" : {
          "reference" : "VerificationResult/vr-csr-ga-2219"
        },
        "name" : "VR — GA CSR (Primary Source)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "VerificationResult"
          }
        ],
        "reference" : {
          "reference" : "VerificationResult/vr-license-suspension"
        },
        "name" : "VR — License Suspension from State Board",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "VerificationResult"
          }
        ],
        "reference" : {
          "reference" : "VerificationResult/vr-education-md"
        },
        "name" : "VR — MD Degree (Primary Source)",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "VerificationResult"
          }
        ],
        "reference" : {
          "reference" : "VerificationResult/vr-training-residency-im"
        },
        "name" : "VR — Residency (IM) Primary Source",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "VerificationResult"
          }
        ],
        "reference" : {
          "reference" : "VerificationResult/vr-license-jordan-rivera"
        },
        "name" : "VR — State License Primary Source",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "VerificationResult"
          }
        ],
        "reference" : {
          "reference" : "VerificationResult/vr-prac-boards-abem"
        },
        "name" : "vr-prac-boards-abem",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "VerificationResult"
          }
        ],
        "reference" : {
          "reference" : "VerificationResult/vr-prac-boards-abim"
        },
        "name" : "vr-prac-boards-abim",
        "exampleBoolean" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/psvVS-qualification-status"
        },
        "name" : "VS - Qualification Status",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/psvVS-board-specialty"
        },
        "name" : "VS — Board/Training Specialty",
        "description" : "Allowed specialties used for training/board examples.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/psvVS-dea-schedule"
        },
        "name" : "VS — DEA Controlled Substance Schedules (II–V)",
        "description" : "Allowed DEA schedules for clinician prescribing context.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/psvVS-dea-registrant-type"
        },
        "name" : "VS — DEA Registrant Type",
        "description" : "Allowed DEA registrant categories for practitioner credentialing.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/psvVS-completion-status"
        },
        "name" : "VS — Training Completion Status",
        "description" : "Allowed values for training completion status.",
        "exampleBoolean" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/psvVS-training-type"
        },
        "name" : "VS — Training Type",
        "description" : "Allowed training types for practitioner qualifications.",
        "exampleBoolean" : false
      }
    ],
    "page" : {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "toc.html"
        }
      ],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "index.html"
            }
          ],
          "nameUrl" : "index.html",
          "title" : "Index",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "StructureDefinition-psv-practitioner-intro.html"
            }
          ],
          "nameUrl" : "StructureDefinition-psv-practitioner-intro.html",
          "title" : "Structure Definition Psv Practitioner Intro",
          "generation" : "markdown"
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
              "valueUrl" : "spec.html"
            }
          ],
          "nameUrl" : "spec.html",
          "title" : "Spec",
          "generation" : "markdown"
        }
      ]
    },
    "parameter" : [
      {
        "code" : "path-resource",
        "value" : "input/capabilities"
      },
      {
        "code" : "path-resource",
        "value" : "input/examples"
      },
      {
        "code" : "path-resource",
        "value" : "input/extensions"
      },
      {
        "code" : "path-resource",
        "value" : "input/models"
      },
      {
        "code" : "path-resource",
        "value" : "input/operations"
      },
      {
        "code" : "path-resource",
        "value" : "input/profiles"
      },
      {
        "code" : "path-resource",
        "value" : "input/resources"
      },
      {
        "code" : "path-resource",
        "value" : "input/vocabulary"
      },
      {
        "code" : "path-resource",
        "value" : "input/maps"
      },
      {
        "code" : "path-resource",
        "value" : "input/testing"
      },
      {
        "code" : "path-resource",
        "value" : "input/history"
      },
      {
        "code" : "path-resource",
        "value" : "fsh-generated/resources"
      },
      {
        "code" : "path-pages",
        "value" : "template/config"
      },
      {
        "code" : "path-pages",
        "value" : "input/images"
      },
      {
        "code" : "path-tx-cache",
        "value" : "input-cache/txcache"
      }
    ]
  }
}

```
