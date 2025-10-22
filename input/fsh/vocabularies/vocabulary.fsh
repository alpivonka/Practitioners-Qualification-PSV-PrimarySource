
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

