# VR — Fellowship (Cardiology) Primary Source - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VR — Fellowship (Cardiology) Primary Source**

## Example VerificationResult: VR — Fellowship (Cardiology) Primary Source

**target**: [Practitioner Taylor Garcia](Practitioner-prac-training-with-vr.md)

**targetLocation**: qualification[training][1]

**status**: Validated

**statusDate**: 2025-10-21 12:30:00+0000

**validationType**: training-primary-source

### PrimarySources

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Who** | **CommunicationMethod** | **ValidationStatus** | **ValidationDate** |
| * | [Organization National Heart Institute](Organization-org-heart-institute.md) | Fellowship API | successful | 2025-10-21 |



## Resource Content

```json
{
  "resourceType" : "VerificationResult",
  "id" : "vr-training-fellowship-card",
  "target" : [
    {
      "reference" : "Practitioner/prac-training-with-vr"
    }
  ],
  "targetLocation" : ["qualification[training][1]"],
  "status" : "validated",
  "statusDate" : "2025-10-21T12:30:00Z",
  "validationType" : {
    "coding" : [
      {
        "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-verification-type-cs",
        "code" : "training-primary-source"
      }
    ]
  },
  "primarySource" : [
    {
      "who" : {
        "reference" : "Organization/org-heart-institute"
      },
      "communicationMethod" : [
        {
          "text" : "Fellowship API"
        }
      ],
      "validationStatus" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/verificationresult-status",
            "code" : "successful"
          }
        ]
      },
      "validationDate" : "2025-10-21"
    }
  ]
}

```
