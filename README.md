# Online Retail Database & SQL Analysis

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-blue?logo=postgresql)
![SQL](https://img.shields.io/badge/SQL-Analysis-orange)
![PL%2FpgSQL](https://img.shields.io/badge/PL%2FpgSQL-Triggers-purple)
![Database%20Auditing](https://img.shields.io/badge/Database-Auditing-red)
![RBAC](https://img.shields.io/badge/Security-RBAC-green)
![Backup%20%26%20Restore](https://img.shields.io/badge/Backup%20%26%20Restore-blue)
![Project Status](https://img.shields.io/badge/Status-Completed-success)



## Overview

This project is an **intermediate-level PostgreSQL database project** built around an online retail business.

<img width="1536" height="1024" alt="Image" src="https://github.com/user-attachments/assets/412d8cd3-83bb-4b64-b8e8-d3cf6aece521" />

The project goes beyond basic SQL queries and covers the complete process of building and working with a relational database, including database design, data analysis, database auditing, SQL Views, indexing, query-performance analysis, Role-Based Access Control (RBAC), and database backup and restore.

The database models key components of an online retail system, including:

* Customers
* Products
* Categories
* Orders
* Order Items
* ChangeLog for database auditing

The project also contains a collection of practical **business questions and SQL queries** that demonstrate how SQL can be used to analyze retail data and answer common business problems.


---

## Project Objectives

The main objectives of this project are to:

* Design a relational PostgreSQL database for an online retail system
* Establish relationships between related entities
* Apply database constraints to maintain data integrity
* Load and work with sample retail data
* Solve practical business questions using SQL
* Practice joins, aggregations, subqueries, and window functions
* Use Common Table Expressions (CTEs)
* Implement database auditing using PL/pgSQL functions and triggers
* Create reusable SQL Views for frequently used analysis
* Explore PostgreSQL indexing and query execution plans
* Understand table clustering and physical data organization
* Implement database roles and permissions
* Practice `GRANT` and `REVOKE`
* Explore column-level access control
* Demonstrate Role-Based Access Control (RBAC)

---

### Main Tables

| Table         | Description                                            |
| ------------- | ------------------------------------------------------ |
| `customers`   | Stores customer information and location details       |
| `categories`  | Stores product categories                              |
| `products`    | Stores product information, pricing, and stock         |
| `orders`      | Stores customer orders and order totals                |
| `order_items` | Stores products and quantities belonging to each order |
| `ChangeLog`   | Stores database operation audit records                |

The schema uses primary keys, foreign keys, unique constraints, `NOT NULL` constraints, identity columns, and default values.

---

# SQL Analysis

The project contains a dedicated collection of SQL queries covering different aspects of the retail database.

Rather than duplicating those questions in this README, the complete documentation is maintained separately in:

```text
Business_Questions/
└── BUSINESS_QUESTIONS.md
```

That file contains the business questions addressed by the project and explains the purpose of each analysis.

The analytical SQL covers areas such as:

* Customer purchasing behavior
* Product sales performance
* Customer spending
* Order analysis
* Product popularity
* Category-level analysis
* Inventory availability
* Monthly order activity
* Customer distribution
* High-value orders

---


# SQL Skills Demonstrated

This project provides practical experience with several important SQL concepts.

### Basic SQL

* `SELECT`
* `WHERE`
* `ORDER BY`
* `LIMIT`
* `DISTINCT`

### Aggregation

* `SUM()`
* `AVG()`
* `COUNT()`
* `MAX()`
* `GROUP BY`
* `HAVING`

### Joins

* `INNER JOIN`
* `LEFT JOIN`
* Multi-table joins
* Relational data analysis

### Date & Time Functions

* `CURRENT_TIMESTAMP`
* `CURRENT_DATE`
* `INTERVAL`
* `EXTRACT()`
* `DATE_TRUNC()`

### Advanced SQL

* Subqueries
* Window functions
* `RANK()`
* `ROW_NUMBER()`
* Common Table Expressions (CTEs)
* Correlated query concepts
* Aggregation across multiple related tables
* SQL Views

The project uses window functions such as `RANK()` and `ROW_NUMBER()` to perform category-level and customer-level analysis.


---

# Database Auditing

A major technical component of this project is the implementation of a database audit system.

A dedicated `ChangeLog` table records database changes:

```text
ChangeLog
├── log_id
├── table_name
├── operation
├── record_id
├── change_date
└── changed_by
```

This provides a basic history of changes made to important database tables.

# Database Auditing

A database auditing system was implemented using PostgreSQL **PL/pgSQL trigger functions**.

A dedicated `ChangeLog` table records database operations:

```text
ChangeLog
├── log_id
├── table_name
├── operation
├── record_id
├── change_date
└── changed_by
```

The `changed_by` field uses the PostgreSQL `CURRENT_USER` value in several audit functions to identify the database user performing the operation.

## Trigger-Based Audit Logging

Triggers and PL/pgSQL functions were implemented for:

* `INSERT`
* `UPDATE`
* `DELETE`

operations.

Auditing was practiced across:

* `products`
* `customers`
* `orders`
* `categories`
* `order_items`

For example, product changes are automatically recorded in the `ChangeLog` table when the corresponding triggers execute.

This helped demonstrate how PostgreSQL triggers can automatically execute database-side logic when data changes occur.
---
# Database Views

The project includes reusable PostgreSQL **Views** for simplifying frequently used queries and analysis.

## `vw_product_details`

Combines product information with category information.

It provides:

* Product ID
* Product name
* Price
* Stock
* Category name

```sql
SELECT * FROM vw_product_details;
```

---

## `vw_customer_orders`

Provides a summary of customer ordering activity.

It includes:

* Customer ID
* First name
* Last name
* Phone
* Address
* Total number of orders
* Total amount spent

The view calculates customer totals using order items and their quantities and prices.

---

## `vw_recent_orders`

Provides orders placed within the last **35 days**.

```sql
SELECT * FROM vw_recent_orders;
```

This view can then be used with additional filters for recent-order analysis.

---

# Indexing & Query Performance

The project also explores PostgreSQL query-performance concepts.

The performance section covers:

* Existing database indexes
* Creating indexes
* Primary-key indexes
* Unique indexes
* `EXPLAIN ANALYZE`
* Query execution plans
* Table clustering using `CLUSTER`

For example:

```sql
CREATE INDEX idx_customers_country
ON customers(country);
```

An index was also created on `products.category_id`:

```sql
CREATE INDEX idx_products_category_id
ON products(category_id);
```

The project uses `EXPLAIN ANALYZE` to inspect how PostgreSQL executes queries before and after indexing.

---


# Role-Based Access Control (RBAC)

The project includes practical PostgreSQL **Role-Based Access Control** exercises.

The RBAC section demonstrates how users and permission roles can be separated to control access to database objects.

The basic workflow includes:

1. Create login roles
2. Allow users to connect to the database
3. Create permission roles
4. Grant schema access
5. Grant table permissions
6. Assign permission roles to users
7. Revoke permissions
8. Check effective permissions

For example:

```sql
CREATE ROLE sales_user
LOGIN
PASSWORD 'strongpassword';
```

A separate permission role can then be created:

```sql
CREATE ROLE sale_role;
```

And permissions can be assigned to the permission role:

```sql
GRANT SELECT
ON TABLE customers
TO sale_role;
```

The user can then be assigned to that role:

```sql
GRANT sale_role
TO sales_user;
```

This role-based approach is demonstrated in the SQL implementation.

---

# Permission Verification

The project also demonstrates checking effective permissions using PostgreSQL privilege functions.

Example:

```sql
SELECT
    has_table_privilege(
        current_user,
        'public.customers',
        'SELECT'
    ) AS customers_select;
```

Permissions for different tables and operations are checked using `has_table_privilege()`.

---
# Backup & Restore

Database backup and restore was also practiced using PostgreSQL/pgAdmin.

The project includes experience with:

* Creating a database backup
* Choosing backup formats
* Restoring a PostgreSQL database
* Restoring from a `.sql` backup
* Understanding the difference between SQL-script backups and archive-based backups

The backup and restore process was used to verify that the database can be recreated from a backup.

---

# Project Structure

```text
Online-Retail-Database/
│
├── onlinesalesdb.sql
│
├── Business_Questions/
│   └── BUSINESS_QUESTIONS.md
│
└── README.md
```

# Technologies Used

| Technology              | Purpose                                   |
| ----------------------- | ----------------------------------------- |
| **PostgreSQL**          | Relational database management system     |
| **SQL**                 | Data querying and analysis                |
| **PL/pgSQL**            | Trigger functions and database-side logic |
| **PostgreSQL Triggers** | Automated database auditing               |
| **SQL Views**           | Reusable queries and summarized data      |
| **Indexes**             | Query performance exploration             |
| **EXPLAIN ANALYZE**     | Query execution analysis                  |
| **CLUSTER**             | Table organization experiment             |
| **RBAC**                | Database access control                   |
| **GRANT / REVOKE**      | Permission management                     |
| **pgAdmin**             | PostgreSQL database administration        |
| **Git / GitHub**        | Version control and project portfolio     |

---

# Project Coverage

| Area                      | Topics Covered                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| Customer Analysis         | Customer order history, active customers, inactive customers, customer spending, customer distribution |
| Sales Analysis            | Product sales, category revenue, order value, customer spending                                        |
| Product Analysis          | Product sales, product frequency, pricing, highest-priced products                                     |
| Inventory                 | Stock availability, out-of-stock products, low-stock products                                          |
| Order Analysis            | Order history, recent orders, high-value orders, order frequency                                       |
| Category Analysis         | Category popularity, average prices, category revenue                                                  |
| Database Design           | Tables, primary keys, foreign keys, constraints, identity columns                                      |
| Database Auditing         | ChangeLog table, audit functions, audit triggers                                                       |
| Database Views            | Product details, customer orders, recent orders                                                        |
| Performance               | Indexes, clustering, `EXPLAIN ANALYZE`                                                                 |
| Advanced SQL              | Subqueries, CTEs, window functions, `ROW_NUMBER()`, `RANK()`                                           |
| Security & Access Control | Roles, users, `GRANT`, `REVOKE`, role inheritance, column-level permissions                            |
| PostgreSQL Features       | Functions, triggers, views, indexes, database roles                                                    |
