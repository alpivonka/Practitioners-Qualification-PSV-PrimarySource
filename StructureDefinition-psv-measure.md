# PSV Measure - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSV Measure**

## Resource Profile: PSV Measure 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/psv-measure | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVMeasure |

 
Aggregates verification coverage or SLA metrics. 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/psv-measure)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-psv-measure.csv), [Excel](StructureDefinition-psv-measure.xlsx), [Schematron](StructureDefinition-psv-measure.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "psv-measure",
  "url" : "http://example.com/fhir/psv/StructureDefinition/psv-measure",
  "version" : "1.0.0",
  "name" : "PSVMeasure",
  "title" : "PSV Measure",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Aggregates verification coverage or SLA metrics.",
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
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "objimpl",
      "uri" : "http://hl7.org/fhir/object-implementation",
      "name" : "Object Implementation Information"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Measure",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Measure",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Measure",
        "path" : "Measure"
      }
    ]
  }
}

```
