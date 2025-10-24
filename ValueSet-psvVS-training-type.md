# VS — Training Type - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS — Training Type**

## ValueSet: VS — Training Type 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/uv/psv/ValueSet/psvVS-training-type | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVTrainingTypeVS |

 
Allowed training types for practitioner qualifications. 

 **References** 

* [Training Type](StructureDefinition-training-type.md)

### Logical Definition (CLD)

* Include all codes defined in [`http://example.org/fhir/uv/psv/CodeSystem/psv-training-type-cs`](CodeSystem-psv-training-type-cs.md)version 📦1.0.0

 

### Expansion

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
  "id" : "psvVS-training-type",
  "url" : "http://example.org/fhir/uv/psv/ValueSet/psvVS-training-type",
  "version" : "1.0.0",
  "name" : "PSVTrainingTypeVS",
  "title" : "VS — Training Type",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Allowed training types for practitioner qualifications.",
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
        "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-training-type-cs"
      }
    ]
  }
}

```
