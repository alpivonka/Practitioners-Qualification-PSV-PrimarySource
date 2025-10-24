# VR — FL CSR (Primary Source) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VR — FL CSR (Primary Source)**

## Example VerificationResult: VR — FL CSR (Primary Source)

**target**: [Practitioner Mariana Lopez](Practitioner-prac-state-csr-with-vr.md)

**targetLocation**: qualification[state-csr][0]

**status**: Validated

**statusDate**: 2025-10-21 14:05:00+0000

**validationType**: state-csr-primary-source

### PrimarySources

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Who** | **CommunicationMethod** | **ValidationStatus** | **ValidationDate** |
| * | [Organization Florida Department of Health — Controlled Substance Registration](Organization-org-florida-csr-authority.md) | API lookup | successful | 2025-10-21 |



## Resource Content

```json
{
  "resourceType" : "VerificationResult",
  "id" : "vr-csr-fl-7744",
  "target" : [
    {
      "reference" : "Practitioner/prac-state-csr-with-vr"
    }
  ],
  "targetLocation" : ["qualification[state-csr][0]"],
  "status" : "validated",
  "statusDate" : "2025-10-21T14:05:00Z",
  "validationType" : {
    "coding" : [
      {
        "system" : "http://example.org/fhir/uv/psv/CodeSystem/psv-verification-type-cs",
        "code" : "state-csr-primary-source"
      }
    ]
  },
  "primarySource" : [
    {
      "who" : {
        "reference" : "Organization/org-florida-csr-authority"
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
