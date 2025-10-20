

Profile: PSVPractitioner
Parent: Practitioner
Id: psv-practitioner
Title: "PSV Practitioner (US Core derived)"
Description: "Practitioner with identifiers (NPI) and qualifications for PSV use."
* identifier MS
* identifier.system ^short = "Use http://hl7.org/fhir/sid/us-npi for NPI"
* qualification.extension contains QualificationStatus named status 0..1
* qualification ^slicing.discriminator.type = #pattern
* qualification ^slicing.discriminator.path = "code"
* qualification ^slicing.rules = #open
* qualification contains
    license 0..* and
    board 0..* and
    dea 0..* and
    education 0..*

* qualification[license].code 1..1 MS
* qualification[license].identifier MS
* qualification[license].issuer MS
* qualification[license].period MS


* qualification[board].code 1..1 MS
* qualification[board].identifier MS
* qualification[board].issuer MS
* qualification[board].period MS

* qualification[dea].code 1..1 MS
* qualification[dea].identifier MS
* qualification[dea].issuer MS
* qualification[dea].period MS

* qualification[education].code 1..1 MS
* qualification[education].identifier MS
* qualification[education].issuer MS
* qualification[education].period MS


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


Extension: QualificationStatus
Id: qualification-status
Title: "Qualification Status"
Description: "Status of a professional qualification (e.g., active, suspended, revoked)."
* ^status = #draft
* ^url = $ext-qualification-status
* ^context[0].type = #element
* ^context[0].expression = "Practitioner.qualification"   // legal placement
* value[x] only CodeableConcept
// optionally bind:
// * valueCodeableConcept from YourStatusValueSet (extensible)