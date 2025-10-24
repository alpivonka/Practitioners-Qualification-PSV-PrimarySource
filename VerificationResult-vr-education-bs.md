# VR — BS Degree (Primary Source) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VR — BS Degree (Primary Source)**

## Example VerificationResult: VR — BS Degree (Primary Source)

**target**: [Practitioner Morgan Chen](Practitioner-prac-education-with-vr.md)

**targetLocation**: qualification[education][1]

**status**: Validated

**statusDate**: 2025-10-21 13:57:00+0000

**validationType**: education-primary-source

### PrimarySources

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Who** | **CommunicationMethod** | **ValidationStatus** | **ValidationDate** |
| * | [Organization State University College of Medicine](Organization-org-state-university-med.md) | Registrar API | successful | 2025-10-21 |



## Resource Content

```json
{
  "resourceType" : "VerificationResult",
  "id" : "vr-education-bs",
  "target" : [
    {
      "reference" : "Practitioner/prac-education-with-vr"
    }
  ],
  "targetLocation" : ["qualification[education][1]"],
  "status" : "validated",
  "statusDate" : "2025-10-21T13:57:00Z",
  "validationType" : {
    "coding" : [
      {
        "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-verification-type-cs",
        "code" : "education-primary-source"
      }
    ]
  },
  "primarySource" : [
    {
      "who" : {
        "reference" : "Organization/org-state-university-med"
      },
      "communicationMethod" : [
        {
          "text" : "Registrar API"
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
