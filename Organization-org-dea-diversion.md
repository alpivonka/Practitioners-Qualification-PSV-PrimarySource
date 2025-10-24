# DEA Diversion Control Division - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DEA Diversion Control Division**

## Example Organization: DEA Diversion Control Division

**name**: DEA Diversion Control Division

**endpoint**: [Endpoint: status = active; connectionType = HL7 FHIR (Endpoint Connection Type#hl7-fhir-rest); payloadType = Any; payloadMimeType = application/fhir+json; address = https://dea.example.gov/diversion/fhir](Endpoint-endpoint-dea-diversion.md)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "org-dea-diversion",
  "name" : "DEA Diversion Control Division",
  "endpoint" : [
    {
      "reference" : "Endpoint/endpoint-dea-diversion"
    }
  ]
}

```
