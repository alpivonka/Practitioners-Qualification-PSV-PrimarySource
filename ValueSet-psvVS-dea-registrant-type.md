# VS — DEA Registrant Type - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS — DEA Registrant Type**

## ValueSet: VS — DEA Registrant Type 

| | |
| :--- | :--- |
| *Official URL*:http://example.com/fhir/psv/ValueSet/psvVS-dea-registrant-type | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVDEARegistrantTypeVS |

 
Allowed DEA registrant categories for practitioner credentialing. 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

* Include all codes defined in `http://example.org/fhir/uv/psv/CodeSystem/psv-dea-registrant-type-cs`version Not Stated (use latest from terminology server)

 

### Expansion

No Expansion for this valueset (Unknown Code System)

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "psvVS-dea-registrant-type",
  "url" : "http://example.com/fhir/psv/ValueSet/psvVS-dea-registrant-type",
  "version" : "1.0.0",
  "name" : "PSVDEARegistrantTypeVS",
  "title" : "VS — DEA Registrant Type",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Allowed DEA registrant categories for practitioner credentialing.",
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
  "compose" : {
    "include" : [
      {
        "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-dea-registrant-type-cs"
      }
    ]
  }
}

```
