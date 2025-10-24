# vr-prac-boards-abem - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **vr-prac-boards-abem**

## Example VerificationResult: vr-prac-boards-abem

**target**: [Practitioner Alex Nguyen](Practitioner-prac-boards-with-vr.md)

**targetLocation**: qualification[board][1]

**status**: Validated

**statusDate**: 2025-10-21 14:10:00+0000

**validationType**: board-primary-source

### PrimarySources

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Who** | **CommunicationMethod** | **ValidationStatus** | **ValidationDate** |
| * | [Organization American Board of Emergency Medicine (ABEM)](Organization-org-abem.md) | Online portal lookup | successful | 2025-10-21 |



## Resource Content

```json
{
  "resourceType" : "VerificationResult",
  "id" : "vr-prac-boards-abem",
  "target" : [
    {
      "reference" : "Practitioner/prac-boards-with-vr"
    }
  ],
  "targetLocation" : ["qualification[board][1]"],
  "status" : "validated",
  "statusDate" : "2025-10-21T14:10:00Z",
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
        "reference" : "Organization/org-abem"
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
