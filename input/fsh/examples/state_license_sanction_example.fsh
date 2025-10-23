// ---------- Assumed extension URLs (adjust to your IG) ----------
Alias: $ext-qualification-status     = http://example.org/fhir/uv/psv/StructureDefinition/qualification-status
Alias: $ext-qualification-restriction = http://example.org/fhir/uv/psv/StructureDefinition/qualification-restriction

// ---------- Issuer ----------
//Instance: org-florida-medical-board
//InstanceOf: Organization
//Usage: #example
//Title: "Florida Board of Medicine"
//* name = "Florida Board of Medicine"

// ---------- Practitioner with LICENSE slice ----------
Instance: prac-sanction-demo
InstanceOf: PSVPractitioner
Usage: #example
Title: "Practitioner with License, Sanction, Flag, Evidence"
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[0].value  = "1234567893"
* name[0].family = "Chavez"
* name[0].given[0]  = "Morgan"

// License entry
* qualification[license][0].identifier[0].system = "https://flboard.gov/license"
* qualification[license][0].identifier[0].value  = "ME-445566"
* qualification[license][0].code.coding[0].system = "http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs"
* qualification[license][0].code.coding[0].code   = #license
* qualification[license][0].issuer = Reference(org-florida-medical-board)
* qualification[license][0].period.start = 2022-01-01
* qualification[license][0].period.end   = 2026-12-31

// Status + restriction via URL-based extensions (works even without named slices)
* qualification[license][0].extension[+].url = $ext-qualification-status
* qualification[license][0].extension[=].valueCodeableConcept.coding[0].system = "http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-status-cs"
* qualification[license][0].extension[=].valueCodeableConcept.coding[0].code   = #suspended

* qualification[license][0].extension[+].url = $ext-qualification-restriction
* qualification[license][0].extension[=].valueCodeableConcept.text = "No direct patient care until 2025-12-31"

// ---------- Evidence (board order PDF) ----------
Instance: doc-suspension-order
InstanceOf: DocumentReference
Usage: #example
Title: "Board Final Order (Suspension)"
* status = #current
* type.text = "Board Order"
* date = "2025-09-15T10:00:00Z"
* content[0].attachment.contentType = #application/pdf
* content[0].attachment.url = "https://flboard.example/orders/2025-0915.pdf"
* content[0].attachment.title = "Final Order 2025-09-15"

// ---------- VerificationResult (sanction) ----------
Instance: vr-license-suspension
InstanceOf: VerificationResult
Usage: #example
Title: "VR — License Suspension from State Board"
* status = #completed
* statusDate = "2025-09-15T10:01:00Z"
* target[0] = Reference(prac-sanction-demo)
* targetLocation[0] = "qualification[license][0]"
* primarySource[0].who = Reference(org-florida-medical-board)
* primarySource[0].communicationMethod[0].text = "Portal"
* primarySource[0].validationStatus.coding[0].code = #successful
* primarySource[0].validationDate = "2025-09-15T10:01:00Z"
* failureAction.text = "Suspend practice; remove from schedules"
// attestation.date is a date (not dateTime)
* attestation.who.display = "PS-Verify Service"
* attestation.date = 2025-09-15
// Link the evidence doc (simple direct reference)
* contained[0] = doc-suspension-order
* contained[0].id = "local-doc"
* extension[+].url = "http://example.org/fhir/uv/psv/StructureDefinition/verification-evidence"
* extension[=].valueReference = Reference(DocumentReference/doc-suspension-order)

// ---------- Flag (operational visibility) ----------
Instance: flag-license-sanction
InstanceOf: Flag
Usage: #example
Title: "Active Sanction Flag (Board Suspension)"
* status = #active
* category[0].text = "Sanction"
* code.text = "Board suspension"
* subject = Reference(Practitioner/prac-sanction-demo)
* period.start = 2025-09-15
* period.end   = 2025-12-31
// If you defined FlagEvidence/FlagTargetLocation extensions, use them; otherwise keep URLs:
* extension[+].url = "http://example.org/fhir/uv/psv/StructureDefinition/flag-evidence"
* extension[=].valueReference = Reference(VerificationResult/vr-license-suspension)
* extension[+].url = "http://example.org/fhir/uv/psv/StructureDefinition/flag-targetLocation"
* extension[=].valueString = "qualification[license][0]"

// ---------- Provenance tying changes to VR ----------
Instance: prov-sanction-apply
InstanceOf: Provenance
Usage: #example
Title: "Provenance — Apply Board Suspension"
* recorded = "2025-09-15T10:02:00Z"
* reason[0].text = "Apply board suspension to Practitioner license and raise Flag"
* activity.text = "Update credential status; create Flag"
* target[0] = Reference(prac-sanction-demo)
* target[1] = Reference(flag-license-sanction)
* agent[0].type.text = "author"
* agent[0].who.display = "PS-Verify Processor"
* entity[0].role = #source
* entity[0].what = Reference(VerificationResult/vr-license-suspension)
