# prov-vr-prac-boards-abem - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **prov-vr-prac-boards-abem**

## Example Provenance: prov-vr-prac-boards-abem

Provenance for [VerificationResult: targetLocation = qualification[board][1]; status = validated; statusDate = 2025-10-21 14:10:00+0000; validationType = board-primary-source](VerificationResult-vr-prac-boards-abem.md)

Summary

| | |
| :--- | :--- |
| Recorded | 2025-10-21 14:12:00+0000 |

**Agents**

* **Type**: Verifier
  * **who**: [Organization American Board of Emergency Medicine (ABEM)](Organization-org-abem.md)



## Resource Content

```json
{
  "resourceType" : "Provenance",
  "id" : "prov-vr-prac-boards-abem",
  "target" : [
    {
      "reference" : "VerificationResult/vr-prac-boards-abem"
    }
  ],
  "recorded" : "2025-10-21T14:12:00Z",
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
        "reference" : "Organization/org-abem"
      }
    }
  ],
  "entity" : [
    {
      "role" : "source",
      "what" : {
        "reference" : "DocumentReference/docref-abem-verification"
      }
    }
  ]
}

```
