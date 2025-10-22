Profile: PSVPractitionerRole
Parent: PractitionerRole
Id: psv-practitionerrole
Title: "PSV PractitionerRole (US Core derived)"
Description: "PractitionerRole for roles/specialties linked to organizations."
* practitioner 1..1 MS
* organization 1..1 MS
* code MS
* specialty MS

Profile: PSVOrganization
Parent: Organization
Id: psv-organization
Title: "PSV Organization (US Core derived)"
Description: "Represents employers, boards (validators), certifying bodies, accreditors."
* name 1..1 MS
* endpoint MS

Profile: PSVEndpoint
Parent: Endpoint
Id: psv-endpoint
Title: "PSV Endpoint (US Core derived)"
Description: "Endpoints for boards/registries/verifiers."
* address 1..1 MS
* connectionType 1..1 MS
* status 1..1 MS

Profile: PSVOrganizationAffiliation
Parent: OrganizationAffiliation
Id: psv-organizationaffiliation
Title: "PSV OrganizationAffiliation"
Description: "Privileges and affiliations between organizations and practitioners."
* organization 1..1 MS
* participatingOrganization MS
* code MS
* specialty MS
* period MS


