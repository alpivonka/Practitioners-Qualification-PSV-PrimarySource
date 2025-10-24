# PSVPractitioner — DEA registration(s) with VR, Provenance, Evidence - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSVPractitioner — DEA registration(s) with VR, Provenance, Evidence**

## Example Practitioner: PSVPractitioner — DEA registration(s) with VR, Provenance, Evidence

Profiles: [PSV Practitioner with Qualification Slices (Common Pattern + Rules)](StructureDefinition-PSVPractitioner.md), `http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner`

**identifier**: [United States National Provider Identifier](http://terminology.hl7.org/6.5.0/NamingSystem-npi.html)/1234987654

**name**: Riya Patel 

> **qualification****org/fhir/uv/psv/StructureDefinition/qualification-status**:active**org/fhir/uv/psv/StructureDefinition/dea-schedules**:II**org/fhir/uv/psv/StructureDefinition/dea-schedules**:III**org/fhir/uv/psv/StructureDefinition/dea-registrant-type**:practitioner**identifier**:`https://www.dea.gov/registration`/AB1234567**code**:dea**period**: 2024-05-01 --> 2027-04-30**issuer**:[Organization DEA Diversion Control Division](Organization-org-dea-diversion.md)

> **qualification****org/fhir/uv/psv/StructureDefinition/dea-schedules**:III**org/fhir/uv/psv/StructureDefinition/dea-schedules**:IV**org/fhir/uv/psv/StructureDefinition/dea-schedules**:V**identifier**:`https://www.dea.gov/registration`/BA7654321**code**:dea**period**: 2024-07-15 --> 2027-07-14**issuer**:[Organization DEA Diversion Control Division](Organization-org-dea-diversion.md)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "prac-dea-with-vr",
  "meta" : {
    "profile" : [
      "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner",
      "http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner"
    ]
  },
  "identifier" : [
    {
      "system" : "http://hl7.org/fhir/sid/us-npi",
      "value" : "1234987654"
    }
  ],
  "name" : [
    {
      "family" : "Patel",
      "given" : ["Riya"]
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
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/dea-schedules",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-dea-schedule-cs",
                "code" : "II"
              }
            ]
          }
        },
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/dea-schedules",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-dea-schedule-cs",
                "code" : "III"
              }
            ]
          }
        },
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/dea-registrant-type",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-dea-registrant-type-cs",
                "code" : "practitioner"
              }
            ]
          }
        }
      ],
      "identifier" : [
        {
          "system" : "https://www.dea.gov/registration",
          "value" : "AB1234567"
        }
      ],
      "code" : {
        "coding" : [
          {
            "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs",
            "code" : "dea"
          }
        ]
      },
      "period" : {
        "start" : "2024-05-01",
        "end" : "2027-04-30"
      },
      "issuer" : {
        "reference" : "Organization/org-dea-diversion"
      }
    },
    {
      "extension" : [
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/dea-schedules",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-dea-schedule-cs",
                "code" : "III"
              }
            ]
          }
        },
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/dea-schedules",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-dea-schedule-cs",
                "code" : "IV"
              }
            ]
          }
        },
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/dea-schedules",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-dea-schedule-cs",
                "code" : "V"
              }
            ]
          }
        }
      ],
      "identifier" : [
        {
          "system" : "https://www.dea.gov/registration",
          "value" : "BA7654321"
        }
      ],
      "code" : {
        "coding" : [
          {
            "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs",
            "code" : "dea"
          }
        ]
      },
      "period" : {
        "start" : "2024-07-15",
        "end" : "2027-07-14"
      },
      "issuer" : {
        "reference" : "Organization/org-dea-diversion"
      }
    }
  ]
}

```
