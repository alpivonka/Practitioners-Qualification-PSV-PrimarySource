# DEA Registration Lookup (AB1234567) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DEA Registration Lookup (AB1234567)**

## Example DocumentReference: DEA Registration Lookup (AB1234567)

**status**: Current

**type**: DEA registration verification result

> **content**

### Attachments

| | | |
| :--- | :--- | :--- |
| - | **ContentType** | **Url** |
| * | application/json | [https://dea.example.gov/diversion/api/verify?id=AB1234567](https://dea.example.gov/diversion/api/verify?id=AB1234567) |




## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "docref-dea-AB1234567",
  "status" : "current",
  "type" : {
    "text" : "DEA registration verification result"
  },
  "content" : [
    {
      "attachment" : {
        "contentType" : "application/json",
        "url" : "https://dea.example.gov/diversion/api/verify?id=AB1234567"
      }
    }
  ]
}

```
