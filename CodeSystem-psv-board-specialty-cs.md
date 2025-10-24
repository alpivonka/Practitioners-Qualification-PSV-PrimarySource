# Board/Training Specialty (Minimal) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Board/Training Specialty (Minimal)**

## CodeSystem: Board/Training Specialty (Minimal) 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/uv/psv/CodeSystem/psv-board-specialty-cs | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVBoardSpecialtyCS |

 
Minimal specialty codes used in examples. Replace/expand with your authoritative list. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [PSVBoardSpecialtyVS](ValueSet-psvVS-board-specialty.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "psv-board-specialty-cs",
  "url" : "http://example.org/fhir/uv/psv/CodeSystem/psv-board-specialty-cs",
  "version" : "1.0.0",
  "name" : "PSVBoardSpecialtyCS",
  "title" : "Board/Training Specialty (Minimal)",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Minimal specialty codes used in examples. Replace/expand with your authoritative list.",
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
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "IM",
      "display" : "Internal Medicine"
    },
    {
      "code" : "EM",
      "display" : "Emergency Medicine"
    },
    {
      "code" : "CARD",
      "display" : "Cardiovascular Disease"
    }
  ]
}

```
