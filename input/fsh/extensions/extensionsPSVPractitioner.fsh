Alias: $psvBase                = http://example.org/fhir/uv/psv
Alias: $csTrainingType         = http://example.org/fhir/uv/psv/CodeSystem/psv-training-type-cs
Alias: $vsTrainingType         = http://example.org/fhir/uv/psv/ValueSet/psvVS-training-type
Alias: $csCompletionStatus     = http://example.org/fhir/uv/psv/CodeSystem/psv-completion-status-cs
Alias: $vsCompletionStatus     = http://example.org/fhir/uv/psv/ValueSet/psvVS-completion-status
Alias: $csBoardSpecialty       = http://example.org/fhir/uv/psv/CodeSystem/psv-board-specialty-cs
Alias: $vsBoardSpecialty       = http://example.org/fhir/uv/psv/ValueSet/psvVS-board-specialty

Extension: QualificationStatus
Id: qualification-status
Title: "Qualification Status"
Description: "Status of a credential/qualification entry (e.g., active, expired, suspended)."
* ^context[0].type = #element
* ^context[0].expression = "Practitioner.qualification"
* value[x] only CodeableConcept
* valueCodeableConcept from PSVQualificationStatusVS (required)

// training-type extension
Extension: TrainingType
Id: training-type
Title: "Training Type"
* value[x] only CodeableConcept
* valueCodeableConcept from $vsTrainingType (required)

// completion-status extension
Extension: CompletionStatus
Id: completion-status
Title: "Training Completion Status"
* value[x] only CodeableConcept
* valueCodeableConcept from $vsCompletionStatus (preferred)

// qualification-specialty extension (if you use this for training)
Extension: QualificationSpecialty
Id: qualification-specialty
Title: "Qualification Specialty"
* value[x] only CodeableConcept
* valueCodeableConcept from $vsBoardSpecialty (extensible)

Extension: qualification-restriction
Id: qualification-restriction
Title: "Qualification Restriction"
* value[x] only CodeableConcept