# Structure Definition Psv Practitioner Intro - Credentials PSV Primary Source IG v1.0.0

* [**Table of Contents**](toc.md)
* **Structure Definition Psv Practitioner Intro**

## Structure Definition Psv Practitioner Intro

## Overview

**PSV Practitioner** models durable credentials (license, board, DEA, education) as `Practitioner.qualification` slices, with auditability via `VerificationResult` and `Provenance`.

### Design Choices

* One slice per credential type for clarity and invariants.
* Each durable credential SHOULD have at least one verification event.

