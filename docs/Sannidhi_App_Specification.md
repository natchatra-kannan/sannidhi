# SANNIDHI - APPLICATION SPECIFICATION

## Global Layout
Persistent top navigation bar on all authenticated pages:
- S.NIDHI
- △வீ
- Makkal
- Meeting Room Booking
- Awards 25'
- Account icon (top right)
  - View Profile
  - Sign Out

---

## Login Page
Contents:
- Logo
- "Log in to S.NIDHI"
- "Please enter your email address"
- Email input
- Continue button
- Continue with Google button

### Login Continuation
- "Check your email"
- "We've sent a pin to abc@gmail.com"

---

## Home Page (S.NIDHI)
Top-level landing page after login.

---

## △வீ Page
Static:
- Logo
- Lifeline of edge
- SANNIDHI

Subpages:
- Prep - Books + Movies + Standees
- Business Class
- Soorarai Pottru Videos
- Itinerary

---

## Makkal Page
Static:
- Logo
- Lifeline of edge
- SANNIDHI

Teams:
- Aspire
- Dolabs
- Externship
- SISU
- EdgeOps

Each team:
- Large horizontal card
- "Check out the team" button

---

## Team Pages (Aspire, Dolabs, Externship, SISU, EdgeOps)

Structure:
- Team group image
- Active section
- Alumni section

Data source:
- Google Sheet (to be provided later)

Each profile:
- Clickable
- Individual profile view

---

## Meeting Room Booking

Components:
- Book a Slot + button

Popup:
- From (date + time)
- To (date + time)
- Submit
- Cancel

Booking View:
- Daily schedule
- Current day only
- 12 AM to 11 PM timeline

---

## Awards 25'

Static instructions:
- Nominate at least one person, pursuit, or project for each award.
- Review each award description before submitting.
- Support every nomination with data, social proof, or a story.
- Nominations auto-save.

Dynamic nomination dropdowns:
- Data source: Google Sheets (later)

Awards:
- Sei - செய்
- Yayum - யாயும்
- Ulavu - உழவு
- Uppu - உப்பு
- Yaal - யாழ்
- Savaal - சவால்
- Sol - சொல்
- Samam - சமம்
- Uyir - உயிர்
- Saram - சரம்
- Uru - உரு

Each award includes:
- Description
- Nomination fields
- Reason fields
- Validation rules

---

## Profile Page

Display:
- User email
- Add Photo button
- Coins received so far
- Coins sent so far
- Coins deducted
- Current balance

Each coin category:
- More Details button

---

## Sign Out
Returns user to login page.

---

## Values Pages

Pages:
- Gratitude (நன்றியுணர்வு)
- Pioneering (முன்னோடி)
- Entrepreneurial (தொழில்முனைவு)
- Holistic Growth (ஒட்டுமொத்த வளர்ச்சி)
- Inclusive (உள்ளடக்கிய தன்மை)
- Excellence (சிறப்பு)

Common Structure:
- Logo
- Title
- Employee-created quotes
- Display quote feed
- Movies To Watch section
- Netflix/external links

---

## Prep - Books + Movies + Standees

Static text:
- Reading is not mandatory
- Movies is mandatory

Display:
- Books list
- Movies list
- Drive links (later)

---

## Business Class

Display long-form static content from existing Glide app.
Includes:
- Instructions
- Sections 1–3
- Questions 1–9
- Submission instructions
- Quotes and references

Content should be stored separately as structured content.

---

## Soorarai Pottru Videos

Static instructions.

Display ordered playlist:
- 2024 Soorarai Pottru - SPI EDGE Theme
- Hail the LGBTQAI+ {New Lens}
- Navagunjara Part 1
- Navagunjara Part 2
- Navagunjara Explained
- Thalinomics

Video links to be supplied later.

---

## Itinerary

Display:
- Vetri Vel Day 1
- Veera Vel Day 2
- Shakthi Vel Day 3

Large image cards leading to respective pages.

Footer:
House rules and team logo section.

---

## Vetri Vel

Schedule/timeline page.

Contains:
- Check In
- Lunch
- Champagne of Life
- Aum
- Kindi
- Hukum
- Dinner
- Qissa
- Marupadiyum 2023

Time-based itinerary display.

---

## Veera Vel
Same structure as Vetri Vel.

---

## Shakthi Vel
Same structure as Vetri Vel.

---

## Future Data Sources

Google Sheets:
- Employee directory
- Team memberships
- Alumni data
- Award nomination lists
- Additional content

Later migration target:
- Supabase tables

---

## Suggested Core Tables

users
profiles
teams
team_members
alumni
quotes
movies
meeting_room_bookings
awards
award_nominations
itinerary_days
itinerary_events
videos
resources

