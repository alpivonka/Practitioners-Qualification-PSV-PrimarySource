# PSV Organization (US Core derived) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSV Organization (US Core derived)**

## Resource Profile: PSV Organization (US Core derived) 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/psv-organization | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVOrganization |

 
Represents employers, boards (validators), certifying bodies, accreditors. 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/psv-organization)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-psv-organization.csv), [Excel](StructureDefinition-psv-organization.xlsx), [Schematron](StructureDefinition-psv-organization.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "psv-organization",
  "url" : "http://example.com/fhir/psv/StructureDefinition/psv-organization",
  "version" : "1.0.0",
  "name" : "PSVOrganization",
  "title" : "PSV Organization (US Core derived)",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Represents employers, boards (validators), certifying bodies, accreditors.",
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
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "servd",
      "uri" : "http://www.omg.org/spec/ServD/1.0/",
      "name" : "ServD"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Organization",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Organization",
        "path" : "Organization"
      },
      {
        "id" : "Organization.name",
        "path" : "Organization.name",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Organization.endpoint",
        "path" : "Organization.endpoint",
        "mustSupport" : true
      }
    ]
  }
}

```
