# PSV Endpoint (US Core derived) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSV Endpoint (US Core derived)**

## Resource Profile: PSV Endpoint (US Core derived) 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/psv-endpoint | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVEndpoint |

 
Endpoints for boards/registries/verifiers. 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/psv-endpoint)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-psv-endpoint.csv), [Excel](StructureDefinition-psv-endpoint.xlsx), [Schematron](StructureDefinition-psv-endpoint.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "psv-endpoint",
  "url" : "http://example.com/fhir/psv/StructureDefinition/psv-endpoint",
  "version" : "1.0.0",
  "name" : "PSVEndpoint",
  "title" : "PSV Endpoint (US Core derived)",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Endpoints for boards/registries/verifiers.",
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
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Endpoint",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Endpoint",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Endpoint",
        "path" : "Endpoint"
      },
      {
        "id" : "Endpoint.status",
        "path" : "Endpoint.status",
        "mustSupport" : true
      },
      {
        "id" : "Endpoint.connectionType",
        "path" : "Endpoint.connectionType",
        "mustSupport" : true
      },
      {
        "id" : "Endpoint.address",
        "path" : "Endpoint.address",
        "mustSupport" : true
      }
    ]
  }
}

```
