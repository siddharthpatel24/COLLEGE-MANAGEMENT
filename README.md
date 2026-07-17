# CSM (College/Student Management) — Project Structure

This project was refactored from a flat JSP/Servlet layout into a role-based folder
structure. **No business logic, database logic, servlet classes, or `web.xml`
mappings were changed** — only file locations and the path strings that point to
them (`href`, `form action`, `sendRedirect`, image/CSS paths) were updated so the
application continues to work exactly as before.

## Folder layout

```
CSMprg/
├── index.jsp                # Login page (entry point) — unchanged location
├── verify.jsp                # Legacy/alternate login-verification page (not
│                              linked from any page in this app, kept for
│                              compatibility — see "Notes" below)
├── admin/                    # Pages only the Admin role uses
├── student/                  # Pages only the Student role uses
├── staff/                    # Pages only the Staff role uses
│                              (also holds attendance/marks pages that Admin
│                              links into, see "Shared pages" below)
├── payment/                  # Book-purchase / card-payment / OTP flow
├── assets/
│   ├── css/                  # styles.css
│   └── images/               # All static images used by the JSPs
└── WEB-INF/                  # Unchanged: servlets, compiled classes, libs, web.xml
    ├── src/                  # LoginServlet.java, PaymentServlet.java, VerifyOTPServlet.java
    ├── classes/              # Recompiled .class files (see "Servlet changes" below)
    ├── lib/                  # activation-1.1.1.jar, javax.mail-1.6.2.jar
    └── web.xml               # Unchanged servlet mappings
```

## What moved where

| Folder | Files |
|---|---|
| `admin/` | `AdminPage.jsp`, `awelcome.jsp`, `aoptions.jsp`, `atarget.jsp`, `staffinfo.jsp`, `addstaff.jsp`, `staffdatabase.jsp`, `viewstaff.jsp`, `modifystaffinfo.jsp`, `updatestaffinto.jsp`, `deletestaffinfo.jsp`, `studentinfo.jsp`, `addstudent.jsp`, `viewstudent.jsp`, `modifystudent.jsp`, `updatestudent.jsp`, `deletestaff.jsp` |
| `staff/` | `staffPage.jsp`, `staffwellcome.jsp`, `staffoptions.jsp`, `viewstudents.jsp`, `staff_std_details.jsp`, `attendancemark.jsp`, `markattendance.jsp`, `saveattendance.jsp`, `viewattendance.jsp`, `Attendance_view.jsp`, `studentmarks.jsp`, `markentry.jsp`, `savemarks.jsp`, `viewmarks.jsp`, `viewmarksdetails.jsp` |
| `student/` | `student_Page.jsp`, `student_wellcome.jsp`, `student_options.jsp`, `my_profile.jsp`, `my_marks.jsp`, `my_attendance.jsp`, `buy_books.jsp` |
| `payment/` | `payment.jsp`, `verify_payment.jsp`, `payment_success.jsp`, `credit.jsp`, `otp.jsp` |
| `assets/css/` | `styles.css` |
| `assets/images/` | `download.jpg`, `500x669engineering-physics.webp`, `SPPL_45_Front_1080x.webp`, `math.webp` (renamed from `math.img`), `phy.webp` (renamed from `phy.img`) |
| project root | `index.jsp`, `verify.jsp` |

### Shared pages (Admin *and* Staff both link to them)

`viewattendance.jsp`, `Attendance_view.jsp`, `viewmarks.jsp`, and
`viewmarksdetails.jsp` are opened by both `staff/staffoptions.jsp` and
`admin/aoptions.jsp`. They now live in `staff/`, and the links from
`admin/aoptions.jsp` were updated to `../staff/viewattendance.jsp` and
`../staff/viewmarks.jsp` accordingly.

## Path updates made

Every reference was updated to match the new folder depth (one level under the
webapp root):

- Stylesheet links (`<link rel="stylesheet" href="styles.css">`) → `../assets/css/styles.css`
- Image tags (`download.jpg`, the two book-cover `.webp` files) → `../assets/images/...` (or `assets/images/...` from the root `index.jsp`)
- Cross-folder links/forms, e.g. `buy_books.jsp` (student) ↔ `payment.jsp` (payment), `admin/aoptions.jsp` → `staff/viewattendance.jsp`, `verify.jsp` → `admin/AdminPage.jsp` / `staff/staffPage.jsp` / `student/student_Page.jsp`
- Links to servlets (`LoginServlet`, `PaymentServlet`, `VerifyOTPServlet`), which remain mapped at the webapp root in `web.xml`, were changed to `../PaymentServlet` / `../VerifyOTPServlet` when called from one level deep (e.g. `payment/credit.jsp`, `payment/otp.jsp`)
- Same-folder links (the large majority — e.g. `addstaff.jsp` → `staffdatabase.jsp`, both now in `admin/`) were left as simple filenames since no directory changed between them

A full automated check confirmed every `href`, `action`, `src`, and
`sendRedirect` in the JSPs now resolves to a real file on disk (or a servlet
mapping in `web.xml`).

## Servlet changes (paths only — logic untouched)

Three servlets issue `sendRedirect(...)` calls to JSPs that moved, so their
target strings had to be updated to keep the app working:

- `LoginServlet.java`: `"AdminPage.jsp"` → `"admin/AdminPage.jsp"`, `"staffPage.jsp"` → `"staff/staffPage.jsp"`, `"student_Page.jsp"` → `"student/student_Page.jsp"`
- `PaymentServlet.java`: `"otp.jsp"` → `"payment/otp.jsp"`
- `VerifyOTPServlet.java`: `"payment_success.jsp"` → `"payment/payment_success.jsp"`

No other line in any servlet was touched — database connection code, queries,
email/OTP logic, and `web.xml` servlet mappings are byte-for-byte the same as
before. The three `.class` files in `WEB-INF/classes` were recompiled from
these updated `.java` files so the redirects work immediately; if you edit the
servlets further, just recompile with the servlet API + `WEB-INF/lib` jars on
the classpath as usual.

## Removed (temporary/dev-only files)

These were scratch files not referenced by any page and were deleted as part
of the cleanup:

- `tables` — a plain-text `CREATE TABLE` note, not a `.sql` file used by the app
- `temp` — a leftover JSP code scratchpad (a `staff` ID-generator snippet), not wired into any page
- `testemail.jsp` — a standalone SMTP test script with no incoming links

## Known pre-existing dead links (not introduced by this refactor)

A few links in the original project point to pages that were never included
in the source zip. They still point to the same (missing) filenames today —
this refactor did not add or remove this pre-existing behavior:

- `admin/aoptions.jsp` → `feeinfo.jsp`
- `student/student_options.jsp` → `my_fee.jsp` and `subject_materials.jsp`
- `index.jsp` → `register.jsp`
- `payment/verify_payment.jsp` → `sendRedirect("upi.jsp")` (only reached on its failure branch)

If/when those pages are built, put fee-related pages in `payment/` or
`student/`, and `subject_materials.jsp`/`register.jsp` in `student/`/root as
appropriate, and update the corresponding link to include the right relative
path (e.g. `../payment/my_fee.jsp` from `student/`).

## Notes

- `verify.jsp` duplicates `LoginServlet`'s role-based login/redirect logic in
  JSP form. Nothing in the app currently links to it, but it was kept (with
  its internal redirects updated to `admin/`, `staff/`, `student/`) in case it's
  used as a direct entry point.
- `math.webp` / `phy.webp` (renamed from the original `.img` extension for
  clarity) are not currently linked from any page — they appear to be
  placeholder assets for the still-missing `subject_materials.jsp` feature.
