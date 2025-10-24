# PSV Verification Task - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSV Verification Task**

## Resource Profile: PSV Verification Task 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/psv-verification-task | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVVerificationTask |

 
Requests execution of a verification (e.g., LEIE monthly, license quarterly). 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/psv-verification-task)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-psv-verification-task.csv), [Excel](StructureDefinition-psv-verification-task.xlsx), [Schematron](StructureDefinition-psv-verification-task.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "psv-verification-task",
  "url" : "http://example.com/fhir/psv/StructureDefinition/psv-verification-task",
  "version" : "1.0.0",
  "name" : "PSVVerificationTask",
  "title" : "PSV Verification Task",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Requests execution of a verification (e.g., LEIE monthly, license quarterly).",
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
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Task",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Task",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Task",
        "path" : "Task"
      },
      {
        "id" : "Task.status",
        "path" : "Task.status",
        "mustSupport" : true
      },
      {
        "id" : "Task.code",
        "path" : "Task.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Task.focus",
        "path" : "Task.focus",
        "mustSupport" : true
      },
      {
        "id" : "Task.for",
        "path" : "Task.for",
        "mustSupport" : true
      },
      {
        "id" : "Task.executionPeriod",
        "path" : "Task.executionPeriod",
        "mustSupport" : true
      }
    ]
  }
}

```
