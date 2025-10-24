# VR — Residency (IM) Primary Source - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VR — Residency (IM) Primary Source**

## Example VerificationResult: VR — Residency (IM) Primary Source

**target**: [Practitioner Taylor Garcia](Practitioner-prac-training-with-vr.md)

**targetLocation**: qualification[training][0]

**status**: Validated

**statusDate**: 2025-10-21 12:25:00+0000

**validationType**: training-primary-source

### PrimarySources

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Who** | **CommunicationMethod** | **ValidationStatus** | **ValidationDate** |
| * | [Organization City Medical Center — Graduate Medical Education](Organization-org-citymed-gme.md) | GME API | successful | 2025-10-21 |



## Resource Content

```json
{
  "resourceType" : "VerificationResult",
  "id" : "vr-training-residency-im",
  "target" : [
    {
      "reference" : "Practitioner/prac-training-with-vr"
    }
  ],
  "targetLocation" : ["qualification[training][0]"],
  "status" : "validated",
  "statusDate" : "2025-10-21T12:25:00Z",
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
        "reference" : "Organization/org-citymed-gme"
      },
      "communicationMethod" : [
        {
          "text" : "GME API"
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
