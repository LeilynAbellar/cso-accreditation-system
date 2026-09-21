# CSO Accreditation System

A web-based accreditation and project monitoring system for Civil Society Organizations (CSOs), developed in collaboration with the **Department of Agriculture - Western Visayas**. The system digitizes and streamlines the entire CSO accreditation lifecycle — from document submission and admin review, to project tracking, financial reporting, and performance ranking.

---

## Features

- **Accreditation Management** — CSOs can submit required documents online; admins review and approve or deny each submission
- **Renewal Applications** — Handles accreditation renewal with document re-submission workflow
- **Project & Milestone Tracking** — CSOs can manage projects, set milestones, and assign tasks with deadlines
- **Financial Reporting** — CSOs submit financial statements; system computes solvency, ROI, and liquidity indicators
- **Performance Ranking** — Automated ranking of CSOs based on configurable weighted criteria
- **Proposal Management** — CSOs submit project proposals for admin review and funding approval
- **Announcements** — Admins can post announcements with file attachments for CSO users
- **Role-based Access** — Separate dashboards for Admin, CSO Chairperson, and CSO Representative

---

## Tech Stack

| Layer | Technology |
|---|---|
| Backend | PHP |
| Database | MySQL (MariaDB) |
| Frontend | HTML, CSS, JavaScript |
| UI Framework | Bootstrap 4 (SB Admin 2) |
| Email | PHPMailer |
| Icons | Font Awesome |

---

## Local Setup

### Requirements
- XAMPP (or any local server with PHP and MySQL)
- PHP 8.x
- MySQL / MariaDB

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/LeilynAbellar/cso-accreditation-system.git
   ```

2. **Move the project to your server root**
   ```
   Copy the DA/ folder into htdocs/ (XAMPP) or www/ (WAMP)
   ```

3. **Create the database**
   - Open phpMyAdmin
   - Create a new database named `cso`
   - Import `DA/sql/cso (10).sql`

4. **Configure the database connection**
   - Open `DA/include/db_connect.php`
   - Update credentials if needed (default: `root` / no password)

5. **Access the system**
   ```
   http://localhost/DA
   ```

---

## Folder Structure

```
DA/
├── admin_include/        # Admin layout partials
├── cso_include/          # CSO layout partials
├── user_include/         # User layout partials
├── include/              # Shared includes (DB connection, header, footer)
├── css/                  # Stylesheets
├── js/                   # JavaScript files
├── images/               # Static images
├── vendor/               # Third-party libraries (PHPMailer, FontAwesome, jQuery)
├── sql/                  # Database schema
├── uploads/              # User-uploaded files (auto-generated, git-ignored)
└── downloadables/        # Downloadable forms and guidelines
```

---

## Notes

- The `uploads/` and other user-generated directories are excluded from version control via `.gitignore`. They will be created automatically when users upload files.
- Default database credentials are `root` with no password. Update `DA/include/db_connect.php` for production.
