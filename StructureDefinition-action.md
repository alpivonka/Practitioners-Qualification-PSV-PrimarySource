# Action - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Action**

## Extension: Action 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/action | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:Action |

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [PSV VerificationResult](StructureDefinition-psv-verificationresult.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/action)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-action.csv), [Excel](StructureDefinition-action.xlsx), [Schematron](StructureDefinition-action.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "action",
  "url" : "http://example.com/fhir/psv/StructureDefinition/action",
  "version" : "1.0.0",
  "name" : "Action",
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
      "expression" : "VerificationResult"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://example.com/fhir/psv/StructureDefinition/action"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://example.com/fhir/psv/ValueSet/psv-action-vs"
        }
      }
    ]
  }
}

```
