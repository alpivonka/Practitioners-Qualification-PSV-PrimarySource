# Provenance — GA CSR VR - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Provenance — GA CSR VR**

## Example Provenance: Provenance — GA CSR VR

Provenance for [VerificationResult: targetLocation = qualification[state-csr][1]; status = validated; statusDate = 2025-10-21 14:08:00+0000; validationType = state-csr-primary-source](VerificationResult-vr-csr-ga-2219.md)

Summary

| | |
| :--- | :--- |
| Recorded | 2025-10-21 14:09:00+0000 |

**Agents**

* **Type**: Verifier
  * **who**: [Organization Florida Department of Health — Controlled Substance Registration](Organization-org-florida-csr-authority.md)



## Resource Content

```json
{
  "resourceType" : "Provenance",
  "id" : "prov-vr-csr-ga-2219",
  "target" : [
    {
      "reference" : "VerificationResult/vr-csr-ga-2219"
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
        "reference" : "Organization/org-florida-csr-authority"
      }
    }
  ],
  "entity" : [
    {
      "role" : "source",
      "what" : {
        "reference" : "DocumentReference/docref-csr-ga-2219"
      }
    }
  ]
}

```
