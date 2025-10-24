# Fellowship Verification — Cardiovascular Disease - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fellowship Verification — Cardiovascular Disease**

## Example DocumentReference: Fellowship Verification — Cardiovascular Disease

**status**: Current

**type**: Fellowship program verification

> **content**

### Attachments

| | | |
| :--- | :--- | :--- |
| - | **ContentType** | **Url** |
| * | application/json | [https://fellowships.heartinst.example.org/verify?program=141-98-76-543&npi=1654321987](https://fellowships.heartinst.example.org/verify?program=141-98-76-543&npi=1654321987) |




## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "docref-training-fellowship-card",
  "status" : "current",
  "type" : {
    "text" : "Fellowship program verification"
  },
  "content" : [
    {
      "attachment" : {
        "contentType" : "application/json",
        "url" : "https://fellowships.heartinst.example.org/verify?program=141-98-76-543&npi=1654321987"
      }
    }
  ]
}

```
