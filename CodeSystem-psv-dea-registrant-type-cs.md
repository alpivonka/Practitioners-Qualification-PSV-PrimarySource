# DEA Registrant Type - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DEA Registrant Type**

## CodeSystem: DEA Registrant Type 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/CodeSystem/psv-dea-registrant-type-cs | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVDEARegistrantTypeCS |

 
DEA registrant categories relevant to care delivery and dispensing. 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "psv-dea-registrant-type-cs",
  "url" : "http://example.com/fhir/psv/CodeSystem/psv-dea-registrant-type-cs",
  "version" : "1.0.0",
  "name" : "PSVDEARegistrantTypeCS",
  "title" : "DEA Registrant Type",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "DEA registrant categories relevant to care delivery and dispensing.",
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
  "count" : 7,
  "concept" : [
    {
      "code" : "practitioner",
      "display" : "Practitioner"
    },
    {
      "code" : "midlevel-practitioner",
      "display" : "Mid-level Practitioner"
    },
    {
      "code" : "hospital-clinic",
      "display" : "Hospital/Clinic"
    },
    {
      "code" : "pharmacy",
      "display" : "Pharmacy"
    },
    {
      "code" : "teaching-institution",
      "display" : "Teaching Institution"
    },
    {
      "code" : "narcotic-treatment",
      "display" : "Narcotic Treatment Program"
    },
    {
      "code" : "researcher",
      "display" : "Researcher"
    }
  ]
}

```
