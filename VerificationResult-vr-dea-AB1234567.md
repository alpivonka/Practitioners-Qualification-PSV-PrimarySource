# VR — DEA AB1234567 (Primary Source) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VR — DEA AB1234567 (Primary Source)**

## Example VerificationResult: VR — DEA AB1234567 (Primary Source)

**target**: [Practitioner Riya Patel](Practitioner-prac-dea-with-vr.md)

**targetLocation**: qualification[dea][0]

**status**: Validated

**statusDate**: 2025-10-21 14:05:00+0000

**validationType**: dea-primary-source

### PrimarySources

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Who** | **CommunicationMethod** | **ValidationStatus** | **ValidationDate** |
| * | [Organization DEA Diversion Control Division](Organization-org-dea-diversion.md) | API lookup | successful | 2025-10-21 |



## Resource Content

```json
{
  "resourceType" : "VerificationResult",
  "id" : "vr-dea-AB1234567",
  "target" : [
    {
      "reference" : "Practitioner/prac-dea-with-vr"
    }
  ],
  "targetLocation" : ["qualification[dea][0]"],
  "status" : "validated",
  "statusDate" : "2025-10-21T14:05:00Z",
  "validationType" : {
    "coding" : [
      {
        "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-verification-type-cs",
        "code" : "dea-primary-source"
      }
    ]
  },
  "primarySource" : [
    {
      "who" : {
        "reference" : "Organization/org-dea-diversion"
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
        ]
      },
      "validationDate" : "2025-10-21"
    }
  ]
}

```
