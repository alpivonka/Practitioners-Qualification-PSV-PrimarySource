# VR — License Suspension from State Board - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VR — License Suspension from State Board**

## Example VerificationResult: VR — License Suspension from State Board



## Resource Content

```json
{
  "resourceType" : "VerificationResult",
  "id" : "vr-license-suspension",
  "contained" : [
    {
      "resourceType" : "DocumentReference",
      "id" : "local-doc",
      "status" : "current",
      "type" : {
        "text" : "Board Order"
      },
      "date" : "2025-09-15T10:00:00Z",
      "content" : [
        {
          "attachment" : {
            "contentType" : "application/pdf",
            "url" : "https://flboard.example/orders/2025-0915.pdf",
            "title" : "Final Order 2025-09-15"
          }
        }
      ]
    }
  ],
  "extension" : [
    {
      "url" : "http://example.org/fhir/uv/psv/StructureDefinition/verification-evidence",
      "valueReference" : {
        "reference" : "DocumentReference/doc-suspension-order"
      }
    }
  ],
  "target" : [
    {
      "reference" : "Practitioner/prac-sanction-demo"
    }
  ],
  "targetLocation" : ["qualification[license][0]"],
  "status" : "completed",
  "statusDate" : "2025-09-15T10:01:00Z",
  "failureAction" : {
    "text" : "Suspend practice; remove from schedules"
  },
  "primarySource" : [
    {
      "who" : {
        "reference" : "Organization/org-florida-medical-board"
      },
      "communicationMethod" : [
        {
          "text" : "Portal"
        }
      ],
      "validationStatus" : {
        "coding" : [
          {
            "code" : "successful"
          }
        ]
      },
      "validationDate" : "2025-09-15T10:01:00Z"
    }
  ],
  "attestation" : {
    "who" : {
      "display" : "PS-Verify Service"
    },
    "date" : "2025-09-15"
  }
}

```
