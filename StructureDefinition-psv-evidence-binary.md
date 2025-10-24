# PSV Evidence Binary - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSV Evidence Binary**

## Resource Profile: PSV Evidence Binary 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/psv-evidence-binary | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVEvidenceBinary |

 
Raw binary artifact (hashable). 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/psv-evidence-binary)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-psv-evidence-binary.csv), [Excel](StructureDefinition-psv-evidence-binary.xlsx), [Schematron](StructureDefinition-psv-evidence-binary.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "psv-evidence-binary",
  "url" : "http://example.com/fhir/psv/StructureDefinition/psv-evidence-binary",
  "version" : "1.0.0",
  "name" : "PSVEvidenceBinary",
  "title" : "PSV Evidence Binary",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Raw binary artifact (hashable).",
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
  "kind" : "resource",
  "abstract" : false,
  "type" : "Binary",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Binary",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Binary",
        "path" : "Binary"
      },
      {
        "id" : "Binary.contentType",
        "path" : "Binary.contentType",
        "mustSupport" : true
      }
    ]
  }
}

```
