Extension: QualificationStatus
Id: qualification-status
Title: "Qualification Status"
Description: "Status of a credential/qualification entry (e.g., active, expired, suspended)."
* ^context[0].type = #element
* ^context[0].expression = "Practitioner.qualification"
* value[x] only CodeableConcept
* valueCodeableConcept from PSVQualificationStatusVS (required)