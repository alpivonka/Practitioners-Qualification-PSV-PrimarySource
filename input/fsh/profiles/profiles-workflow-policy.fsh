// ==== Workflow & Policy Layer ====
Profile: PSVVerificationTask
Parent: Task
Id: psv-verification-task
Title: "PSV Verification Task"
Description: "Requests execution of a verification (e.g., LEIE monthly, license quarterly)."
* code 1..1 MS
* status 1..1 MS
* focus MS
* for MS
* executionPeriod MS

Profile: PSVPlanDefinition
Parent: PlanDefinition
Id: psv-plan-definition
Title: "PSV PlanDefinition (Policy)"
Description: "Defines policy (frequency, method, failure action) for verification types."

Profile: PSVActivityDefinition
Parent: ActivityDefinition
Id: psv-activity-definition
Title: "PSV ActivityDefinition (Verification Activity)"
Description: "Defines a concrete verification activity to be performed by a worker/system."
