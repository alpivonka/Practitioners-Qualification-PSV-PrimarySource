
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