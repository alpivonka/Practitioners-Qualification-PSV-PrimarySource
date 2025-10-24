# flag-license-sanction-example - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **flag-license-sanction-example**

## Example Flag: flag-license-sanction-example

**Flag Evidence (VerificationResult link)**: [VerificationResult: extension = ->DocumentReference: status = current; type = ; date = 2025-09-15 10:00:00+0000; targetLocation = qualification[license][0]; status = completed; statusDate = 2025-09-15 10:01:00+0000; failureAction =](VerificationResult-vr-license-suspension.md)

**Flag Target Location (element path)**: qualification[license][0]

**status**: Active

**category**: Sanction

**code**: Board suspension

**subject**: [Practitioner Morgan Chavez](Practitioner-prac-sanction-demo.md)

**period**: 2025-09-15 --> 2025-12-31



## Resource Content

```json
{
  "resourceType" : "Flag",
  "id" : "flag-license-sanction-example",
  "extension" : [
    {
      "url" : "http://example.com/fhir/psv/StructureDefinition/flag-evidence",
      "valueReference" : {
        "reference" : "VerificationResult/vr-license-suspension"
      }
    },
    {
      "url" : "http://example.com/fhir/psv/StructureDefinition/flag-targetLocation",
      "valueString" : "qualification[license][0]"
    }
  ],
  "status" : "active",
  "category" : [
    {
      "text" : "Sanction"
    }
  ],
  "code" : {
    "text" : "Board suspension"
  },
  "subject" : {
    "reference" : "Practitioner/prac-sanction-demo"
  },
  "period" : {
    "start" : "2025-09-15",
    "end" : "2025-12-31"
  }
}

```
