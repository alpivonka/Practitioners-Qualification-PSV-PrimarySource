# VR — Alex Smith License (2025 Q1) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VR — Alex Smith License (2025 Q1)**

## Example VerificationResult: VR — Alex Smith License (2025 Q1)

**target**: [Practitioner Jordan Rivera](Practitioner-prac-jordan-rivera-license-only.md)

**targetLocation**: qualification[license][0]

**status**: Validated

**statusDate**: 2025-10-21 14:05:00+0000

**validationType**: license-primary-source

### PrimarySources

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Who** | **CommunicationMethod** | **ValidationStatus** | **ValidationDate** |
| * | [Organization Florida Board of Medicine](Organization-org-florida-medical-board.md) | API lookup | successful | 2025-10-21 14:05:00+0000 |



## Resource Content

```json
{
  "resourceType" : "VerificationResult",
  "id" : "vr-alex-smith-license-2025Q1",
  "target" : [
    {
      "reference" : "Practitioner/prac-jordan-rivera-license-only"
    }
  ],
  "targetLocation" : ["qualification[license][0]"],
  "status" : "validated",
  "statusDate" : "2025-10-21T14:05:00Z",
  "validationType" : {
    "coding" : [
      {
        "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-verification-type-cs",
        "code" : "license-primary-source"
      }
    ]
  },
  "primarySource" : [
    {
      "who" : {
        "reference" : "Organization/org-florida-medical-board"
      },
      "communicationMethod" : [
        {
          "text" : "API lookup"
        }
      ],
      "validationStatus" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/verificationresult-status",
            "code" : "successful"
          }
        ],
        "text" : "successful"
      },
      "validationDate" : "2025-10-21T14:05:00Z"
    }
  ]
}

```
