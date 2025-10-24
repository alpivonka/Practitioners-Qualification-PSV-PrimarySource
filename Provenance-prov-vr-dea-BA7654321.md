# Provenance for VR — DEA BA7654321 - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Provenance for VR — DEA BA7654321**

## Example Provenance: Provenance for VR — DEA BA7654321

Provenance for [VerificationResult: targetLocation = qualification[dea][1]; status = validated; statusDate = 2025-10-21 14:08:00+0000; validationType = dea-primary-source](VerificationResult-vr-dea-BA7654321.md)

Summary

| | |
| :--- | :--- |
| Recorded | 2025-10-21 14:09:00+0000 |

**Agents**

* **Type**: Verifier
  * **who**: [Organization DEA Diversion Control Division](Organization-org-dea-diversion.md)



## Resource Content

```json
{
  "resourceType" : "Provenance",
  "id" : "prov-vr-dea-BA7654321",
  "target" : [
    {
      "reference" : "VerificationResult/vr-dea-BA7654321"
    }
  ],
  "recorded" : "2025-10-21T14:09:00Z",
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
        "reference" : "Organization/org-dea-diversion"
      }
    }
  ],
  "entity" : [
    {
      "role" : "source",
      "what" : {
        "reference" : "DocumentReference/docref-dea-BA7654321"
      }
    }
  ]
}

```
