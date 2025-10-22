// ───────── Aliases (adjust to your IG canonical) ─────────
Alias: $profPSVPractitioner   = http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner
Alias: $csQualType            = http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs
Alias: $extStatus             = http://example.org/fhir/uv/psv/StructureDefinition/qualification-status
Alias: $csQualStatus          = http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-status-cs
Alias: $extDEASchedules       = http://example.org/fhir/uv/psv/StructureDefinition/dea-schedules
Alias: $csDEASchedule         = http://example.org/fhir/uv/psv/CodeSystem/psv-dea-schedule-cs
Alias: $extDEARegistrantType  = http://example.org/fhir/uv/psv/StructureDefinition/dea-registrant-type
Alias: $csDEARegistrantType   = http://example.org/fhir/uv/psv/CodeSystem/psv-dea-registrant-type-cs
Alias: $csVerifType           = http://example.org/fhir/uv/psv/CodeSystem/psv-verification-type-cs
Alias: $csVRValidationStatus  = http://terminology.hl7.org/CodeSystem/verificationresult-status

// ───────── Issuer Organization (DEA) + Endpoint ─────────
Instance: endpoint-dea-diversion
InstanceOf: Endpoint
Usage: #example
Title: "DEA Diversion Control — Verification API"
* status = #active
* connectionType.system = "http://terminology.hl7.org/CodeSystem/endpoint-connection-type"
* connectionType.code = #hl7-fhir-rest
* address = "https://dea.example.gov/diversion/fhir"
* payloadType[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/endpoint-payload-type"
* payloadType[0].coding[0].code = #any
* payloadType[0].text = "FHIR Practitioner & VerificationResult"
* payloadMimeType[0] = #application/fhir+json

Instance: org-dea-diversion
InstanceOf: Organization
Usage: #example
Title: "DEA Diversion Control Division"
* name = "DEA Diversion Control Division"
* endpoint[0] = Reference(endpoint-dea-diversion)

// ───────── Practitioner with DEA slice(s) ─────────
Instance: prac-dea-with-vr
InstanceOf: PSVPractitioner
Usage: #example
Title: "PSVPractitioner — DEA registration(s) with VR, Provenance, Evidence"
* meta.profile = $profPSVPractitioner
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[0].value  = "1234987654"
* name[0].family = "Patel"
* name[0].given[0]  = "Riya"

// DEA #1 — schedules II & III, practitioner registrant type
* qualification[dea][0].code.coding[0].system = $csQualType
* qualification[dea][0].code.coding[0].code   = #dea
* qualification[dea][0].identifier[0].system  = "https://www.dea.gov/registration"
* qualification[dea][0].identifier[0].value   = "AB1234567"
* qualification[dea][0].issuer                = Reference(org-dea-diversion)
* qualification[dea][0].period.start          = 2024-05-01
* qualification[dea][0].period.end            = 2027-04-30
* qualification[dea][0].extension[+].url = $extStatus
* qualification[dea][0].extension[=].valueCodeableConcept.coding[0].system = $csQualStatus
* qualification[dea][0].extension[=].valueCodeableConcept.coding[0].code   = #active
// schedules (required ≥1)
* qualification[dea][0].extension[+].url = $extDEASchedules
* qualification[dea][0].extension[=].valueCodeableConcept.coding[0].system = $csDEASchedule
* qualification[dea][0].extension[=].valueCodeableConcept.coding[0].code   = #II
* qualification[dea][0].extension[+].url = $extDEASchedules
* qualification[dea][0].extension[=].valueCodeableConcept.coding[0].system = $csDEASchedule
* qualification[dea][0].extension[=].valueCodeableConcept.coding[0].code   = #III
// registrant type
* qualification[dea][0].extension[+].url = $extDEARegistrantType
* qualification[dea][0].extension[=].valueCodeableConcept.coding[0].system = $csDEARegistrantType
* qualification[dea][0].extension[=].valueCodeableConcept.coding[0].code   = #practitioner

// DEA #2 — schedules III–V for a second registration (e.g., different practice address)
* qualification[dea][1].code.coding[0].system = $csQualType
* qualification[dea][1].code.coding[0].code   = #dea
* qualification[dea][1].identifier[0].system  = "https://www.dea.gov/registration"
* qualification[dea][1].identifier[0].value   = "BA7654321"
* qualification[dea][1].issuer                = Reference(org-dea-diversion)
* qualification[dea][1].period.start          = 2024-07-15
* qualification[dea][1].period.end            = 2027-07-14
* qualification[dea][1].extension[+].url = $extDEASchedules
* qualification[dea][1].extension[=].valueCodeableConcept.coding[0].system = $csDEASchedule
* qualification[dea][1].extension[=].valueCodeableConcept.coding[0].code   = #III
* qualification[dea][1].extension[+].url = $extDEASchedules
* qualification[dea][1].extension[=].valueCodeableConcept.coding[0].system = $csDEASchedule
* qualification[dea][1].extension[=].valueCodeableConcept.coding[0].code   = #IV
* qualification[dea][1].extension[+].url = $extDEASchedules
* qualification[dea][1].extension[=].valueCodeableConcept.coding[0].system = $csDEASchedule
* qualification[dea][1].extension[=].valueCodeableConcept.coding[0].code   = #V

// ───────── Evidence: DocumentReference (one per DEA) ─────────
Instance: docref-dea-AB1234567
InstanceOf: DocumentReference
Usage: #example
Title: "DEA Registration Lookup (AB1234567)"
* status = #current
* type.text = "DEA registration verification result"
* content[0].attachment.contentType = #application/json
* content[0].attachment.url = "https://dea.example.gov/diversion/api/verify?id=AB1234567"

Instance: docref-dea-BA7654321
InstanceOf: DocumentReference
Usage: #example
Title: "DEA Registration Lookup (BA7654321)"
* status = #current
* type.text = "DEA registration verification result"
* content[0].attachment.contentType = #application/json
* content[0].attachment.url = "https://dea.example.gov/diversion/api/verify?id=BA7654321"

// ───────── VerificationResult(s): one per DEA entry ─────────
Instance: vr-dea-AB1234567
InstanceOf: VerificationResult
Usage: #example
Title: "VR — DEA AB1234567 (Primary Source)"
* status = #validated
* statusDate = "2025-10-21T14:05:00Z"
* target[0] = Reference(prac-dea-with-vr)
* targetLocation[0] = "qualification[dea][0]"
* validationType.coding[0].system = $csVerifType
* validationType.coding[0].code   = #dea-primary-source        // ensure this code exists in your CS
* primarySource[0].who = Reference(org-dea-diversion)
* primarySource[0].communicationMethod[0].text = "API lookup"
* primarySource[0].validationDate = "2025-10-21"
* primarySource[0].validationStatus.coding[0].system = $csVRValidationStatus
* primarySource[0].validationStatus.coding[0].code   = #successful

Instance: vr-dea-BA7654321
InstanceOf: VerificationResult
Usage: #example
Title: "VR — DEA BA7654321 (Primary Source)"
* status = #validated
* statusDate = "2025-10-21T14:08:00Z"
* target[0] = Reference(prac-dea-with-vr)
* targetLocation[0] = "qualification[dea][1]"
* validationType.coding[0].system = $csVerifType
* validationType.coding[0].code   = #dea-primary-source
* primarySource[0].who = Reference(org-dea-diversion)
* primarySource[0].communicationMethod[0].text = "API lookup"
* primarySource[0].validationDate = "2025-10-21"
* primarySource[0].validationStatus.coding[0].system = $csVRValidationStatus
* primarySource[0].validationStatus.coding[0].code   = #successful

// ───────── Provenance linking VR → evidence ─────────
Instance: prov-vr-dea-AB1234567
InstanceOf: Provenance
Usage: #example
Title: "Provenance for VR — DEA AB1234567"
* recorded = "2025-10-21T14:06:00Z"
* target[0] = Reference(vr-dea-AB1234567)
* agent[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/provenance-participant-type"
* agent[0].type.coding[0].code = #verifier
* agent[0].who = Reference(org-dea-diversion)
* entity[0].role = #source
* entity[0].what = Reference(docref-dea-AB1234567)

Instance: prov-vr-dea-BA7654321
InstanceOf: Provenance
Usage: #example
Title: "Provenance for VR — DEA BA7654321"
* recorded = "2025-10-21T14:09:00Z"
* target[0] = Reference(vr-dea-BA7654321)
* agent[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/provenance-participant-type"
* agent[0].type.coding[0].code = #verifier
* agent[0].who = Reference(org-dea-diversion)
* entity[0].role = #source
* entity[0].what = Reference(docref-dea-BA7654321)
