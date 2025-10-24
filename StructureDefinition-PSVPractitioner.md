# PSV Practitioner with Qualification Slices (Common Pattern + Rules) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSV Practitioner with Qualification Slices (Common Pattern + Rules)**

## Resource Profile: PSV Practitioner with Qualification Slices (Common Pattern + Rules) 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/PSVPractitioner | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVPractitioner |

 
Practitioner profile with typed qualification slices and shared invariants for credentialing. 

**Usages:**

* Examples for this Profile: [Practitioner/prac-boards-with-vr](Practitioner-prac-boards-with-vr.md), [Practitioner/prac-dea-with-vr](Practitioner-prac-dea-with-vr.md), [Practitioner/prac-education-with-vr](Practitioner-prac-education-with-vr.md), [Practitioner/prac-jordan-rivera-license-only](Practitioner-prac-jordan-rivera-license-only.md)...Show 3 more,[Practitioner/prac-sanction-demo](Practitioner-prac-sanction-demo.md),[Practitioner/prac-state-csr-with-vr](Practitioner-prac-state-csr-with-vr.md)and[Practitioner/prac-training-with-vr](Practitioner-prac-training-with-vr.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/PSVPractitioner)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-PSVPractitioner.csv), [Excel](StructureDefinition-PSVPractitioner.xlsx), [Schematron](StructureDefinition-PSVPractitioner.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "PSVPractitioner",
  "url" : "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner",
  "version" : "1.0.0",
  "name" : "PSVPractitioner",
  "title" : "PSV Practitioner with Qualification Slices (Common Pattern + Rules)",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Practitioner profile with typed qualification slices and shared invariants for credentialing.",
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
  "type" : "Practitioner",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Practitioner",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Practitioner",
        "path" : "Practitioner"
      },
      {
        "id" : "Practitioner.qualification",
        "path" : "Practitioner.qualification",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code.coding.code"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "Practitioner.qualification:license",
        "path" : "Practitioner.qualification",
        "sliceName" : "license",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Practitioner.qualification:board",
        "path" : "Practitioner.qualification",
        "sliceName" : "board",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Practitioner.qualification:dea",
        "path" : "Practitioner.qualification",
        "sliceName" : "dea",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Practitioner.qualification:state-csr",
        "path" : "Practitioner.qualification",
        "sliceName" : "state-csr",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Practitioner.qualification:education",
        "path" : "Practitioner.qualification",
        "sliceName" : "education",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Practitioner.qualification:training",
        "path" : "Practitioner.qualification",
        "sliceName" : "training",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Practitioner.qualification:cert-aprn-pa",
        "path" : "Practitioner.qualification",
        "sliceName" : "cert-aprn-pa",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Practitioner.qualification:cert-pharm",
        "path" : "Practitioner.qualification",
        "sliceName" : "cert-pharm",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Practitioner.qualification:life-support",
        "path" : "Practitioner.qualification",
        "sliceName" : "life-support",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Practitioner.qualification:compact",
        "path" : "Practitioner.qualification",
        "sliceName" : "compact",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Practitioner.qualification:mate-training",
        "path" : "Practitioner.qualification",
        "sliceName" : "mate-training",
        "min" : 0,
        "max" : "*"
      }
    ]
  }
}

```
