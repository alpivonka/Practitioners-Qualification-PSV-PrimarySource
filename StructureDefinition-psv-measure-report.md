# PSV MeasureReport - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSV MeasureReport**

## Resource Profile: PSV MeasureReport 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/psv-measure-report | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVMeasureReport |

 
Reports metrics for verification coverage/SLA. 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/psv-measure-report)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-psv-measure-report.csv), [Excel](StructureDefinition-psv-measure-report.xlsx), [Schematron](StructureDefinition-psv-measure-report.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "psv-measure-report",
  "url" : "http://example.com/fhir/psv/StructureDefinition/psv-measure-report",
  "version" : "1.0.0",
  "name" : "PSVMeasureReport",
  "title" : "PSV MeasureReport",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Reports metrics for verification coverage/SLA.",
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
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "MeasureReport",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/MeasureReport",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "MeasureReport",
        "path" : "MeasureReport"
      }
    ]
  }
}

```
