# Finance Dashboard System
A Ruby on Rails API for managing financial records with role-based access control.
The system supports user management, transaction tracking, and summary analytics for a finance dashboard.

### Features
* User management (Admin only)
* Financial records CRUD (income & expense)
* Role-based access control (Viewer, Analyst, Admin)
* Dashboard summary (income, expense, balance, category totals)
* Filtering (by date, category, record type)
* Input validation and structured error handling


### Tech Stack
* Ruby on Rails (API)
* SQLite

### Roles & Permissions

| Role    | Access                        |
| ------- | ----------------------------- |
| Viewer  | View records                  |
| Analyst | View records + summaries      |
| Admin   | Full access (users + records) |


### API Endpoints

#### Users
* POST `/users`
* GET `/users`
* PATCH `/users/:id`
* PATCH `/users/:id/status`

#### Financial Records
* POST `/financial_records`
* GET `/financial_records`
* PATCH `/financial_records/:id`
* DELETE `/financial_records/:id`

#### Dashboard
* GET `/financial_records/summary`

#### Filtering
* `/financial_records?record_type=income`
* `/financial_records?category=bills`
* `/financial_records?start_date=YYYY-MM-DD&end_date=YYYY-MM-DD`

### Setup
```bash
git https://github.com/ycisir/finance_dashboard_system.git
cd finance_dashboard_system
bundle install
rails db:create db:migrate
rails s
```

### Testing

```bash
rails test
```

### Assumptions
* Authentication is mocked using `current_user`
* Single-user simulation for testing
* SQLite used for simplicity

### Improvements
* Authentication
* Pagination and search
* API documentation
* Rate limiting
* Soft delete functionality