# DEA Registration Lookup (BA7654321) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DEA Registration Lookup (BA7654321)**

## Example DocumentReference: DEA Registration Lookup (BA7654321)

**status**: Current

**type**: DEA registration verification result

> **content**

### Attachments

| | | |
| :--- | :--- | :--- |
| - | **ContentType** | **Url** |
| * | application/json | [https://dea.example.gov/diversion/api/verify?id=BA7654321](https://dea.example.gov/diversion/api/verify?id=BA7654321) |




## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "docref-dea-BA7654321",
  "status" : "current",
  "type" : {
    "text" : "DEA registration verification result"
  },
  "content" : [
    {
      "attachment" : {
        "contentType" : "application/json",
        "url" : "https://dea.example.gov/diversion/api/verify?id=BA7654321"
      }
    }
  ]
}

```
