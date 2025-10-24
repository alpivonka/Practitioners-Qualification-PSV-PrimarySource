# org-abim - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **org-abim**

## Example Organization: org-abim

**name**: American Board of Internal Medicine (ABIM)

**endpoint**: [Endpoint: status = active; connectionType = HL7 FHIR (Endpoint Connection Type#hl7-fhir-rest); payloadType = Any; payloadMimeType = application/fhir+json; address = https://verify.abim.org/fhir](Endpoint-endpoint-abim-verify.md)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "org-abim",
  "name" : "American Board of Internal Medicine (ABIM)",
  "endpoint" : [
    {
      "reference" : "Endpoint/endpoint-abim-verify"
    }
  ]
}

```
