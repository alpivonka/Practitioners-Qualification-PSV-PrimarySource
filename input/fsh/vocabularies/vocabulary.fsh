
CodeSystem: PSVVerificationTypeCS
Id: psv-verification-type-cs
Title: "PSV Verification Type CodeSystem"
* ^status = #draft
* ^content = #complete
* #primary-source "Primary Source"
* #attestation "Attestation"
* #other "Other"

ValueSet: PSVVerificationTypeVS
Id: psv-verification-type-vs
Title: "PSV Verification Type"
* include codes from system PSVVerificationTypeCS

CodeSystem: PSVActionCS
Id: psv-action-cs
Title: "PSV  Action CodeSystem"
* ^status = #draft
* ^content = #complete
* #record-only "Record Only"
* #manual-review "Manual Review"
* #block "Block"

ValueSet: PSVActionVS
Id: psv-action-vs
Title: "PSV Action"
* include codes from system PSVActionCS

// CodeSystem Name is UpperCamelCase; Id can keep hyphens
CodeSystem: PSVQualificationStatusCS
Id: psv-qualification-status-cs
Title: "Qualification Status"
* ^content = #complete
* #active     "Active"
* #inactive   "Inactive"
* #expired    "Expired"
* #suspended  "Suspended"
* #restricted "Restricted"

// ValueSet Name is UpperCamelCase; Id can keep hyphens
ValueSet: PSVQualificationStatusVS
Id: psvVS-qualification-status
Title: "VS - Qualification Status"
* include codes from system psv-qualification-status-cs

CodeSystem: PSVDEAScheduleCS
Id: psv-dea-schedule-cs
Title: "DEA Controlled Substance Schedules (II–V)"
Description: "Subset of U.S. controlled substance schedules commonly applicable to prescribers. Schedule I excluded."
* ^caseSensitive = true
* ^content = #complete
* #II   "Schedule II"
* #III  "Schedule III"
* #IV   "Schedule IV"
* #V    "Schedule V"

ValueSet: PSVDEAScheduleVS
Id: psvVS-dea-schedule
Title: "VS — DEA Controlled Substance Schedules (II–V)"
Description: "Allowed DEA schedules for clinician prescribing context."
* include codes from system $csDEASchedule

CodeSystem: PSVDEARegistrantTypeCS
Id: psv-dea-registrant-type-cs
Title: "DEA Registrant Type"
Description: "DEA registrant categories relevant to care delivery and dispensing."
* ^caseSensitive = true
* ^content = #complete
* #practitioner           "Practitioner"
* #midlevel-practitioner  "Mid-level Practitioner"
* #hospital-clinic        "Hospital/Clinic"
* #pharmacy               "Pharmacy"
* #teaching-institution   "Teaching Institution"
* #narcotic-treatment     "Narcotic Treatment Program"
* #researcher             "Researcher"

ValueSet: PSVDEARegistrantTypeVS
Id: psvVS-dea-registrant-type
Title: "VS — DEA Registrant Type"
Description: "Allowed DEA registrant categories for practitioner credentialing."
* include codes from system $csDEARegistrantType

CodeSystem: PSVTrainingTypeCS
Id: psv-training-type-cs
Title: "Training Type"
Description: "Types of postgraduate clinical training programs."
* ^url = $csTrainingType
* ^caseSensitive = true
* ^content = #complete
* #residency        "Residency"
* #fellowship       "Fellowship"
* #internship       "Internship"
* #transitional-year "Transitional Year"
* #preliminary-year  "Preliminary Year"

ValueSet: PSVTrainingTypeVS
Id: psvVS-training-type
Title: "VS — Training Type"
Description: "Allowed training types for practitioner qualifications."
* ^url = $vsTrainingType
* include codes from system $csTrainingType

CodeSystem: PSVCompletionStatusCS
Id: psv-completion-status-cs
Title: "Training Completion Status"
Description: "Completion state for a training program."
* ^url = $csCompletionStatus
* ^caseSensitive = true
* ^content = #complete
* #completed      "Completed"
* #in-progress    "In Progress"
* #not-completed  "Not Completed"
* #withdrawn      "Withdrawn"
* #terminated     "Terminated"

ValueSet: PSVCompletionStatusVS
Id: psvVS-completion-status
Title: "VS — Training Completion Status"
Description: "Allowed values for training completion status."
* ^url = $vsCompletionStatus
* include codes from system $csCompletionStatus

CodeSystem: PSVBoardSpecialtyCS
Id: psv-board-specialty-cs
Title: "Board/Training Specialty (Minimal)"
Description: "Minimal specialty codes used in examples. Replace/expand with your authoritative list."
* ^url = $csBoardSpecialty
* ^caseSensitive = true
* ^content = #complete
* #IM    "Internal Medicine"
* #EM    "Emergency Medicine"
* #CARD  "Cardiovascular Disease"

ValueSet: PSVBoardSpecialtyVS
Id: psvVS-board-specialty
Title: "VS — Board/Training Specialty"
Description: "Allowed specialties used for training/board examples."
* ^url = $vsBoardSpecialty
* include codes from system $csBoardSpecialty

