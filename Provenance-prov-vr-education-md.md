# Provenance — VR MD Degree - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Provenance — VR MD Degree**

## Example Provenance: Provenance — VR MD Degree

Provenance for [VerificationResult: targetLocation = qualification[education][0]; status = validated; statusDate = 2025-10-21 13:55:00+0000; validationType = education-primary-source](VerificationResult-vr-education-md.md)

Summary

| | |
| :--- | :--- |
| Recorded | 2025-10-21 13:56:00+0000 |

**Agents**

* **Type**: Verifier
  * **who**: [Organization State University College of Medicine](Organization-org-state-university-med.md)



## Resource Content

```json
{
  "resourceType" : "Provenance",
  "id" : "prov-vr-education-md",
  "target" : [
    {
      "reference" : "VerificationResult/vr-education-md"
    }
  ],
  "recorded" : "2025-10-21T13:56:00Z",
  "agent" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
            "code" : "verifier"
          }
        ]
      },
      "who" : {
        "reference" : "Organization/org-state-university-med"
      }
    }
  ],
  "entity" : [
    {
      "role" : "source",
      "what" : {
        "reference" : "DocumentReference/docref-education-md"
      }
    }
  ]
}

```
