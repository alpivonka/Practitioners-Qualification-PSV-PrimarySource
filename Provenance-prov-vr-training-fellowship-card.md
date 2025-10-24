# Provenance — VR Fellowship (Cardiology) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Provenance — VR Fellowship (Cardiology)**

## Example Provenance: Provenance — VR Fellowship (Cardiology)

Provenance for [VerificationResult: targetLocation = qualification[training][1]; status = validated; statusDate = 2025-10-21 12:30:00+0000; validationType = training-primary-source](VerificationResult-vr-training-fellowship-card.md)

Summary

| | |
| :--- | :--- |
| Recorded | 2025-10-21 12:31:00+0000 |

**Agents**

* **Type**: Verifier
  * **who**: [Organization National Heart Institute](Organization-org-heart-institute.md)



## Resource Content

```json
{
  "resourceType" : "Provenance",
  "id" : "prov-vr-training-fellowship-card",
  "target" : [
    {
      "reference" : "VerificationResult/vr-training-fellowship-card"
    }
  ],
  "recorded" : "2025-10-21T12:31:00Z",
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
        "reference" : "Organization/org-heart-institute"
      }
    }
  ],
  "entity" : [
    {
      "role" : "source",
      "what" : {
        "reference" : "DocumentReference/docref-training-fellowship-card"
      }
    }
  ]
}

```
