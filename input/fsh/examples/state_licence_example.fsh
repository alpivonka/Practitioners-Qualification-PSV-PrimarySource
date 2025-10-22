// psv-examples-only.fsh — instances-only demo referencing vocab defined elsewhere
// Mirrors PlantUML: Practitioner (license qualification), Organization+Endpoint, VerificationResult, Provenance
// NOTE: If these aliases are already defined in your project, remove the duplicates here.

// ───────────────────────────── Aliases (use full URLs; no concatenation) ─────────────────────────────
Alias: $psvProfile       = http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner
Alias: $csType           = http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs
Alias: $csStatus         = http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-status-cs

Alias: $extJurisdiction  = http://example.org/fhir/uv/psv/StructureDefinition/qualification-jurisdiction
Alias: $uspsCS           = http://hl7.org/fhir/us/core/CodeSystem/us-core-usps-state
Alias: $extStatus = http://example.org/fhir/uv/psv/StructureDefinition/qualification-status
Alias: $csVerifType = http://example.org/fhir/uv/psv/CodeSystem/psv-verification-type-cs

Alias: $csVRValidationStatus = http://terminology.hl7.org/CodeSystem/verificationresult-status
// ───────────────────────────── Issuer Organization ─────────────────────────────
Instance: org-florida-medical-board
InstanceOf: Organization
Usage: #example
Title: "Florida Board of Medicine"
* name = "Florida Board of Medicine"
* endpoint[0] = Reference(endpoint-florida-board-verify)

Instance: endpoint-florida-board-verify
InstanceOf: Endpoint
Usage: #example
* status = #active
* connectionType.system = "http://terminology.hl7.org/CodeSystem/endpoint-connection-type"
* connectionType.code = #hl7-fhir-rest
* address = "https://api.florida.board.org/verify/fhir"
* payloadType[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/endpoint-payload-type"
* payloadType[0].coding[0].code = #any
* payloadType[0].text = "FHIR Practitioner & VerificationResult"
* payloadMimeType[0] = #application/fhir+json

// ───────────────────────────── Practitioner with LICENSE slice ─────────────────────────────
Instance: prac-jordan-rivera-license-only
InstanceOf: PSVPractitioner
Usage: #example
Title: "PSVPractitioner — License slice populated"
* meta.profile = $psvProfile
* name[0].family = "Rivera"
* name[0].given[0] = "Jordan"
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[0].value  = "1987654321"

// license slice (NOTE: use slice names 'status' and 'jurisdiction' from your profile)
* qualification[license][0].code.coding[0].system = $csType
* qualification[license][0].code.coding[0].code   = #license
* qualification[license][0].identifier[0].system  = "https://flboard.gov/license"
* qualification[license][0].identifier[0].value   = "ME12345"
* qualification[license][0].issuer                = Reference(org-florida-medical-board)
* qualification[license][0].period.start          = 2023-01-01
* qualification[license][0].period.end            = 2026-12-31

// extension slice: status
* qualification[license][0].extension[+].url = $extStatus
* qualification[license][0].extension[=].valueCodeableConcept.coding[0].system = $csStatus
* qualification[license][0].extension[=].valueCodeableConcept.coding[0].code   = #active

// extension slice: jurisdiction
* qualification[license][0].extension[+].url = $extJurisdiction
* qualification[license][0].extension[=].valueCodeableConcept.coding[0].system = $uspsCS
* qualification[license][0].extension[=].valueCodeableConcept.coding[0].code   = #FL
* qualification[license][0].extension[=].valueCodeableConcept.coding[0].display = "Florida"

// ───────────────────────────── VerificationResult for the license ─────────────────────────────
Instance: vr-license-jordan-rivera
InstanceOf: VerificationResult
Usage: #example
Title: "VR — State License Primary Source"
* status = #validated                                  
* statusDate = "2025-10-21T14:05:00Z"
* target[0] = Reference(prac-jordan-rivera-license-only)
* targetLocation[0] = "qualification[license][0]"
* validationType.coding[0].system = $csVerifType      
* validationType.coding[0].code   = #license-primary-source
* primarySource[0].who = Reference(org-florida-medical-board)
* primarySource[0].communicationMethod[0].text = "API lookup"
* primarySource[0].validationDate = "2025-10-21T14:05:00Z"
* primarySource[0].validationStatus.coding[0].system = $csVRValidationStatus
* primarySource[0].validationStatus.coding[0].code   = #successful
* primarySource[0].validationStatus.text = "successful"  




// ─────────────────────────── VerificationResult (wired to existing vocabularies) ───────────────────────────
Instance: vr-alex-smith-license-2025Q1
InstanceOf: VerificationResult
Usage: #example
Title: "VR — Alex Smith License (2025 Q1)"
* status = #validated
* statusDate = "2025-10-21T14:05:00Z"
* target[0] = Reference(prac-jordan-rivera-license-only)
* targetLocation[0] = "qualification[license][0]"
* validationType.coding[0].system = $csVerifType
* validationType.coding[0].code   = #license-primary-source
* primarySource[0].who = Reference(org-florida-medical-board)
* primarySource[0].communicationMethod[0].text = "API lookup"
* primarySource[0].validationDate = "2025-10-21T14:05:00Z"
* primarySource[0].validationStatus.coding[0].system = $csVRValidationStatus
* primarySource[0].validationStatus.coding[0].code   = #successful
* primarySource[0].validationStatus.text = "successful" 

// ─────────────────────────── Provenance auditing the VerificationResult ───────────────────────────
Instance: prov-vr-alex-smith-license-2025Q1
InstanceOf: Provenance
Usage: #example
Title: "Provenance for VR — Alex Smith License"
* recorded = "2025-02-15T10:33:10-05:00"
* target[0] = Reference(vr-alex-smith-license-2025Q1)
* agent[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/provenance-participant-type"
* agent[0].type.coding[0].code = #verifier
* agent[0].who = Reference(org-state-medical-board)
* entity[0].role = #source
* entity[0].what = Reference(DocumentReference/docref-board-response)


Instance: docref-board-response
InstanceOf: DocumentReference
Usage: #example
Title: "Board Verification Response (JSON)"
* status = #current
* type.text = "Board verification lookup result"
* content[0].attachment.contentType = #application/json
* content[0].attachment.url = "https://api.stateboard.example.gov/verify?license=MD-987654321&npi=1234567893"


