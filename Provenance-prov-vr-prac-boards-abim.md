# prov-vr-prac-boards-abim - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **prov-vr-prac-boards-abim**

## Example Provenance: prov-vr-prac-boards-abim

Provenance for [VerificationResult: targetLocation = qualification[board][0]; status = validated; statusDate = 2025-10-21 14:05:00+0000; validationType = board-primary-source](VerificationResult-vr-prac-boards-abim.md)

Summary

| | |
| :--- | :--- |
| Recorded | 2025-10-21 14:11:00+0000 |

**Agents**

* **Type**: Verifier
  * **who**: [Organization American Board of Internal Medicine (ABIM)](Organization-org-abim.md)



## Resource Content

```json
{
  "resourceType" : "Provenance",
  "id" : "prov-vr-prac-boards-abim",
  "target" : [
    {
      "reference" : "VerificationResult/vr-prac-boards-abim"
    }
  ],
  "recorded" : "2025-10-21T14:11:00Z",
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
        "reference" : "Organization/org-abim"
      }
    }
  ],
  "entity" : [
    {
      "role" : "source",
      "what" : {
        "reference" : "DocumentReference/docref-abim-verification"
      }
    }
  ]
}

```
