// ───────── Aliases (adjust to your IG canonical) ─────────
Alias: $profPSVPractitioner   = http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner
Alias: $csQualType            = http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs

Alias: $extTrainingType       = http://example.org/fhir/uv/psv/StructureDefinition/training-type
Alias: $csTrainingType        = http://example.org/fhir/uv/psv/CodeSystem/psv-training-type-cs     // e.g., residency|fellowship|internship
Alias: $extACGMEProgramId     = http://example.org/fhir/uv/psv/StructureDefinition/acgme-program-id
Alias: $extCompletionStatus   = http://example.org/fhir/uv/psv/StructureDefinition/completion-status
Alias: $csCompletionStatus    = http://example.org/fhir/uv/psv/CodeSystem/psv-completion-status-cs  // e.g., completed|in-progress|not-completed|withdrawn
Alias: $extSpecialty          = http://example.org/fhir/uv/psv/StructureDefinition/qualification-specialty
Alias: $csBoardSpecialty      = http://example.org/fhir/uv/psv/CodeSystem/psv-board-specialty-cs    // reuse for training specialty (optional)
Alias: $extStatus             = http://example.org/fhir/uv/psv/StructureDefinition/qualification-status
Alias: $csQualStatus          = http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-status-cs

Alias: $csVerifType           = http://example.org/fhir/uv/psv/CodeSystem/psv-verification-type-cs  // add code training-primary-source
Alias: $csVRValidationStatus  = http://terminology.hl7.org/CodeSystem/verificationresult-status

// ───────── Issuer Organizations (GME/Teaching Hospitals) + Endpoints ─────────
Instance: endpoint-citymed-gme
InstanceOf: Endpoint
Usage: #example
Title: "City Medical Center GME — Verification API"
* status = #active
* connectionType.system = "http://terminology.hl7.org/CodeSystem/endpoint-connection-type"
* connectionType.code = #hl7-fhir-rest
* address = "https://gme.citymed.example.org/fhir"
* payloadType[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/endpoint-payload-type"
* payloadType[0].coding[0].code = #any
* payloadType[0].text = "FHIR Practitioner & VerificationResult"
* payloadMimeType[0] = #application/fhir+json

Instance: org-citymed-gme
InstanceOf: Organization
Usage: #example
Title: "City Medical Center — GME"
* name = "City Medical Center — Graduate Medical Education"
* endpoint[0] = Reference(endpoint-citymed-gme)

Instance: endpoint-heartinst-fellowships
InstanceOf: Endpoint
Usage: #example
Title: "Heart Institute — Fellowship Verification API"
* status = #active
* connectionType.system = "http://terminology.hl7.org/CodeSystem/endpoint-connection-type"
* connectionType.code = #hl7-fhir-rest
* address = "https://fellowships.heartinst.example.org/fhir"
* payloadType[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/endpoint-payload-type"
* payloadType[0].coding[0].code = #any
* payloadType[0].text = "FHIR Practitioner & VerificationResult"
* payloadMimeType[0] = #application/fhir+json

Instance: org-heart-institute
InstanceOf: Organization
Usage: #example
Title: "National Heart Institute"
* name = "National Heart Institute"
* endpoint[0] = Reference(endpoint-heartinst-fellowships)

// ───────── Practitioner with TRAINING slice(s) ─────────
Instance: prac-training-with-vr
InstanceOf: PSVPractitioner
Usage: #example
Title: "PSVPractitioner — Training (residency & fellowship) with VR, Provenance, Evidence"
* meta.profile = $profPSVPractitioner
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[0].value  = "1654321987"
* name[0].family = "Garcia"
* name[0].given[0]  = "Taylor"

// Training #1 — Residency (Internal Medicine) at City Medical Center
* qualification[training][0].code.coding[0].system = $csQualType
* qualification[training][0].code.coding[0].code   = #training
* qualification[training][0].issuer                = Reference(org-citymed-gme)
* qualification[training][0].period.start          = 2017-07-01
* qualification[training][0].period.end            = 2020-06-30
// training-type (required)
* qualification[training][0].extension[+].url = $extTrainingType
* qualification[training][0].extension[=].valueCodeableConcept.coding[0].system = $csTrainingType
* qualification[training][0].extension[=].valueCodeableConcept.coding[0].code   = #residency
// ACGME program id (optional)
* qualification[training][0].extension[+].url = $extACGMEProgramId
* qualification[training][0].extension[=].valueIdentifier.system = "https://apps.acgme.org/ads/Public/Programs/Search"
* qualification[training][0].extension[=].valueIdentifier.value  = "140-12-34-567"   // example format
// completion-status (optional)
* qualification[training][0].extension[+].url = $extCompletionStatus
* qualification[training][0].extension[=].valueCodeableConcept.coding[0].system = $csCompletionStatus
* qualification[training][0].extension[=].valueCodeableConcept.coding[0].code   = #completed
// specialty (optional)
* qualification[training][0].extension[+].url = $extSpecialty
* qualification[training][0].extension[=].valueCodeableConcept.coding[0].system = $csBoardSpecialty
* qualification[training][0].extension[=].valueCodeableConcept.coding[0].code   = #IM
// optional status (from CommonQualBackbone)
* qualification[training][0].extension[+].url = $extStatus
* qualification[training][0].extension[=].valueCodeableConcept.coding[0].system = $csQualStatus
* qualification[training][0].extension[=].valueCodeableConcept.coding[0].code   = #active

// Training #2 — Fellowship (Cardiovascular Disease) at National Heart Institute
* qualification[training][1].code.coding[0].system = $csQualType
* qualification[training][1].code.coding[0].code   = #training
* qualification[training][1].issuer                = Reference(org-heart-institute)
* qualification[training][1].period.start          = 2020-07-01
* qualification[training][1].period.end            = 2023-06-30
// training-type (required)
* qualification[training][1].extension[+].url = $extTrainingType
* qualification[training][1].extension[=].valueCodeableConcept.coding[0].system = $csTrainingType
* qualification[training][1].extension[=].valueCodeableConcept.coding[0].code   = #fellowship
// ACGME program id (optional)
* qualification[training][1].extension[+].url = $extACGMEProgramId
* qualification[training][1].extension[=].valueIdentifier.system = "https://apps.acgme.org/ads/Public/Programs/Search"
* qualification[training][1].extension[=].valueIdentifier.value  = "141-98-76-543"
// completion-status (optional)
* qualification[training][1].extension[+].url = $extCompletionStatus
* qualification[training][1].extension[=].valueCodeableConcept.coding[0].system = $csCompletionStatus
* qualification[training][1].extension[=].valueCodeableConcept.coding[0].code   = #completed
// specialty (optional)
* qualification[training][1].extension[+].url = $extSpecialty
* qualification[training][1].extension[=].valueCodeableConcept.coding[0].system = $csBoardSpecialty
* qualification[training][1].extension[=].valueCodeableConcept.coding[0].code   = #CARD

// ───────── Evidence: DocumentReference (one per training entry) ─────────
Instance: docref-training-residency-im
InstanceOf: DocumentReference
Usage: #example
Title: "Residency Verification — Internal Medicine"
* status = #current
* type.text = "Residency program verification"
* content[0].attachment.contentType = #application/pdf
* content[0].attachment.url = "https://gme.citymed.example.org/verify?program=140-12-34-567&npi=1654321987"

Instance: docref-training-fellowship-card
InstanceOf: DocumentReference
Usage: #example
Title: "Fellowship Verification — Cardiovascular Disease"
* status = #current
* type.text = "Fellowship program verification"
* content[0].attachment.contentType = #application/json
* content[0].attachment.url = "https://fellowships.heartinst.example.org/verify?program=141-98-76-543&npi=1654321987"

// ───────── VerificationResult(s): one per training entry ─────────
Instance: vr-training-residency-im
InstanceOf: VerificationResult
Usage: #example
Title: "VR — Residency (IM) Primary Source"
* status = #validated
* statusDate = "2025-10-21T12:25:00Z"
* target[0] = Reference(prac-training-with-vr)
* targetLocation[0] = "qualification[training][0]"
* validationType.coding[0].system = $csVerifType
* validationType.coding[0].code   = #training-primary-source
* primarySource[0].who = Reference(org-citymed-gme)
* primarySource[0].communicationMethod[0].text = "GME API"
* primarySource[0].validationDate = "2025-10-21"
* primarySource[0].validationStatus.coding[0].system = $csVRValidationStatus
* primarySource[0].validationStatus.coding[0].code   = #successful

Instance: vr-training-fellowship-card
InstanceOf: VerificationResult
Usage: #example
Title: "VR — Fellowship (Cardiology) Primary Source"
* status = #validated
* statusDate = "2025-10-21T12:30:00Z"
* target[0] = Reference(prac-training-with-vr)
* targetLocation[0] = "qualification[training][1]"
* validationType.coding[0].system = $csVerifType
* validationType.coding[0].code   = #training-primary-source
* primarySource[0].who = Reference(org-heart-institute)
* primarySource[0].communicationMethod[0].text = "Fellowship API"
* primarySource[0].validationDate = "2025-10-21"
* primarySource[0].validationStatus.coding[0].system = $csVRValidationStatus
* primarySource[0].validationStatus.coding[0].code   = #successful

// ───────── Provenance linking VR → evidence ─────────
Instance: prov-vr-training-residency-im
InstanceOf: Provenance
Usage: #example
Title: "Provenance — VR Residency (IM)"
* recorded = "2025-10-21T12:26:00Z"
* target[0] = Reference(vr-training-residency-im)
* agent[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/provenance-participant-type"
* agent[0].type.coding[0].code = #verifier
* agent[0].who = Reference(org-citymed-gme)
* entity[0].role = #source
* entity[0].what = Reference(docref-training-residency-im)

Instance: prov-vr-training-fellowship-card
InstanceOf: Provenance
Usage: #example
Title: "Provenance — VR Fellowship (Cardiology)"
* recorded = "2025-10-21T12:31:00Z"
* target[0] = Reference(vr-training-fellowship-card)
* agent[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/provenance-participant-type"
* agent[0].type.coding[0].code = #verifier
* agent[0].who = Reference(org-heart-institute)
* entity[0].role = #source
* entity[0].what = Reference(docref-training-fellowship-card)
