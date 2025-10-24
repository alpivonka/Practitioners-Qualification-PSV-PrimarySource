# PSV Action CodeSystem - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSV Action CodeSystem**

## CodeSystem: PSV Action CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/CodeSystem/psv-action-cs | *Version*:1.0.0 |
| Draft as of 2025-10-24 | *Computable Name*:PSVActionCS |

 This Code system is referenced in the content logical definition of the following value sets: 

* [PSVActionVS](ValueSet-psv-action-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "psv-action-cs",
  "url" : "http://example.com/fhir/psv/CodeSystem/psv-action-cs",
  "version" : "1.0.0",
  "name" : "PSVActionCS",
  "title" : "PSV  Action CodeSystem",
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
      "code" : "record-only",
      "display" : "Record Only"
    },
    {
      "code" : "manual-review",
      "display" : "Manual Review"
    },
    {
      "code" : "block",
      "display" : "Block"
    }
  ]
}

```
