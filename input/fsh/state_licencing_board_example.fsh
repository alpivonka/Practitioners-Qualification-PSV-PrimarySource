// psv-examples-only.fsh — instances-only demo referencing vocab defined elsewhere
// Mirrors PlantUML: Practitioner (license qualification), Organization+Endpoint, VerificationResult, Provenance
// NOTE: If these aliases are already defined in your project, remove the duplicates here.

// ────────────────────────────── Aliases (remove if already defined) ──────────────────────────────
Alias: $us-npi = http://hl7.org/fhir/sid/us-npi
Alias: $PSVVerificationTypeCS = http://example.org/fhir/uv/psv/CodeSystem/psv-verification-type-cs
Alias: $PSVActionCS   = http://example.org/fhir/uv/psv/CodeSystem/psv-action-cs
Alias: $ext-qualification-status = http://example.org/fhir/StructureDefinition/qualification-status

// ─────────────────────────── Organization & Endpoint ───────────────────────────
Instance: org-state-medical-board
InstanceOf: Organization
Usage: #example
Title: "State Medical Board"
* name = "Fictional State Medical Board"
* endpoint = Reference(Endpoint/endpoint-board-portal)

Instance: endpoint-board-portal
InstanceOf: Endpoint
Usage: #example
Title: "Board Verification Endpoint"
* status = #active
* address = "https://api.stateboard.example.gov/verify"
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#hl7-fhir-rest "HL7 FHIR REST"
* payloadType[0].text = "FHIR R4 resources: Practitioner, VerificationResult"
* payloadMimeType[0] = #application/fhir+json

// ─────────────────────────── Practitioner (with license slice) ───────────────────────────
Instance: prac-alex-smith
InstanceOf: PSVPractitioner
Usage: #example
Title: "Practitioner — Alex Smith, MD"
* identifier[0].system = $us-npi
* identifier[0].value = "1234567893"
* qualification[license][0].code.coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0360"
* qualification[license][0].code.coding[0].code = #MD
* qualification[license][0].identifier[0].system = "urn:oid:2.16.840.1.113883.4.721"
* qualification[license][0].identifier[0].value = "MD-987654321"
* qualification[license][0].issuer = Reference(Organization/org-state-medical-board)
* qualification[license][0].period.start = "2023-01-01"
* qualification[license][0].period.end = "2026-12-31"
// License status via existing extension (swap to coding if you have a CS/VS for this)
* qualification[license][0].extension[status].url = $ext-qualification-status
* qualification[license][0].extension[status].valueCodeableConcept.text = "Active"

// ─────────────────────────── VerificationResult (wired to existing vocabularies) ───────────────────────────
Instance: vr-alex-smith-license-2025Q1
InstanceOf: PSVVerificationResult
Usage: #example
Title: "VerificationResult — Alex Smith MD License"
* target[0] = Reference(Practitioner/prac-alex-smith)
* targetLocation[0] = "Practitioner.qualification[license][0]"
* status = #attested
// validationType from your CodeSystem (ValueSet binding assumed in profile)
* validationType.coding[0].system = $PSVVerificationTypeCS
* validationType.coding[0].code = #primary-source
* lastPerformed = "2025-02-15T10:32:00-05:00"
* nextScheduled = "2025-06-01"
* frequency.repeat.period = 6
* frequency.repeat.periodUnit = #mo
* validator[0].organization = Reference(Organization/org-state-medical-board)
// failure-action extension using your CodeSystem (bound via VS)
* extension[Action].valueCodeableConcept.coding[0].system = $PSVActionCS
* extension[Action].valueCodeableConcept.coding[0].code = #manual-review

// ─────────────────────────── Provenance auditing the VerificationResult ───────────────────────────
Instance: prov-vr-alex-smith-license-2025Q1
InstanceOf: Provenance
Usage: #example
Title: "Provenance for VR — Alex Smith License"
* recorded = "2025-02-15T10:33:10-05:00"
* target[0] = Reference(VerificationResult/vr-alex-smith-license-2025Q1)
* agent[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/provenance-participant-type"
* agent[0].type.coding[0].code = #verifier
* agent[0].who = Reference(Organization/org-state-medical-board)
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


