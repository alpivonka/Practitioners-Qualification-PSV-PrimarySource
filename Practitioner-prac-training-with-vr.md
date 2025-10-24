# PSVPractitioner — Training (residency & fellowship) with VR, Provenance, Evidence - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSVPractitioner — Training (residency & fellowship) with VR, Provenance, Evidence**

## Example Practitioner: PSVPractitioner — Training (residency & fellowship) with VR, Provenance, Evidence

Profiles: [PSV Practitioner with Qualification Slices (Common Pattern + Rules)](StructureDefinition-PSVPractitioner.md), `http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner`

**identifier**: [United States National Provider Identifier](http://terminology.hl7.org/6.5.0/NamingSystem-npi.html)/1654321987

**name**: Taylor Garcia 

> **qualification****org/fhir/uv/psv/StructureDefinition/training-type**:Residency**org/fhir/uv/psv/StructureDefinition/acgme-program-id**:`https://apps.acgme.org/ads/Public/Programs/Search`/140-12-34-567**org/fhir/uv/psv/StructureDefinition/completion-status**:Completed**org/fhir/uv/psv/StructureDefinition/qualification-specialty**:Internal Medicine**org/fhir/uv/psv/StructureDefinition/qualification-status**:active**code**:training**period**: 2017-07-01 --> 2020-06-30**issuer**:[Organization City Medical Center — Graduate Medical Education](Organization-org-citymed-gme.md)

> **qualification****org/fhir/uv/psv/StructureDefinition/training-type**:Fellowship**org/fhir/uv/psv/StructureDefinition/acgme-program-id**:`https://apps.acgme.org/ads/Public/Programs/Search`/141-98-76-543**org/fhir/uv/psv/StructureDefinition/completion-status**:Completed**org/fhir/uv/psv/StructureDefinition/qualification-specialty**:Cardiovascular Disease**code**:training**period**: 2020-07-01 --> 2023-06-30**issuer**:[Organization National Heart Institute](Organization-org-heart-institute.md)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "prac-training-with-vr",
  "meta" : {
    "profile" : [
      "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner",
      "http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner"
    ]
  },
  "identifier" : [
    {
      "system" : "http://hl7.org/fhir/sid/us-npi",
      "value" : "1654321987"
    }
  ],
  "name" : [
    {
      "family" : "Garcia",
      "given" : ["Taylor"]
    }
  ],
  "qualification" : [
    {
      "extension" : [
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/training-type",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-training-type-cs",
                "code" : "residency"
              }
            ]
          }
        },
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/acgme-program-id",
          "valueIdentifier" : {
            "system" : "https://apps.acgme.org/ads/Public/Programs/Search",
            "value" : "140-12-34-567"
          }
        },
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/completion-status",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-completion-status-cs",
                "code" : "completed"
              }
            ]
          }
        },
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
      "code" : {
        "coding" : [
          {
            "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs",
            "code" : "training"
          }
        ]
      },
      "period" : {
        "start" : "2017-07-01",
        "end" : "2020-06-30"
      },
      "issuer" : {
        "reference" : "Organization/org-citymed-gme"
      }
    },
    {
      "extension" : [
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/training-type",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-training-type-cs",
                "code" : "fellowship"
              }
            ]
          }
        },
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/acgme-program-id",
          "valueIdentifier" : {
            "system" : "https://apps.acgme.org/ads/Public/Programs/Search",
            "value" : "141-98-76-543"
          }
        },
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/completion-status",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-completion-status-cs",
                "code" : "completed"
              }
            ]
          }
        },
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/qualification-specialty",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-board-specialty-cs",
                "code" : "CARD"
              }
            ]
          }
        }
      ],
      "code" : {
        "coding" : [
          {
            "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs",
            "code" : "training"
          }
        ]
      },
      "period" : {
        "start" : "2020-07-01",
        "end" : "2023-06-30"
      },
      "issuer" : {
        "reference" : "Organization/org-heart-institute"
      }
    }
  ]
}

```
