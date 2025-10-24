# Provenance — Apply Board Suspension - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Provenance — Apply Board Suspension**

## Example Provenance: Provenance — Apply Board Suspension

Provenance for: 

* [Practitioner Morgan Chavez](Practitioner-prac-sanction-demo.md)
* [Flag](Flag-flag-license-sanction.md)

Summary

| | |
| :--- | :--- |
| Recorded | 2025-09-15 10:02:00+0000 |
| Activity | Update credential status; create Flag |

**Agents**

* **Type**: author
  * **who**: PS-Verify Processor



## Resource Content

```json
{
  "resourceType" : "Provenance",
  "id" : "prov-sanction-apply",
  "target" : [
    {
      "reference" : "Practitioner/prac-sanction-demo"
    },
    {
      "reference" : "Flag/flag-license-sanction"
    }
  ],
  "recorded" : "2025-09-15T10:02:00Z",
  "reason" : [
    {
      "text" : "Apply board suspension to Practitioner license and raise Flag"
    }
  ],
  "activity" : {
    "text" : "Update credential status; create Flag"
  },
  "agent" : [
    {
      "type" : {
        "text" : "author"
      },
      "who" : {
        "display" : "PS-Verify Processor"
      }
    }
  ],
  "entity" : [
    {
      "role" : "source",
      "what" : {
        "reference" : "VerificationResult/vr-license-suspension"
      }
    }
  ]
}

```
