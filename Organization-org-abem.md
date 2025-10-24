# org-abem - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **org-abem**

## Example Organization: org-abem

**name**: American Board of Emergency Medicine (ABEM)

**endpoint**: [Endpoint: status = active; connectionType = HL7 FHIR (Endpoint Connection Type#hl7-fhir-rest); payloadType = Any; payloadMimeType = application/fhir+json; address = https://api.abem.org/verify/fhir](Endpoint-endpoint-abem-verify.md)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "org-abem",
  "name" : "American Board of Emergency Medicine (ABEM)",
  "endpoint" : [
    {
      "reference" : "Endpoint/endpoint-abem-verify"
    }
  ]
}

```
