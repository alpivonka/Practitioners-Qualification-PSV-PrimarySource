# vr-prac-boards-abim - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **vr-prac-boards-abim**

## Example VerificationResult: vr-prac-boards-abim

**target**: [Practitioner Alex Nguyen](Practitioner-prac-boards-with-vr.md)

**targetLocation**: qualification[board][0]

**status**: Validated

**statusDate**: 2025-10-21 14:05:00+0000

**validationType**: board-primary-source

### PrimarySources

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Who** | **CommunicationMethod** | **ValidationStatus** | **ValidationDate** |
| * | [Organization American Board of Internal Medicine (ABIM)](Organization-org-abim.md) | Online portal lookup | successful | 2025-10-21 |



## Resource Content

```json
{
  "resourceType" : "VerificationResult",
  "id" : "vr-prac-boards-abim",
  "target" : [
    {
      "reference" : "Practitioner/prac-boards-with-vr"
    }
  ],
  "targetLocation" : ["qualification[board][0]"],
  "status" : "validated",
  "statusDate" : "2025-10-21T14:05:00Z",
  "validationType" : {
    "coding" : [
      {
        "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-verification-type-cs",
        "code" : "board-primary-source"
      }
    ]
  },
  "primarySource" : [
    {
      "who" : {
        "reference" : "Organization/org-abim"
      },
      "communicationMethod" : [
        {
          "text" : "Online portal lookup"
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
