# PSV ActivityDefinition (Verification Activity) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSV ActivityDefinition (Verification Activity)**

## Resource Profile: PSV ActivityDefinition (Verification Activity) 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/psv-activity-definition | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVActivityDefinition |

 
Defines a concrete verification activity to be performed by a worker/system. 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/psv-activity-definition)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-psv-activity-definition.csv), [Excel](StructureDefinition-psv-activity-definition.xlsx), [Schematron](StructureDefinition-psv-activity-definition.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "psv-activity-definition",
  "url" : "http://example.com/fhir/psv/StructureDefinition/psv-activity-definition",
  "version" : "1.0.0",
  "name" : "PSVActivityDefinition",
  "title" : "PSV ActivityDefinition (Verification Activity)",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Defines a concrete verification activity to be performed by a worker/system.",
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
      "identity" : "objimpl",
      "uri" : "http://hl7.org/fhir/object-implementation",
      "name" : "Object Implementation Information"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ActivityDefinition",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/ActivityDefinition",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "ActivityDefinition",
        "path" : "ActivityDefinition"
      }
    ]
  }
}

```
