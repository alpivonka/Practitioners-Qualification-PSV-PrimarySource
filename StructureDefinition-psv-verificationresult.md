# PSV VerificationResult - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSV VerificationResult**

## Resource Profile: PSV VerificationResult 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/psv-verificationresult | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVVerificationResult |

 
Standard verification evidence linking validators to verified targets. 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/psv-verificationresult)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-psv-verificationresult.csv), [Excel](StructureDefinition-psv-verificationresult.xlsx), [Schematron](StructureDefinition-psv-verificationresult.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "psv-verificationresult",
  "url" : "http://example.com/fhir/psv/StructureDefinition/psv-verificationresult",
  "version" : "1.0.0",
  "name" : "PSVVerificationResult",
  "title" : "PSV VerificationResult",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Standard verification evidence linking validators to verified targets.",
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
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "VerificationResult",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/VerificationResult",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "VerificationResult",
        "path" : "VerificationResult"
      },
      {
        "id" : "VerificationResult.extension",
        "path" : "VerificationResult.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "VerificationResult.extension:Action",
        "path" : "VerificationResult.extension",
        "sliceName" : "Action",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://example.com/fhir/psv/StructureDefinition/action"]
          }
        ]
      },
      {
        "id" : "VerificationResult.target",
        "path" : "VerificationResult.target",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "VerificationResult.targetLocation",
        "path" : "VerificationResult.targetLocation",
        "mustSupport" : true
      },
      {
        "id" : "VerificationResult.status",
        "path" : "VerificationResult.status",
        "mustSupport" : true
      },
      {
        "id" : "VerificationResult.validationType",
        "path" : "VerificationResult.validationType",
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "http://example.com/fhir/psv/ValueSet/psv-verification-type-vs"
        }
      },
      {
        "id" : "VerificationResult.frequency",
        "path" : "VerificationResult.frequency",
        "mustSupport" : true
      },
      {
        "id" : "VerificationResult.lastPerformed",
        "path" : "VerificationResult.lastPerformed",
        "mustSupport" : true
      },
      {
        "id" : "VerificationResult.nextScheduled",
        "path" : "VerificationResult.nextScheduled",
        "mustSupport" : true
      },
      {
        "id" : "VerificationResult.validator",
        "path" : "VerificationResult.validator",
        "max" : "1",
        "mustSupport" : true
      }
    ]
  }
}

```
