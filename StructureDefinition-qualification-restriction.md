# Qualification Restriction - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Qualification Restriction**

## Extension: Qualification Restriction 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/qualification-restriction | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:qualification-restriction |

**Context of Use**

**Usage info**

**Usages:**

* This Extension is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/qualification-restriction)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-qualification-restriction.csv), [Excel](StructureDefinition-qualification-restriction.xlsx), [Schematron](StructureDefinition-qualification-restriction.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "qualification-restriction",
  "url" : "http://example.com/fhir/psv/StructureDefinition/qualification-restriction",
  "version" : "1.0.0",
  "name" : "qualification-restriction",
  "title" : "Qualification Restriction",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
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
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Element"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Qualification Restriction"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://example.com/fhir/psv/StructureDefinition/qualification-restriction"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      }
    ]
  }
}

```
