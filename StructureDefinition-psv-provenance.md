# PSV Provenance (US Core derived) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSV Provenance (US Core derived)**

## Resource Profile: PSV Provenance (US Core derived) 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/psv-provenance | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVProvenance |

 
Audits VerificationResult with evidence entities (CSV snapshot, API receipt, PDF). 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/psv-provenance)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-psv-provenance.csv), [Excel](StructureDefinition-psv-provenance.xlsx), [Schematron](StructureDefinition-psv-provenance.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "psv-provenance",
  "url" : "http://example.com/fhir/psv/StructureDefinition/psv-provenance",
  "version" : "1.0.0",
  "name" : "PSVProvenance",
  "title" : "PSV Provenance (US Core derived)",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Audits VerificationResult with evidence entities (CSV snapshot, API receipt, PDF).",
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
      "identity" : "w3c.prov",
      "uri" : "http://www.w3.org/ns/prov",
      "name" : "W3C PROV"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "fhirauditevent",
      "uri" : "http://hl7.org/fhir/auditevent",
      "name" : "FHIR AuditEvent Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Provenance",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Provenance",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Provenance",
        "path" : "Provenance"
      },
      {
        "id" : "Provenance.target",
        "path" : "Provenance.target",
        "mustSupport" : true
      },
      {
        "id" : "Provenance.agent",
        "path" : "Provenance.agent",
        "mustSupport" : true
      },
      {
        "id" : "Provenance.entity",
        "path" : "Provenance.entity",
        "mustSupport" : true
      }
    ]
  }
}

```
