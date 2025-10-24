# Practitioner with License, Sanction, Flag, Evidence - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Practitioner with License, Sanction, Flag, Evidence**

## Example Practitioner: Practitioner with License, Sanction, Flag, Evidence

Profile: [PSV Practitioner with Qualification Slices (Common Pattern + Rules)](StructureDefinition-PSVPractitioner.md)

**identifier**: [United States National Provider Identifier](http://terminology.hl7.org/6.5.0/NamingSystem-npi.html)/1234567893

**name**: Morgan Chavez 

> **qualification****org/fhir/uv/psv/StructureDefinition/qualification-status**:suspended**org/fhir/uv/psv/StructureDefinition/qualification-restriction**:No direct patient care until 2025-12-31**identifier**:`https://flboard.gov/license`/ME-445566**code**:license**period**: 2022-01-01 --> 2026-12-31**issuer**:[Organization Florida Board of Medicine](Organization-org-florida-medical-board.md)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "prac-sanction-demo",
  "meta" : {
    "profile" : [
      "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner"
    ]
  },
  "identifier" : [
    {
      "system" : "http://hl7.org/fhir/sid/us-npi",
      "value" : "1234567893"
    }
  ],
  "name" : [
    {
      "family" : "Chavez",
      "given" : ["Morgan"]
    }
  ],
  "qualification" : [
    {
      "extension" : [
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/qualification-status",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-status-cs",
                "code" : "suspended"
              }
            ]
          }
        },
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/qualification-restriction",
          "valueCodeableConcept" : {
            "text" : "No direct patient care until 2025-12-31"
          }
        }
      ],
      "identifier" : [
        {
          "system" : "https://flboard.gov/license",
          "value" : "ME-445566"
        }
      ],
      "code" : {
        "coding" : [
          {
            "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs",
            "code" : "license"
          }
        ]
      },
      "period" : {
        "start" : "2022-01-01",
        "end" : "2026-12-31"
      },
      "issuer" : {
        "reference" : "Organization/org-florida-medical-board"
      }
    }
  ]
}

```
