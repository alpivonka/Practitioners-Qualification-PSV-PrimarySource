# PSV Verification Type CodeSystem - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSV Verification Type CodeSystem**

## CodeSystem: PSV Verification Type CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/CodeSystem/psv-verification-type-cs | *Version*:1.0.0 |
| Draft as of 2025-10-24 | *Computable Name*:PSVVerificationTypeCS |

 This Code system is referenced in the content logical definition of the following value sets: 

* [PSVVerificationTypeVS](ValueSet-psv-verification-type-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "psv-verification-type-cs",
  "url" : "http://example.com/fhir/psv/CodeSystem/psv-verification-type-cs",
  "version" : "1.0.0",
  "name" : "PSVVerificationTypeCS",
  "title" : "PSV Verification Type CodeSystem",
  "status" : "draft",
  "date" : "2025-10-24T14:50:11+00:00",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
          "code" : "001",
          "display" : "World"
        }
      ]
    }
  ],
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "primary-source",
      "display" : "Primary Source"
    },
    {
      "code" : "attestation",
      "display" : "Attestation"
    },
    {
      "code" : "other",
      "display" : "Other"
    }
  ]
}

```
