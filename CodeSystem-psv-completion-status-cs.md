# Training Completion Status - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Training Completion Status**

## CodeSystem: Training Completion Status 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/uv/psv/CodeSystem/psv-completion-status-cs | *Version*:1.0.0 |
| Active as of 2025-10-24 | *Computable Name*:PSVCompletionStatusCS |

 
Completion state for a training program. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [PSVCompletionStatusVS](ValueSet-psvVS-completion-status.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "psv-completion-status-cs",
  "url" : "http://example.org/fhir/uv/psv/CodeSystem/psv-completion-status-cs",
  "version" : "1.0.0",
  "name" : "PSVCompletionStatusCS",
  "title" : "Training Completion Status",
  "status" : "active",
  "date" : "2025-10-24T14:50:11+00:00",
  "description" : "Completion state for a training program.",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
          "code" : "001",
          "display" : "World"
        }
      ]
    }
  ],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 5,
  "concept" : [
    {
      "code" : "completed",
      "display" : "Completed"
    },
    {
      "code" : "in-progress",
      "display" : "In Progress"
    },
    {
      "code" : "not-completed",
      "display" : "Not Completed"
    },
    {
      "code" : "withdrawn",
      "display" : "Withdrawn"
    },
    {
      "code" : "terminated",
      "display" : "Terminated"
    }
  ]
}

```
