# Residency Verification — Internal Medicine - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Residency Verification — Internal Medicine**

## Example DocumentReference: Residency Verification — Internal Medicine

**status**: Current

**type**: Residency program verification

> **content**

### Attachments

| | | |
| :--- | :--- | :--- |
| - | **ContentType** | **Url** |
| * | application/pdf | [https://gme.citymed.example.org/verify?program=140-12-34-567&npi=1654321987](https://gme.citymed.example.org/verify?program=140-12-34-567&npi=1654321987) |




## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "docref-training-residency-im",
  "status" : "current",
  "type" : {
    "text" : "Residency program verification"
  },
  "content" : [
    {
      "attachment" : {
        "contentType" : "application/pdf",
        "url" : "https://gme.citymed.example.org/verify?program=140-12-34-567&npi=1654321987"
      }
    }
  ]
}

```
