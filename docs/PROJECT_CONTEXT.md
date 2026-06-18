# PROJECT_CONTEXT.md

## SANNIDHI Project Context

### Project Mission
SANNIDHI is a Flutter + Supabase rebuild of an existing Glide application.

The objective is to create a scalable, maintainable, web-first application that can later support Android and iOS from the same Flutter codebase.

---

## Technology Stack

### Frontend
- Flutter Web
- Dart

### Backend
- Supabase

### State Management
- Riverpod

### Navigation
- Material Navigation (current)
- GoRouter (planned)

### Version Control
- GitHub

---

## Development Principles

1. Do not recreate the project.
2. Continue from the existing codebase.
3. Preserve working functionality.
4. Prefer reusable widgets.
5. Use service-layer architecture.
6. Separate UI from data access.
7. Build scalable folder structures.
8. Keep future mobile compatibility in mind.

---

## Current Working Features

### Teams Module
Status: Working

Capabilities:
- Fetches teams from Supabase
- Displays team data successfully

### Profile Module
Status: Working

Capabilities:
- Profile UI implemented
- Profile service exists

### Navigation
Status: Working

Bottom navigation contains:
- Home
- Teams
- Profile

### Supabase Integration
Status: Working

Capabilities:
- Database connectivity verified
- Tables accessible
- Authentication configured

---

## Current Authentication Status

### Previous Attempt
The project originally implemented:

- Email OTP flow
- OTP verification page
- verifyOTP()

### Discovery
Supabase is configured for Magic Link authentication rather than numeric OTP codes.

### Current Login Flow

User enters email.

Application calls:

Supabase.auth.signInWithOtp()

Supabase sends a login link via email.

### Current Blocker

Authentication is under active debugging.

Known issues encountered:

- Redirect URL mismatch
- Session verification incomplete
- Supabase email rate limits during testing

### Goal

Desired flow:

Splash
↓
AuthGate
↓
LoginPage (if logged out)
OR
MainNavigation (if logged in)

---

## Existing Database Tables

### profiles
- id
- email
- full_name
- photo_url
- coins_received
- coins_sent
- coins_deducted
- role
- created_at

### teams
- id
- name
- description
- created_at

### team_members
- id
- team_id
- profile_id
- is_alumni
- created_at

---

## Planned Database Tables

- alumni
- quotes
- movies
- meeting_room_bookings
- awards
- award_nominations
- itinerary_days
- itinerary_events
- videos
- resources

---

## Application Modules

### Phase 1
Core Foundation

- Authentication
- Home
- Profile
- Teams
- Navigation

### Phase 2
Meeting Room Booking

Introduces:
- CRUD
- Date/Time handling
- Validation

### Phase 3
Awards 25'

Introduces:
- Forms
- Relationships
- Autosave
- Validation

### Phase 4
Values Pages

- Gratitude
- Pioneering
- Entrepreneurial
- Holistic Growth
- Inclusive
- Excellence

### Phase 5

△வீ

Includes:
- Prep
- Business Class
- Videos
- Itinerary

---

## Current Folder Expectations

Keep architecture clean.

Recommended structure:

lib/
├── core/
├── features/
├── shared/
├── services/
├── models/
├── widgets/

---

## Instructions For AI Assistants

Before generating code:

1. Read all files in docs/.
2. Audit existing project structure.
3. Identify completed modules.
4. Avoid rewriting working code.
5. Continue incrementally.
6. Explain proposed changes before major refactors.
7. Prioritize authentication stabilization before new features.

---

## Immediate Next Objective

1. Stabilize authentication.
2. Verify session persistence.
3. Implement production-ready AuthGate.
4. Introduce GoRouter.
5. Continue feature development module-by-module.
