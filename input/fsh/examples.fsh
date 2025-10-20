// ==== Minimal Examples ====

Instance: ex-psv-org-nppes
InstanceOf: PSVOrganization
Title: "NPPES Organization (Validator)"
Usage: #example
* name = "NPPES (CMS)"
* active = false

Instance: ex-psv-practitioner
InstanceOf: PSVPractitioner
Title: "Practitioner with NPI"
Usage: #example
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[0].value = "1234567890"
* name[0].family = "Demo"
* name[0].given[0] = "Pat"

Instance: ex-psv-verificationresult-npi
InstanceOf: PSVVerificationResult
Title: "VerificationResult - NPI Verified via NPPES"
Usage: #example
* target = Reference(ex-psv-practitioner)
* targetLocation[0] = "Practitioner.identifier.where(system='http://hl7.org/fhir/sid/us-npi')[0]"
* status = #validated
* validationType = PSVVerificationTypeCS#primary-source
* validator.organization = Reference(ex-psv-org-nppes)
* lastPerformed = "2025-10-01T10:00:00Z"
* nextScheduled = "2025-11-01"
