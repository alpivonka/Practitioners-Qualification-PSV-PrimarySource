# Florida Department of Health — CSR - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Florida Department of Health — CSR**

## Example Organization: Florida Department of Health — CSR

**name**: Florida Department of Health — Controlled Substance Registration

**endpoint**: [Endpoint: status = active; connectionType = HL7 FHIR (Endpoint Connection Type#hl7-fhir-rest); payloadType = Any; payloadMimeType = application/fhir+json; address = https://api.flhealth.example.gov/csr/fhir](Endpoint-endpoint-florida-csr-verify.md)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "org-florida-csr-authority",
  "name" : "Florida Department of Health — Controlled Substance Registration",
  "endpoint" : [
    {
      "reference" : "Endpoint/endpoint-florida-csr-verify"
    }
  ]
}

```
