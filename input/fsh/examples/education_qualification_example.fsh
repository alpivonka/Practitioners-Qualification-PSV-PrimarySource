// ───────── Aliases (adjust to your IG canonical) ─────────
Alias: $profPSVPractitioner   = http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner
Alias: $csQualType            = http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs
Alias: $extDegree             = http://example.org/fhir/uv/psv/StructureDefinition/qualification-degree
Alias: $csDegree              = http://example.org/fhir/uv/psv/CodeSystem/psv-degree-cs
Alias: $extStatus             = http://example.org/fhir/uv/psv/StructureDefinition/qualification-status
Alias: $csQualStatus          = http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-status-cs
Alias: $csVerifType           = http://example.org/fhir/uv/psv/CodeSystem/psv-verification-type-cs
Alias: $csVRValidationStatus  = http://terminology.hl7.org/CodeSystem/verificationresult-status

// ───────── Issuer Organization (Medical School) + Endpoint ─────────
Instance: endpoint-state-university-registrar
InstanceOf: Endpoint
Usage: #example
Title: "State University Registrar — Verification API"
* status = #active
* connectionType.system = "http://terminology.hl7.org/CodeSystem/endpoint-connection-type"
* connectionType.code = #hl7-fhir-rest
* address = "https://registrar.stateu.example.edu/fhir"
* payloadType[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/endpoint-payload-type"
* payloadType[0].coding[0].code = #any
* payloadType[0].text = "FHIR Practitioner & VerificationResult"
* payloadMimeType[0] = #application/fhir+json

Instance: org-state-university-med
InstanceOf: Organization
Usage: #example
Title: "State University College of Medicine"
* name = "State University College of Medicine"
* endpoint[0] = Reference(endpoint-state-university-registrar)

// ───────── Practitioner with EDUCATION slice(s) ─────────
Instance: prac-education-with-vr
InstanceOf: PSVPractitioner
Usage: #example
Title: "PSVPractitioner — Education (degree) with VR, Provenance, Evidence"
* meta.profile = $profPSVPractitioner
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[0].value  = "1478523690"
* name[0].family = "Chen"
* name[0].given[0]  = "Morgan"

// Education #1 — MD degree (required: issuer, period.start, degree)
* qualification[education][0].code.coding[0].system = $csQualType
* qualification[education][0].code.coding[0].code   = #education
* qualification[education][0].issuer                = Reference(org-state-university-med)
* qualification[education][0].period.start          = 2016-05-15        // conferral date or start date per your convention
// degree (required)
* qualification[education][0].extension[+].url = $extDegree
* qualification[education][0].extension[=].valueCodeableConcept.coding[0].system = $csDegree
* qualification[education][0].extension[=].valueCodeableConcept.coding[0].code   = #MD
// optional qualification status
* qualification[education][0].extension[+].url = $extStatus
* qualification[education][0].extension[=].valueCodeableConcept.coding[0].system = $csQualStatus
* qualification[education][0].extension[=].valueCodeableConcept.coding[0].code   = #active

// (Optional) Education #2 — Undergraduate BS (if you want to show multiple education entries)
* qualification[education][1].code.coding[0].system = $csQualType
* qualification[education][1].code.coding[0].code   = #education
* qualification[education][1].issuer                = Reference(org-state-university-med) // replace with actual undergrad org if defined
* qualification[education][1].period.start          = 2012-05-15
* qualification[education][1].extension[+].url = $extDegree
* qualification[education][1].extension[=].valueCodeableConcept.coding[0].system = $csDegree
* qualification[education][1].extension[=].valueCodeableConcept.coding[0].code   = #BS

// ───────── Evidence: DocumentReference (one per education entry) ─────────
Instance: docref-education-md
InstanceOf: DocumentReference
Usage: #example
Title: "Diploma / Degree Verification — MD"
* status = #current
* type.text = "Degree verification (MD)"
* content[0].attachment.contentType = #application/pdf
* content[0].attachment.url = "https://registrar.stateu.example.edu/verify?degree=MD&student=1478523690"

Instance: docref-education-bs
InstanceOf: DocumentReference
Usage: #example
Title: "Degree Verification — BS"
* status = #current
* type.text = "Degree verification (BS)"
* content[0].attachment.contentType = #application/json
* content[0].attachment.url = "https://registrar.stateu.example.edu/verify?degree=BS&student=1478523690"

// ───────── VerificationResult(s): one per education entry ─────────
Instance: vr-education-md
InstanceOf: VerificationResult
Usage: #example
Title: "VR — MD Degree (Primary Source)"
* status = #validated
* statusDate = "2025-10-21T13:55:00Z"
* target[0] = Reference(prac-education-with-vr)
* targetLocation[0] = "qualification[education][0]"
* validationType.coding[0].system = $csVerifType
* validationType.coding[0].code   = #education-primary-source
* primarySource[0].who = Reference(org-state-university-med)
* primarySource[0].communicationMethod[0].text = "Registrar API"
* primarySource[0].validationDate = "2025-10-21"
* primarySource[0].validationStatus.coding[0].system = $csVRValidationStatus
* primarySource[0].validationStatus.coding[0].code   = #successful

Instance: vr-education-bs
InstanceOf: VerificationResult
Usage: #example
Title: "VR — BS Degree (Primary Source)"
* status = #validated
* statusDate = "2025-10-21T13:57:00Z"
* target[0] = Reference(prac-education-with-vr)
* targetLocation[0] = "qualification[education][1]"
* validationType.coding[0].system = $csVerifType
* validationType.coding[0].code   = #education-primary-source
* primarySource[0].who = Reference(org-state-university-med)     // swap to undergrad org if defined
* primarySource[0].communicationMethod[0].text = "Registrar API"
* primarySource[0].validationDate = "2025-10-21"
* primarySource[0].validationStatus.coding[0].system = $csVRValidationStatus
* primarySource[0].validationStatus.coding[0].code   = #successful

// ───────── Provenance linking VR → evidence ─────────
Instance: prov-vr-education-md
InstanceOf: Provenance
Usage: #example
Title: "Provenance — VR MD Degree"
* recorded = "2025-10-21T13:56:00Z"
* target[0] = Reference(vr-education-md)
* agent[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/provenance-participant-type"
* agent[0].type.coding[0].code = #verifier
* agent[0].who = Reference(org-state-university-med)
* entity[0].role = #source
* entity[0].what = Reference(docref-education-md)

Instance: prov-vr-education-bs
InstanceOf: Provenance
Usage: #example
Title: "Provenance — VR BS Degree"
* recorded = "2025-10-21T13:58:00Z"
* target[0] = Reference(vr-education-bs)
* agent[0].type.coding[0].system = "http://terminology.hl7.org/CodeSystem/provenance-participant-type"
* agent[0].type.coding[0].code = #verifier
* agent[0].who = Reference(org-state-university-med)
* entity[0].role = #source
* entity[0].what = Reference(docref-education-bs)
