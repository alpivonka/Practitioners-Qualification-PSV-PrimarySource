# PSV AuditEvent - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSV AuditEvent**

## Resource Profile: PSV AuditEvent 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/psv-audit-event | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVAuditEvent |

 
System-level audit of verification operations. 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/psv-audit-event)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-psv-audit-event.csv), [Excel](StructureDefinition-psv-audit-event.xlsx), [Schematron](StructureDefinition-psv-audit-event.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "psv-audit-event",
  "url" : "http://example.com/fhir/psv/StructureDefinition/psv-audit-event",
  "version" : "1.0.0",
  "name" : "PSVAuditEvent",
  "title" : "PSV AuditEvent",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "System-level audit of verification operations.",
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
      "identity" : "dicom",
      "uri" : "http://nema.org/dicom",
      "name" : "DICOM Tag Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "w3c.prov",
      "uri" : "http://www.w3.org/ns/prov",
      "name" : "W3C PROV"
    },
    {
      "identity" : "fhirprovenance",
      "uri" : "http://hl7.org/fhir/provenance",
      "name" : "FHIR Provenance Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "AuditEvent",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/AuditEvent",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "AuditEvent",
        "path" : "AuditEvent"
      }
    ]
  }
}

```
