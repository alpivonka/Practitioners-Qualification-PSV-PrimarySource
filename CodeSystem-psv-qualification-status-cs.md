# Qualification Status - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Qualification Status**

## CodeSystem: Qualification Status 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/CodeSystem/psv-qualification-status-cs | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVQualificationStatusCS |

 This Code system is referenced in the content logical definition of the following value sets: 

* [PSVQualificationStatusVS](ValueSet-psvVS-qualification-status.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "psv-qualification-status-cs",
  "url" : "http://example.com/fhir/psv/CodeSystem/psv-qualification-status-cs",
  "version" : "1.0.0",
  "name" : "PSVQualificationStatusCS",
  "title" : "Qualification Status",
  "status" : "active",
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
  "count" : 5,
  "concept" : [
    {
      "code" : "active",
      "display" : "Active"
    },
    {
      "code" : "inactive",
      "display" : "Inactive"
    },
    {
      "code" : "expired",
      "display" : "Expired"
    },
    {
      "code" : "suspended",
      "display" : "Suspended"
    },
    {
      "code" : "restricted",
      "display" : "Restricted"
    }
  ]
}

```
