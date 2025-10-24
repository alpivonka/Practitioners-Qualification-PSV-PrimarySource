# Training Type - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Training Type**

## CodeSystem: Training Type 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/uv/psv/CodeSystem/psv-training-type-cs | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVTrainingTypeCS |

 
Types of postgraduate clinical training programs. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [PSVTrainingTypeVS](ValueSet-psvVS-training-type.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "psv-training-type-cs",
  "url" : "http://example.org/fhir/uv/psv/CodeSystem/psv-training-type-cs",
  "version" : "1.0.0",
  "name" : "PSVTrainingTypeCS",
  "title" : "Training Type",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Types of postgraduate clinical training programs.",
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
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 5,
  "concept" : [
    {
      "code" : "residency",
      "display" : "Residency"
    },
    {
      "code" : "fellowship",
      "display" : "Fellowship"
    },
    {
      "code" : "internship",
      "display" : "Internship"
    },
    {
      "code" : "transitional-year",
      "display" : "Transitional Year"
    },
    {
      "code" : "preliminary-year",
      "display" : "Preliminary Year"
    }
  ]
}

```
