# Provenance for VR — Alex Smith License - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Provenance for VR — Alex Smith License**

## Example Provenance: Provenance for VR — Alex Smith License

Provenance for [VerificationResult: targetLocation = qualification[license][0]; status = validated; statusDate = 2025-10-21 14:05:00+0000; validationType = license-primary-source](VerificationResult-vr-alex-smith-license-2025Q1.md)

Summary

| | |
| :--- | :--- |
| Recorded | 2025-02-15 10:33:10-0500 |

**Agents**

* **Type**: Verifier
  * **who**: `org-state-medical-board`



## Resource Content

```json
{
  "resourceType" : "Provenance",
  "id" : "prov-vr-alex-smith-license-2025Q1",
  "target" : [
    {
      "reference" : "VerificationResult/vr-alex-smith-license-2025Q1"
    }
  ],
  "recorded" : "2025-02-15T10:33:10-05:00",
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
        "reference" : "org-state-medical-board"
      }
    }
  ],
  "entity" : [
    {
      "role" : "source",
      "what" : {
        "reference" : "DocumentReference/docref-board-response"
      }
    }
  ]
}

```
