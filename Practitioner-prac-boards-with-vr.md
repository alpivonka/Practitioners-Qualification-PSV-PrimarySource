# PSVPractitioner — Board certification(s) with VR, Provenance, Evidence - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSVPractitioner — Board certification(s) with VR, Provenance, Evidence**

## Example Practitioner: PSVPractitioner — Board certification(s) with VR, Provenance, Evidence

Profiles: [PSV Practitioner with Qualification Slices (Common Pattern + Rules)](StructureDefinition-PSVPractitioner.md), `http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner`

**identifier**: [United States National Provider Identifier](http://terminology.hl7.org/6.5.0/NamingSystem-npi.html)/1234567893

**name**: Alex Nguyen 

> **qualification****org/fhir/uv/psv/StructureDefinition/qualification-specialty**:Internal Medicine**org/fhir/uv/psv/StructureDefinition/qualification-subspecialty**:CARD**identifier**: ABIM-000111222**code**:board**period**: 2020-07-01 --> 2030-06-30**issuer**:[Organization American Board of Internal Medicine (ABIM)](Organization-org-abim.md)

> **qualification****org/fhir/uv/psv/StructureDefinition/qualification-specialty**:Emergency Medicine**org/fhir/uv/psv/StructureDefinition/qualification-status**:active**identifier**: ABEM-445566**code**:board**period**: 2019-09-01 --> 2029-08-31**issuer**:[Organization American Board of Emergency Medicine (ABEM)](Organization-org-abem.md)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "prac-boards-with-vr",
  "meta" : {
    "profile" : [
      "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner",
      "http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner"
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
      "family" : "Nguyen",
      "given" : ["Alex"]
    }
  ],
  "qualification" : [
    {
      "extension" : [
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/qualification-specialty",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-board-specialty-cs",
                "code" : "IM"
              }
            ]
          }
        },
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/qualification-subspecialty",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-board-subspecialty-cs",
                "code" : "CARD"
              }
            ]
          }
        }
      ],
      "identifier" : [
        {
          "value" : "ABIM-000111222"
        }
      ],
      "code" : {
        "coding" : [
          {
            "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs",
            "code" : "board"
          }
        ]
      },
      "period" : {
        "start" : "2020-07-01",
        "end" : "2030-06-30"
      },
      "issuer" : {
        "reference" : "Organization/org-abim"
      }
    },
    {
      "extension" : [
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/qualification-specialty",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-board-specialty-cs",
                "code" : "EM"
              }
            ]
          }
        },
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
        }
      ],
      "identifier" : [
        {
          "value" : "ABEM-445566"
        }
      ],
      "code" : {
        "coding" : [
          {
            "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs",
            "code" : "board"
          }
        ]
      },
      "period" : {
        "start" : "2019-09-01",
        "end" : "2029-08-31"
      },
      "issuer" : {
        "reference" : "Organization/org-abem"
      }
    }
  ]
}

```
