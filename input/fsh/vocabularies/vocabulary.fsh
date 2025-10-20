
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
