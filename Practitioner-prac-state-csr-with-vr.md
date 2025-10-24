# PSVPractitioner — State CSR with VR, Provenance, Evidence - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PSVPractitioner — State CSR with VR, Provenance, Evidence**

## Example Practitioner: PSVPractitioner — State CSR with VR, Provenance, Evidence

Profiles: [PSV Practitioner with Qualification Slices (Common Pattern + Rules)](StructureDefinition-PSVPractitioner.md), `http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner`

**identifier**: [United States National Provider Identifier](http://terminology.hl7.org/6.5.0/NamingSystem-npi.html)/1098765432

**name**: Mariana Lopez 

> **qualification****org/fhir/uv/psv/StructureDefinition/qualification-jurisdiction**:Florida**org/fhir/uv/psv/StructureDefinition/qualification-status**:active**identifier**:`https://flhealth.example.gov/csr`/CSR-7744**code**:state-csr**period**: 2023-01-01 --> 2026-12-31**issuer**:[Organization Florida Department of Health — Controlled Substance Registration](Organization-org-florida-csr-authority.md)

> **qualification****org/fhir/uv/psv/StructureDefinition/qualification-jurisdiction**:Georgia**identifier**:`https://dch.ga.gov/csr`/CSR-GA-2219**code**:state-csr**period**: 2024-03-01 --> 2027-02-28**issuer**:[Organization Florida Department of Health — Controlled Substance Registration](Organization-org-florida-csr-authority.md)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "prac-state-csr-with-vr",
  "meta" : {
    "profile" : [
      "http://example.com/fhir/psv/StructureDefinition/PSVPractitioner",
      "http://example.org/fhir/uv/psv/StructureDefinition/PSVPractitioner"
    ]
  },
  "identifier" : [
    {
      "system" : "http://hl7.org/fhir/sid/us-npi",
      "value" : "1098765432"
    }
  ],
  "name" : [
    {
      "family" : "Lopez",
      "given" : ["Mariana"]
    }
  ],
  "qualification" : [
    {
      "extension" : [
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
          "system" : "https://flhealth.example.gov/csr",
          "value" : "CSR-7744"
        }
      ],
      "code" : {
        "coding" : [
          {
            "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs",
            "code" : "state-csr"
          }
        ]
      },
      "period" : {
        "start" : "2023-01-01",
        "end" : "2026-12-31"
      },
      "issuer" : {
        "reference" : "Organization/org-florida-csr-authority"
      }
    },
    {
      "extension" : [
        {
          "url" : "http://example.org/fhir/uv/psv/StructureDefinition/qualification-jurisdiction",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://hl7.org/fhir/us/core/CodeSystem/us-core-usps-state",
                "code" : "GA",
                "display" : "Georgia"
              }
            ]
          }
        }
      ],
      "identifier" : [
        {
          "system" : "https://dch.ga.gov/csr",
          "value" : "CSR-GA-2219"
        }
      ],
      "code" : {
        "coding" : [
          {
            "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-qualification-type-cs",
            "code" : "state-csr"
          }
        ]
      },
      "period" : {
        "start" : "2024-03-01",
        "end" : "2027-02-28"
      },
      "issuer" : {
        "reference" : "Organization/org-florida-csr-authority"
      }
    }
  ]
}

```
