# PSV OrganizationAffiliation - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSV OrganizationAffiliation**

## Resource Profile: PSV OrganizationAffiliation 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/StructureDefinition/psv-organizationaffiliation | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVOrganizationAffiliation |

 
Privileges and affiliations between organizations and practitioners. 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/credentials-psv-primarysource|current/StructureDefinition/psv-organizationaffiliation)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-psv-organizationaffiliation.csv), [Excel](StructureDefinition-psv-organizationaffiliation.xlsx), [Schematron](StructureDefinition-psv-organizationaffiliation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "psv-organizationaffiliation",
  "url" : "http://example.com/fhir/psv/StructureDefinition/psv-organizationaffiliation",
  "version" : "1.0.0",
  "name" : "PSVOrganizationAffiliation",
  "title" : "PSV OrganizationAffiliation",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Privileges and affiliations between organizations and practitioners.",
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
  "type" : "OrganizationAffiliation",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/OrganizationAffiliation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "OrganizationAffiliation",
        "path" : "OrganizationAffiliation"
      },
      {
        "id" : "OrganizationAffiliation.period",
        "path" : "OrganizationAffiliation.period",
        "mustSupport" : true
      },
      {
        "id" : "OrganizationAffiliation.organization",
        "path" : "OrganizationAffiliation.organization",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "OrganizationAffiliation.participatingOrganization",
        "path" : "OrganizationAffiliation.participatingOrganization",
        "mustSupport" : true
      },
      {
        "id" : "OrganizationAffiliation.code",
        "path" : "OrganizationAffiliation.code",
        "mustSupport" : true
      },
      {
        "id" : "OrganizationAffiliation.specialty",
        "path" : "OrganizationAffiliation.specialty",
        "mustSupport" : true
      }
    ]
  }
}

```
