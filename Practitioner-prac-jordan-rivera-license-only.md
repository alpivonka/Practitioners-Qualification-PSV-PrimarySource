# PSVPractitioner — License slice populated - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSVPractitioner — License slice populated**

## Example Practitioner: PSVPractitioner — License slice populated

Profiles: [PSV Practitioner with Qualification Slices (Common Pattern + Rules)](StructureDefinition-PSVPractitioner.md), `http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner`

**identifier**: [United States National Provider Identifier](http://terminology.hl7.org/6.5.0/NamingSystem-npi.html)/1987654321

**name**: Jordan Rivera 

> **qualification****org/fhir/uv/psv/StructureDefinition/qualification-status**:active**org/fhir/uv/psv/StructureDefinition/qualification-jurisdiction**:Florida**identifier**:`https://flboard.gov/license`/ME12345**code**:license**period**: 2023-01-01 --> 2026-12-31**issuer**:[Organization Florida Board of Medicine](Organization-org-florida-medical-board.md)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "prac-jordan-rivera-license-only",
  "meta" : {
    "profile" : [
      "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner",
      "http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner"
    ]
  },
  "identifier" : [
    {
      "system" : "http://hl7.org/fhir/sid/us-npi",
      "value" : "1987654321"
    }
  ],
  "name" : [
    {
      "family" : "Rivera",
      "given" : ["Jordan"]
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
                "code" : "active"
              }
            ]
          }
        },
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/qualification-jurisdiction",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://hl7.org/fhir/us/core/CodeSystem/us-core-usps-state",
                "code" : "FL",
                "display" : "Florida"
              }
            ]
          }
        }
      ],
      "identifier" : [
        {
          "system" : "https://flboard.gov/license",
          "value" : "ME12345"
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
        "start" : "2023-01-01",
        "end" : "2026-12-31"
      },
      "issuer" : {
        "reference" : "Organization/org-florida-medical-board"
      }
    }
  ]
}

```
