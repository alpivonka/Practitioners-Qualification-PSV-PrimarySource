// ==== Evidence Layer ====
Alias: USCoreProv = http://hl7.org/fhir/us/core/StructureDefinition/us-core-provenance

Profile: PSVVerificationResult
Parent: VerificationResult
Id: psv-verificationresult
Title: "PSV VerificationResult"
Description: "Standard verification evidence linking validators to verified targets."
* target 1..* MS
* validationType from PSVVerificationTypeVS (extensible)
* status 1..1 MS
* validator 0..1 MS
* lastPerformed 0..1 MS
* nextScheduled 0..1 MS
* frequency 0..1 MS
* extension contains Action named Action 0..1
* targetLocation MS


Extension: Action
Id: action
* ^context[0].type = #element
* ^context[0].expression = "VerificationResult"
* value[x] only CodeableConcept
* valueCodeableConcept from PSVActionVS (required)

Invariant: psv-vr-has-target
Description: "VerificationResult must point to at least one target."
Severity: #error
Expression: "target.exists()"

Profile: PSVProvenance
Parent: Provenance
Id: psv-provenance
Title: "PSV Provenance (US Core derived)"
Description: "Audits VerificationResult with evidence entities (CSV snapshot, API receipt, PDF)."
* target 1..* MS
* agent 1..* MS
* entity MS

Profile: PSVEvidenceDocument
Parent: DocumentReference
Id: psv-evidence-document
Title: "PSV Evidence Document"
Description: "Stores document artifacts (PDF, CSV, screenshots) used as evidence."
* status 1..1 MS
* type MS
* content 1..* MS

Profile: PSVEvidenceBinary
Parent: Binary
Id: psv-evidence-binary
Title: "PSV Evidence Binary"
Description: "Raw binary artifact (hashable)."
* contentType 1..1 MS
