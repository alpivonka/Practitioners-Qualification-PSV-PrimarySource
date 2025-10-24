# DEA Controlled Substance Schedules (II–V) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DEA Controlled Substance Schedules (II–V)**

## CodeSystem: DEA Controlled Substance Schedules (II–V) 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/CodeSystem/psv-dea-schedule-cs | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVDEAScheduleCS |

 
Subset of U.S. controlled substance schedules commonly applicable to prescribers. Schedule I excluded. 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "psv-dea-schedule-cs",
  "url" : "http://example.com/fhir/psv/CodeSystem/psv-dea-schedule-cs",
  "version" : "1.0.0",
  "name" : "PSVDEAScheduleCS",
  "title" : "DEA Controlled Substance Schedules (II–V)",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Subset of U.S. controlled substance schedules commonly applicable to prescribers. Schedule I excluded.",
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
  "count" : 4,
  "concept" : [
    {
      "code" : "II",
      "display" : "Schedule II"
    },
    {
      "code" : "III",
      "display" : "Schedule III"
    },
    {
      "code" : "IV",
      "display" : "Schedule IV"
    },
    {
      "code" : "V",
      "display" : "Schedule V"
    }
  ]
}

```
