# Board Verification Response (JSON) - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Board Verification Response (JSON)**

## Example DocumentReference: Board Verification Response (JSON)

**status**: Current

**type**: Board verification lookup result

> **content**

### Attachments

| | | |
| :--- | :--- | :--- |
| - | **ContentType** | **Url** |
| * | application/json | [https://api.stateboard.example.gov/verify?license=MD-987654321&npi=1234567893](https://api.stateboard.example.gov/verify?license=MD-987654321&npi=1234567893) |




## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "docref-board-response",
  "status" : "current",
  "type" : {
    "text" : "Board verification lookup result"
  },
  "content" : [
    {
      "attachment" : {
        "contentType" : "application/json",
        "url" : "https://api.stateboard.example.gov/verify?license=MD-987654321&npi=1234567893"
      }
    }
  ]
}

```
