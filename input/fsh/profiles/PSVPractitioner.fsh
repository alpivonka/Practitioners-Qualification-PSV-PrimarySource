// ───────────────────────────── Invariants (generic + per-slice) ─────────────────────────────
Invariant: inv-per-start-before-end
Description: "If both start and end are present, start must be ≤ end."
Severity: #error
Expression: "period.start.exists() and period.end.exists() implies (period.start <= period.end)"

Invariant: inv-has-issuer
Description: "Each qualification entry must have an issuer."
Severity: #error
Expression: "issuer.exists()"

Invariant: inv-license-has-jurisdiction
Description: "License must have a state/territory jurisdiction."
Severity: #error
Expression: "extension('qualification-jurisdiction').exists()"

Invariant: inv-dea-has-schedules
Description: "DEA registration must include one or more schedules."
Severity: #error
Expression: "extension('dea-schedules').exists()"

Invariant: inv-education-has-degree
Description: "Education must have a degree and a conferral/start date."
Severity: #error
Expression: "extension('qualification-degree').exists() and period.start.exists()"

Invariant: inv-training-has-type
Description: "Training must specify a training type."
Severity: #error
Expression: "extension('training-type').exists()"

Invariant: inv-compact-has-name-home
Description: "Compact participation must specify compact name and home state."
Severity: #error
Expression: "extension('compact-name').exists() and extension('compact-home-state').exists()"

Invariant: inv-mate-hours
Description: "MATE training must record hours completed (≥ 8 recommended)."
Severity: #warning
Expression: "extension('mate-hours-completed').value.exists() and extension('mate-hours-completed').value >= 8"



Profile: PSVPractitioner
Parent: Practitioner
Title: "PSV Practitioner with Qualification Slices (Common Pattern + Rules)"
Description: "Practitioner profile with typed qualification slices and shared invariants for credentialing."

// Slicing by qualification type code
* qualification ^slicing.discriminator.type = #value
* qualification ^slicing.discriminator.path = "code.coding.code"
* qualification ^slicing.rules = #open
* qualification contains
    license 0..* and
    board 0..* and
    dea 0..* and
    state-csr 0..* and
    education 0..* and
    training 0..* and
    cert-aprn-pa 0..* and
    cert-pharm 0..* and
    life-support 0..* and
    compact 0..* and
    mate-training 0..*

// ---------------- Common pattern applied per slice ----------------
// (All slices obey issuer + start≤end; status ext is optional everywhere)
RuleSet: CommonQualBackbone
* identifier 0..*
* issuer 1..1
* period 0..1
* obeys inv-has-issuer
* obeys inv-per-start-before-end
* extension contains qualification-status named status 0..1

// ---------------- license ----------------
* qualification[license] insert CommonQualBackbone
* qualification[license].code 1..
* qualification[license].code = psv-qualification-type-cs#license
* qualification[license].identifier 1..
* qualification[license].period 1..
* qualification[license].issuer only Reference(Organization)
* qualification[license].extension contains qualification-jurisdiction named jurisdiction 1..1
* qualification[license] obeys inv-license-has-jurisdiction

// ---------------- board ----------------
* qualification[board] insert CommonQualBackbone
* qualification[board].code 1..
* qualification[board].code = psv-qualification-type-cs#board
* qualification[board].issuer only Reference(Organization)
* qualification[board].period 1..
* qualification[board].identifier 0..1
* qualification[board].extension contains qualification-specialty named specialty 1..1
* qualification[board].extension contains qualification-subspecialty named subspecialty 0..*

// ---------------- dea ----------------
* qualification[dea] insert CommonQualBackbone
* qualification[dea].code 1..
* qualification[dea].code = psv-qualification-type-cs#dea
* qualification[dea].identifier 1..
* qualification[dea].period 1..
* qualification[dea].issuer only Reference(Organization)
* qualification[dea].extension contains dea-schedules named schedules 1..*
* qualification[dea].extension contains dea-registrant-type named registrantType 0..1
* qualification[dea] obeys inv-dea-has-schedules

// ---------------- state-csr ----------------
* qualification[state-csr] insert CommonQualBackbone
* qualification[state-csr].code 1..
* qualification[state-csr].code = psv-qualification-type-cs#state-csr
* qualification[state-csr].identifier 1..
* qualification[state-csr].period 1..
* qualification[state-csr].issuer only Reference(Organization)
* qualification[state-csr].extension contains qualification-jurisdiction named jurisdiction 1..1
* qualification[state-csr] obeys inv-license-has-jurisdiction

// ---------------- education ----------------
* qualification[education] insert CommonQualBackbone
* qualification[education].code 1..
* qualification[education].code = psv-qualification-type-cs#education
* qualification[education].issuer only Reference(Organization)
* qualification[education].period.start 1..
* qualification[education].extension contains qualification-degree named degree 1..1
* qualification[education] obeys inv-education-has-degree

// ---------------- training ---------------- Internship / Residency / Fellowship
* qualification[training] insert CommonQualBackbone
* qualification[training].code 1..
* qualification[training].code = psv-qualification-type-cs#training
* qualification[training].issuer only Reference(Organization)
* qualification[training].period 1..
* qualification[training].extension contains training-type named trainingType 1..1
* qualification[training].extension contains acgme-program-id named acgmeProgramId 0..1
* qualification[training].extension contains completion-status named completionStatus 0..1
* qualification[training].extension contains qualification-specialty named specialty 0..1
* qualification[training] obeys inv-training-has-type

// ---------------- cert-aprn-pa ----------------
* qualification[cert-aprn-pa] insert CommonQualBackbone
* qualification[cert-aprn-pa].code 1..
* qualification[cert-aprn-pa].code = psv-qualification-type-cs#cert-aprn-pa
* qualification[cert-aprn-pa].issuer only Reference(Organization)
* qualification[cert-aprn-pa].period 1..
* qualification[cert-aprn-pa].identifier 0..1
* qualification[cert-aprn-pa].extension contains qualification-specialty named specialty 0..1

// ---------------- cert-pharm ----------------
* qualification[cert-pharm] insert CommonQualBackbone
* qualification[cert-pharm].code 1..
* qualification[cert-pharm].code = psv-qualification-type-cs#cert-pharm
* qualification[cert-pharm].issuer only Reference(Organization)
* qualification[cert-pharm].period 1..
* qualification[cert-pharm].identifier 0..1
* qualification[cert-pharm].extension contains qualification-specialty named specialty 1..1

// ---------------- life-support ----------------
* qualification[life-support] insert CommonQualBackbone
* qualification[life-support].code 1..
* qualification[life-support].code = psv-qualification-type-cs#life-support
* qualification[life-support].issuer only Reference(Organization)
* qualification[life-support].period 1..
* qualification[life-support].identifier 0..1
* qualification[life-support].extension contains life-support-course-type named courseType 1..1
* qualification[life-support].extension contains life-support-delivery-mode named deliveryMode 0..1

// ---------------- compact ----------------
* qualification[compact] insert CommonQualBackbone
* qualification[compact].code 1..
* qualification[compact].code = psv-qualification-type-cs#compact
* qualification[compact].issuer only Reference(Organization)
* qualification[compact].period 1..
* qualification[compact].extension contains compact-name named compactName 1..1
* qualification[compact].extension contains compact-home-state named homeState 1..1
* qualification[compact].extension contains compact-privilege-states named privilegeState 0..*
* qualification[compact] obeys inv-compact-has-name-home

// ---------------- mate-training ----------------
* qualification[mate-training] insert CommonQualBackbone
* qualification[mate-training].code 1..
* qualification[mate-training].code = psv-qualification-type-cs#mate-training
* qualification[mate-training].issuer only Reference(Organization)
* qualification[mate-training].period.start 1..
* qualification[mate-training].extension contains mate-hours-completed named hoursCompleted 1..1
* qualification[mate-training].extension contains mate-meets-dea-requirement named meetsRequirement 0..1
* qualification[mate-training] obeys inv-mate-hours