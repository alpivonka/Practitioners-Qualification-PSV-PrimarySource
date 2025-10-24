# Provenance — VR Residency (IM) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Provenance — VR Residency (IM)**

## Example Provenance: Provenance — VR Residency (IM)

Provenance for [VerificationResult: targetLocation = qualification[training][0]; status = validated; statusDate = 2025-10-21 12:25:00+0000; validationType = training-primary-source](VerificationResult-vr-training-residency-im.md)

Summary

| | |
| :--- | :--- |
| Recorded | 2025-10-21 12:26:00+0000 |

**Agents**

* **Type**: Verifier
  * **who**: [Organization City Medical Center — Graduate Medical Education](Organization-org-citymed-gme.md)



## Resource Content

```json
{
  "resourceType" : "Provenance",
  "id" : "prov-vr-training-residency-im",
  "target" : [
    {
      "reference" : "VerificationResult/vr-training-residency-im"
    }
  ],
  "recorded" : "2025-10-21T12:26:00Z",
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
        "reference" : "Organization/org-citymed-gme"
      }
    }
  ],
  "entity" : [
    {
      "role" : "source",
      "what" : {
        "reference" : "DocumentReference/docref-training-residency-im"
      }
    }
  ]
}

```
