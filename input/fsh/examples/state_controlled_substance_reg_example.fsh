// ───────── Aliases (adjust to your IG canonical) ─────────
Alias: $profPSVPractitioner   = http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner
Alias: $csQualType            = http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs
Alias: $extJurisdiction       = http://example.org/fhir/uv/psv/StructureDefinition/qualification-jurisdiction
Alias: $extStatus             = http://example.org/fhir/uv/psv/StructureDefinition/qualification-status
Alias: $csQualStatus          = http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-status-cs
Alias: $csUSPS                = http://hl7.org/fhir/us/core/CodeSystem/us-core-usps-state
Alias: $csVerifType           = http://example.org/fhir/uv/psv/CodeSystem/psv-verification-type-cs
Alias: $csVRValidationStatus  = http://terminology.hl7.org/CodeSystem/verificationresult-status

// ───────── Issuer Organization (State CSR authority) + Endpoint ─────────
Instance: endpoint-florida-csr-verify
InstanceOf: Endpoint
Usage: #example
Title: "Florida CSR — Verification API"
* status = #active
* connectionType.system = "http://terminology.hl7.org/CodeSystem/endpoint-connection-type"
* connectionType.code = #hl7-fhir-rest
* address = "https://api.flhealth.example.gov/csr/fhir"
* payloadType[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/endpoint-payload-type"
* payloadType[0].coding[0].code = #any
* payloadType[0].text = "FHIR Practitioner & VerificationResult"
* payloadMimeType[0] = #application/fhir+json

Instance: org-florida-csr-authority
InstanceOf: Organization
Usage: #example
Title: "Florida Department of Health — CSR"
* name = "Florida Department of Health — Controlled Substance Registration"
* endpoint[0] = Reference(endpoint-florida-csr-verify)

// ───────── Practitioner with STATE-CSR slice(s) ─────────
Instance: prac-state-csr-with-vr
InstanceOf: PSVPractitioner
Usage: #example
Title: "PSVPractitioner — State CSR with VR, Provenance, Evidence"
* meta.profile = $profPSVPractitioner
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[0].value  = "1098765432"
* name[0].family = "Lopez"
* name[0].given[0]  = "Mariana"

// CSR #1 — Florida CSR (required: identifier, period, issuer, jurisdiction; optional status)
* qualification[state-csr][0].code.coding[0].system = $csQualType
* qualification[state-csr][0].code.coding[0].code   = #state-csr
* qualification[state-csr][0].identifier[0].system  = "https://flhealth.example.gov/csr"
* qualification[state-csr][0].identifier[0].value   = "CSR-7744"
* qualification[state-csr][0].issuer                = Reference(org-florida-csr-authority)
* qualification[state-csr][0].period.start          = 2023-01-01
* qualification[state-csr][0].period.end            = 2026-12-31
// jurisdiction (required)
* qualification[state-csr][0].extension[+].url = $extJurisdiction
* qualification[state-csr][0].extension[=].valueCodeableConcept.coding[0].system = $csUSPS
* qualification[state-csr][0].extension[=].valueCodeableConcept.coding[0].code   = #FL
* qualification[state-csr][0].extension[=].valueCodeableConcept.coding[0].display = "Florida"
// status (optional)
* qualification[state-csr][0].extension[+].url = $extStatus
* qualification[state-csr][0].extension[=].valueCodeableConcept.coding[0].system = $csQualStatus
* qualification[state-csr][0].extension[=].valueCodeableConcept.coding[0].code   = #active

// (Optional) CSR #2 — Georgia CSR to show multiple entries (omit if you want a minimal example)
* qualification[state-csr][1].code.coding[0].system = $csQualType
* qualification[state-csr][1].code.coding[0].code   = #state-csr
* qualification[state-csr][1].identifier[0].system  = "https://dch.ga.gov/csr"
* qualification[state-csr][1].identifier[0].value   = "CSR-GA-2219"
* qualification[state-csr][1].issuer                = Reference(org-florida-csr-authority) // replace with GA issuer if you define it
* qualification[state-csr][1].period.start          = 2024-03-01
* qualification[state-csr][1].period.end            = 2027-02-28
* qualification[state-csr][1].extension[+].url = $extJurisdiction
* qualification[state-csr][1].extension[=].valueCodeableConcept.coding[0].system = $csUSPS
* qualification[state-csr][1].extension[=].valueCodeableConcept.coding[0].code   = #GA
* qualification[state-csr][1].extension[=].valueCodeableConcept.coding[0].display = "Georgia"

// ───────── Evidence: DocumentReference (one per CSR) ─────────
Instance: docref-csr-fl-7744
InstanceOf: DocumentReference
Usage: #example
Title: "CSR Lookup — Florida (CSR-7744)"
* status = #current
* type.text = "State CSR verification result"
* content[0].attachment.contentType = #application/json
* content[0].attachment.url = "https://api.flhealth.example.gov/csr/verify?id=CSR-7744"

Instance: docref-csr-ga-2219
InstanceOf: DocumentReference
Usage: #example
Title: "CSR Lookup — Georgia (CSR-GA-2219)"
* status = #current
* type.text = "State CSR verification result"
* content[0].attachment.contentType = #application/json
* content[0].attachment.url = "https://api.gahealth.example.gov/csr/verify?id=CSR-GA-2219"

// ───────── VerificationResult(s): one per CSR entry ─────────
Instance: vr-csr-fl-7744
InstanceOf: VerificationResult
Usage: #example
Title: "VR — FL CSR (Primary Source)"
* status = #validated
* statusDate = "2025-10-21T14:05:00Z"
* target[0] = Reference(prac-state-csr-with-vr)
* targetLocation[0] = "qualification[state-csr][0]"
* validationType.coding[0].system = $csVerifType
* validationType.coding[0].code   = #state-csr-primary-source
* primarySource[0].who = Reference(org-florida-csr-authority)
* primarySource[0].communicationMethod[0].text = "API lookup"
* primarySource[0].validationDate = "2025-10-21"
* primarySource[0].validationStatus.coding[0].system = $csVRValidationStatus
* primarySource[0].validationStatus.coding[0].code   = #successful

Instance: vr-csr-ga-2219
InstanceOf: VerificationResult
Usage: #example
Title: "VR — GA CSR (Primary Source)"
* status = #validated
* statusDate = "2025-10-21T14:08:00Z"
* target[0] = Reference(prac-state-csr-with-vr)
* targetLocation[0] = "qualification[state-csr][1]"
* validationType.coding[0].system = $csVerifType
* validationType.coding[0].code   = #state-csr-primary-source
* primarySource[0].who = Reference(org-florida-csr-authority) // replace with GA issuer if defined
* primarySource[0].communicationMethod[0].text = "API lookup"
* primarySource[0].validationDate = "2025-10-21"
* primarySource[0].validationStatus.coding[0].system = $csVRValidationStatus
* primarySource[0].validationStatus.coding[0].code   = #successful

// ───────── Provenance linking VR → evidence ─────────
Instance: prov-vr-csr-fl-7744
InstanceOf: Provenance
Usage: #example
Title: "Provenance — FL CSR VR"
* recorded = "2025-10-21T14:06:00Z"
* target[0] = Reference(vr-csr-fl-7744)
* agent[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/provenance-participant-type"
* agent[0].type.coding[0].code = #verifier
* agent[0].who = Reference(org-florida-csr-authority)
* entity[0].role = #source
* entity[0].what = Reference(docref-csr-fl-7744)

Instance: prov-vr-csr-ga-2219
InstanceOf: Provenance
Usage: #example
Title: "Provenance — GA CSR VR"
* recorded = "2025-10-21T14:09:00Z"
* target[0] = Reference(vr-csr-ga-2219)
* agent[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/provenance-participant-type"
* agent[0].type.coding[0].code = #verifier
* agent[0].who = Reference(org-florida-csr-authority) // swap to GA issuer if defined
* entity[0].role = #source
* entity[0].what = Reference(docref-csr-ga-2219)
