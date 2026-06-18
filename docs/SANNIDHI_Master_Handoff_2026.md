# SANNIDHI - MASTER PROJECT HANDOFF (June 2026)

## Project Overview
SANNIDHI is a Flutter + Supabase rebuild of an existing Glide application.

### Goals
- Remove Glide dependency
- Eliminate credit-based limitations
- Free-friendly architecture
- Scalable and maintainable codebase
- Support Flutter Web first
- Support Android/iOS later from the same codebase

---

## Technology Stack

### Frontend
- Flutter Web
- Dart

### Backend
- Supabase

### State Management
- Riverpod (added, minimal usage so far)

### Navigation
- Material navigation currently
- GoRouter planned later

### Version Control
- GitHub

---

## Current Project Status

### Completed
- Flutter project created
- Supabase connected successfully
- Teams module working
- Profile module working
- Main navigation working
- Splash page implemented
- AuthGate implemented
- Riverpod installed
- Database connection verified

### Partially Completed
- Authentication

### Not Completed
- Production auth flow
- Meeting Room Booking
- Awards 25'
- Values pages
- △வீ section
- Business Class
- Videos
- Itinerary

---

## Database Status

### Existing Tables

#### profiles
- id
- email
- full_name
- photo_url
- coins_received
- coins_sent
- coins_deducted
- role
- created_at

#### teams
- id
- name
- description
- created_at

#### team_members
- id
- team_id
- profile_id
- is_alumni
- created_at

---

## Current Authentication Situation

### Original Flow
The project originally attempted:

- Email OTP
- OTP verification page
- verifyOTP()

### Discovery
Supabase is currently sending:

- Magic Link emails

NOT:

- Numeric OTP codes

### Current Login Page
Uses:

```dart
Supabase.instance.client.auth.signInWithOtp(
  email: email,
  emailRedirectTo: 'http://localhost:3000',
);
```

### Current Problem

Supabase authentication debugging is still in progress.

Issues encountered:

1. Magic link redirected to localhost mismatch.
2. Session restoration not fully verified.
3. Supabase email rate limit reached repeatedly:
   - over_email_send_rate_limit (429)

### Current Recommendation

Run Flutter using:

flutter run -d chrome --web-port 3000

And configure Supabase:

Site URL:
http://localhost:3000

Redirect URL:
http://localhost:3000

Authentication should be revisited after cooldown expires.

---

## Current Important Files

### main.dart
- Supabase initialization
- PKCE enabled
- Session check logic added

### auth_gate.dart
Current logic:

- If session exists:
  - MainNavigation

- Else:
  - LoginPage

### main_navigation.dart
Working:

Tabs:
- Home
- Teams
- Profile

---

## Existing Functional Modules

### Teams
Working.

Data fetched from Supabase.

### Profile
Working UI.

### Navigation
Working bottom navigation.

---

## Application Specification Summary

### Login
- Email login
- Google login later
- Magic link authentication

### Home
Landing page after login.

### Makkal
Teams:
- Aspire
- Dolabs
- Externship
- SISU
- EdgeOps

### Team Pages
Future:
- Active members
- Alumni members
- Profile views

### Meeting Room Booking
Future:
- Slot booking
- Daily timeline
- CRUD operations

### Awards 25'
Future:
- Dynamic nominations
- Validation
- Autosave

### Values Pages
Future:
- Gratitude
- Pioneering
- Entrepreneurial
- Holistic Growth
- Inclusive
- Excellence

### △வீ
Future:
- Prep
- Business Class
- Videos
- Itinerary

---

## Recommended Next Steps

### Step 1
Stabilize authentication.

### Step 2
Verify session persistence.

### Step 3
Implement proper AuthGate architecture.

### Step 4
Introduce GoRouter.

### Step 5
Build Meeting Room Booking.

### Step 6
Build Awards 25'.

### Step 7
Build remaining content modules.

---

## Instructions For Any New AI Assistant

Before making changes:

1. Read all documentation.
2. Audit existing code.
3. Do not recreate the project.
4. Continue from the existing Flutter project.
5. Preserve working Teams/Profile modules.
6. Fix authentication before building major modules.
7. Prefer reusable widgets and service-layer architecture.
