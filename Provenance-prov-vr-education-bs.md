# Provenance — VR BS Degree - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Provenance — VR BS Degree**

## Example Provenance: Provenance — VR BS Degree

Provenance for [VerificationResult: targetLocation = qualification[education][1]; status = validated; statusDate = 2025-10-21 13:57:00+0000; validationType = education-primary-source](VerificationResult-vr-education-bs.md)

Summary

| | |
| :--- | :--- |
| Recorded | 2025-10-21 13:58:00+0000 |

**Agents**

* **Type**: Verifier
  * **who**: [Organization State University College of Medicine](Organization-org-state-university-med.md)



## Resource Content

```json
{
  "resourceType" : "Provenance",
  "id" : "prov-vr-education-bs",
  "target" : [
    {
      "reference" : "VerificationResult/vr-education-bs"
    }
  ],
  "recorded" : "2025-10-21T13:58:00Z",
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
        "reference" : "DocumentReference/docref-education-bs"
      }
    }
  ]
}

```
