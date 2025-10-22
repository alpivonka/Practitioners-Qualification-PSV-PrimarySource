// ───────── Aliases ─────────
Alias: $profPSVPractitioner = http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner
Alias: $csQualType          = http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs
Alias: $extSpecialty        = http://example.org/fhir/uv/psv/StructureDefinition/qualification-specialty
Alias: $extSubspecialty     = http://example.org/fhir/uv/psv/StructureDefinition/qualification-subspecialty
Alias: $csBoardSpecialty    = http://example.org/fhir/uv/psv/CodeSystem/psv-board-specialty-cs
Alias: $csBoardSubspecialty = http://example.org/fhir/uv/psv/CodeSystem/psv-board-subspecialty-cs
Alias: $extStatus           = http://example.org/fhir/uv/psv/StructureDefinition/qualification-status
Alias: $csQualStatus        = http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-status-cs
Alias: $csVerifType         = http://example.org/fhir/uv/psv/CodeSystem/psv-verification-type-cs
Alias: $csVRValidationStatus = http://terminology.hl7.org/CodeSystem/verificationresult-status

// ───────── Issuer Organizations (+ optional Endpoints) ─────────
Instance: endpoint-abim-verify
InstanceOf: Endpoint
Usage: #example
* status = #active
* connectionType.system = "http://terminology.hl7.org/CodeSystem/endpoint-connection-type"
* connectionType.code = #hl7-fhir-rest
* address = "https://verify.abim.org/fhir"
* payloadType[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/endpoint-payload-type"
* payloadType[0].coding[0].code = #any
* payloadType[0].text = "FHIR Practitioner & VerificationResult"
* payloadMimeType[0] = #application/fhir+json


Instance: org-abim
InstanceOf: Organization
Usage: #example
* name = "American Board of Internal Medicine (ABIM)"
* endpoint[0] = Reference(endpoint-abim-verify)

Instance: endpoint-abem-verify
InstanceOf: Endpoint
Usage: #example
* status = #active
* connectionType.system = "http://terminology.hl7.org/CodeSystem/endpoint-connection-type"
* connectionType.code = #hl7-fhir-rest
* address = "https://api.abem.org/verify/fhir"
* payloadType[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/endpoint-payload-type"
* payloadType[0].coding[0].code = #any
* payloadType[0].text = "FHIR Practitioner & VerificationResult"
* payloadMimeType[0] = #application/fhir+json

Instance: org-abem
InstanceOf: Organization
Usage: #example
* name = "American Board of Emergency Medicine (ABEM)"
* endpoint[0] = Reference(endpoint-abem-verify)

// ───────── Practitioner with BOARD slice(s) ─────────
Instance: prac-boards-with-vr
InstanceOf: PSVPractitioner
Usage: #example
Title: "PSVPractitioner — Board certification(s) with VR, Provenance, Evidence"
* meta.profile = $profPSVPractitioner
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[0].value  = "1234567893"
* name[0].family = "Nguyen"
* name[0].given[0]  = "Alex"

// Board #1 — ABIM (IM + CARD)
* qualification[board][0].code.coding[0].system = $csQualType
* qualification[board][0].code.coding[0].code   = #board
* qualification[board][0].issuer                = Reference(org-abim)
* qualification[board][0].period.start          = 2020-07-01
* qualification[board][0].period.end            = 2030-06-30
* qualification[board][0].identifier.value      = "ABIM-000111222"
* qualification[board][0].extension[+].url = $extSpecialty
* qualification[board][0].extension[=].valueCodeableConcept.coding[0].system = $csBoardSpecialty
* qualification[board][0].extension[=].valueCodeableConcept.coding[0].code   = #IM
* qualification[board][0].extension[+].url = $extSubspecialty
* qualification[board][0].extension[=].valueCodeableConcept.coding[0].system = $csBoardSubspecialty
* qualification[board][0].extension[=].valueCodeableConcept.coding[0].code   = #CARD

// Board #2 — ABEM (EM)
* qualification[board][1].code.coding[0].system = $csQualType
* qualification[board][1].code.coding[0].code   = #board
* qualification[board][1].issuer                = Reference(org-abem)
* qualification[board][1].period.start          = 2019-09-01
* qualification[board][1].period.end            = 2029-08-31
* qualification[board][1].identifier.value      = "ABEM-445566"
* qualification[board][1].extension[+].url = $extSpecialty
* qualification[board][1].extension[=].valueCodeableConcept.coding[0].system = $csBoardSpecialty
* qualification[board][1].extension[=].valueCodeableConcept.coding[0].code   = #EM
* qualification[board][1].extension[+].url = $extStatus
* qualification[board][1].extension[=].valueCodeableConcept.coding[0].system = $csQualStatus
* qualification[board][1].extension[=].valueCodeableConcept.coding[0].code   = #active

// ───────── Evidence: DocumentReference (one per board) ─────────
Instance: docref-abim-verification
InstanceOf: DocumentReference
Usage: #example
* status = #current
* type.text = "Board certification verification (ABIM)"
* content[0].attachment.contentType = #text/html
* content[0].attachment.url = "https://verify.abim.org/cert?certId=ABIM-000111222"

Instance: docref-abem-verification
InstanceOf: DocumentReference
Usage: #example
* status = #current
* type.text = "Board certification verification (ABEM)"
* content[0].attachment.contentType = #text/html
* content[0].attachment.url = "https://www.abem.org/verify?certId=ABEM-445566"

// ───────── VerificationResult(s): one per board entry ─────────
Instance: vr-prac-boards-abim
InstanceOf: VerificationResult
Usage: #example
* status = #validated
* statusDate = "2025-10-21T14:05:00Z"
* target[0] = Reference(prac-boards-with-vr)
* targetLocation[0] = "qualification[board][0]"
* validationType.coding[0].system = $csVerifType
* validationType.coding[0].code   = #board-primary-source
* primarySource[0].who = Reference(org-abim)
* primarySource[0].communicationMethod[0].text = "Online portal lookup"
* primarySource[0].validationDate = "2025-10-21"
* primarySource[0].validationStatus.coding[0].system = $csVRValidationStatus
* primarySource[0].validationStatus.coding[0].code   = #successful

Instance: vr-prac-boards-abem
InstanceOf: VerificationResult
Usage: #example
* status = #validated
* statusDate = "2025-10-21T14:10:00Z"
* target[0] = Reference(prac-boards-with-vr)
* targetLocation[0] = "qualification[board][1]"
* validationType.coding[0].system = $csVerifType
* validationType.coding[0].code   = #board-primary-source
* primarySource[0].who = Reference(org-abem)
* primarySource[0].communicationMethod[0].text = "Online portal lookup"
* primarySource[0].validationDate = "2025-10-21"
* primarySource[0].validationStatus.coding[0].system = $csVRValidationStatus
* primarySource[0].validationStatus.coding[0].code   = #successful

// ───────── Provenance linking VR → evidence ─────────
Instance: prov-vr-prac-boards-abim
InstanceOf: Provenance
Usage: #example
* recorded = "2025-10-21T14:11:00Z"
* target[0] = Reference(vr-prac-boards-abim)
* agent[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/provenance-participant-type"
* agent[0].type.coding[0].code = #verifier
* agent[0].who = Reference(org-abim)
* entity[0].role = #source
* entity[0].what = Reference(docref-abim-verification)

Instance: prov-vr-prac-boards-abem
InstanceOf: Provenance
Usage: #example
* recorded = "2025-10-21T14:12:00Z"
* target[0] = Reference(vr-prac-boards-abem)
* agent[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/provenance-participant-type"
* agent[0].type.coding[0].code = #verifier
* agent[0].who = Reference(org-abem)
* entity[0].role = #source
* entity[0].what = Reference(docref-abem-verification)
