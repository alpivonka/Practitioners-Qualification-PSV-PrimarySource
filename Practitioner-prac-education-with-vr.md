# PSVPractitioner — Education (degree) with VR, Provenance, Evidence - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSVPractitioner — Education (degree) with VR, Provenance, Evidence**

## Example Practitioner: PSVPractitioner — Education (degree) with VR, Provenance, Evidence

Profiles: [PSV Practitioner with Qualification Slices (Common Pattern + Rules)](StructureDefinition-PSVPractitioner.md), `http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner`

**identifier**: [United States National Provider Identifier](http://terminology.hl7.org/6.5.0/NamingSystem-npi.html)/1478523690

**name**: Morgan Chen 

> **qualification****org/fhir/uv/psv/StructureDefinition/qualification-degree**:MD**org/fhir/uv/psv/StructureDefinition/qualification-status**:active**code**:education**period**: 2016-05-15 --> (ongoing)**issuer**:[Organization State University College of Medicine](Organization-org-state-university-med.md)

> **qualification****org/fhir/uv/psv/StructureDefinition/qualification-degree**:BS**code**:education**period**: 2012-05-15 --> (ongoing)**issuer**:[Organization State University College of Medicine](Organization-org-state-university-med.md)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "prac-education-with-vr",
  "meta" : {
    "profile" : [
      "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner",
      "http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner"
    ]
  },
  "identifier" : [
    {
      "system" : "http://hl7.org/fhir/sid/us-npi",
      "value" : "1478523690"
    }
  ],
  "name" : [
    {
      "family" : "Chen",
      "given" : ["Morgan"]
    }
  ],
  "qualification" : [
    {
      "extension" : [
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/qualification-degree",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-degree-cs",
                "code" : "MD"
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
            "code" : "education"
          }
        ]
      },
      "period" : {
        "start" : "2016-05-15"
      },
      "issuer" : {
        "reference" : "Organization/org-state-university-med"
      }
    },
    {
      "extension" : [
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/qualification-degree",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-degree-cs",
                "code" : "BS"
              }
            ]
          }
        }
      ],
      "code" : {
        "coding" : [
          {
            "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs",
            "code" : "education"
          }
        ]
      },
      "period" : {
        "start" : "2012-05-15"
      },
      "issuer" : {
        "reference" : "Organization/org-state-university-med"
      }
    }
  ]
}

```
