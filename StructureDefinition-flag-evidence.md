# Flag Evidence (VerificationResult link) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Flag Evidence (VerificationResult link)**

## Extension: Flag Evidence (VerificationResult link) 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/flag-evidence | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:FlagEvidence |

Carries a reference to the VerificationResult that justifies this Flag.

**Context of Use**

**Usage info**

**Usages:**

* Examples for this Extension: [Flag/flag-license-sanction-example](Flag-flag-license-sanction-example.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/flag-evidence)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-flag-evidence.csv), [Excel](StructureDefinition-flag-evidence.xlsx), [Schematron](StructureDefinition-flag-evidence.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "flag-evidence",
  "url" : "http://example.com/fhir/psv/StructureDefinition/flag-evidence",
  "version" : "1.0.0",
  "name" : "FlagEvidence",
  "title" : "Flag Evidence (VerificationResult link)",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Carries a reference to the VerificationResult that justifies this Flag.",
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
      "expression" : "Flag"
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
        "short" : "Flag Evidence (VerificationResult link)",
        "definition" : "Carries a reference to the VerificationResult that justifies this Flag."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://example.com/fhir/psv/StructureDefinition/flag-evidence"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/VerificationResult"]
          }
        ]
      }
    ]
  }
}

```
