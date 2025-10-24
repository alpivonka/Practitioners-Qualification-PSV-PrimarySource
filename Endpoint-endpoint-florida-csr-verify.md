# Florida CSR — Verification API - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Florida CSR — Verification API**

## Example Endpoint: Florida CSR — Verification API

**status**: Active

**connectionType**: [Endpoint Connection Type hl7-fhir-rest](http://terminology.hl7.org/6.5.0/CodeSystem-endpoint-connection-type.html#endpoint-connection-type-hl7-fhir-rest): HL7 FHIR

**payloadType**: FHIR Practitioner & VerificationResult

**payloadMimeType**: application/fhir+json

**address**: [https://api.flhealth.example.gov/csr/fhir](https://api.flhealth.example.gov/csr/fhir)



## Resource Content

```json
{
  "resourceType" : "Endpoint",
  "id" : "endpoint-florida-csr-verify",
  "status" : "active",
  "connectionType" : {
    "system" : "http://terminology.hl7.org/CodeSystem/endpoint-connection-type",
    "code" : "hl7-fhir-rest"
  },
  "payloadType" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/endpoint-payload-type",
          "code" : "any"
        }
      ],
      "text" : "FHIR Practitioner & VerificationResult"
    }
  ],
  "payloadMimeType" : ["application/fhir+json"],
  "address" : "https://api.flhealth.example.gov/csr/fhir"
}

```
