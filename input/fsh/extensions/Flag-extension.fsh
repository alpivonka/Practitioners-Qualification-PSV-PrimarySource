Extension: FlagEvidence          // <-- PascalCase, no hyphens
Id: flag-evidence                // <-- hyphens OK here
Title: "Flag Evidence (VerificationResult link)"
Description: "Carries a reference to the VerificationResult that justifies this Flag."
* ^context[0].type = #element
* ^context[0].expression = "Flag"        // use on Flag only
* value[x] only Reference(VerificationResult)


Extension: FlagTargetLocation
Id: flag-targetLocation
Title: "Flag Target Location (element path)"
Description: "Optional element path (e.g., qualification[license][0]) for UI deep-linking."
* ^context[0].type = #element
* ^context[0].expression = "Flag"        // use on Flag only
* value[x] only string

Instance: flag-license-sanction-example
InstanceOf: Flag
Usage: #example
* status = #active
* category[0].text = "Sanction"
* code.text = "Board suspension"
* subject = Reference(Practitioner/prac-sanction-demo)
* period.start = 2025-09-15
* period.end   = 2025-12-31
* extension[FlagEvidence].valueReference = Reference(VerificationResult/vr-license-suspension)
* extension[FlagTargetLocation].valueString = "qualification[license][0]"