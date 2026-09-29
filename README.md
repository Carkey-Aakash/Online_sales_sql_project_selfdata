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

# RBAC Scenarios

The project also contains multiple practical access-control scenarios.

### Scenario 1 — Read-Only Access

A role with `SELECT` access to all tables.

### Scenario 2 — Data Entry Clerk

Allows inserting data into selected tables such as:

* `categories`
* `order_items`

### Scenario 3 — Product Manager

Provides CRUD access to:

* `products`
* `categories`

### Scenario 4 — Order Processor

Provides `SELECT` and `UPDATE` access to:

* `orders`

### Scenario 5 — Customer Support

Provides read access to:

* `customers`
* `orders`

### Scenario 6 — Marketing Analyst

Provides read-only access to all tables.

### Scenario 7 — Sales Analyst

Provides read access to:

* `orders`
* `order_items`

### Scenario 8 — Inventory Manager

Provides CRUD access to:

* `products`

### Scenario 9 — Finance Manager

Provides `SELECT` and `UPDATE` access to:

* `orders`

### Scenario 10 — Backup Operator

Demonstrates database connection permission for a backup-related role.

### Scenario 11 — Restricted Read Access

Demonstrates **column-level permissions** by allowing access only to selected customer columns:

```sql
GRANT SELECT(first_name,last_name,email)
ON TABLE customers
TO restricted_read_role;
```

### Scenario 14 — Temporary Access

Demonstrates granting access and later revoking it.

### Scenario 15 — Application Role

Creates a login role for an application and assigns an existing permission role to it.

## The SQL file contains these RBAC scenarios as practical exercises in PostgreSQL access control.

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


# Technologies Used

| Technology              | Purpose                                   |
| ----------------------- | ----------------------------------------- |
| **PostgreSQL**          | Relational database management system     |
| **SQL**                 | Data querying and analysis                |
| **PL/pgSQL**            | Trigger functions and database-side logic |
| **PostgreSQL Triggers** | Automated audit logging                   |
| **SQL Views**           | Reusable queries and summarized data      |
| **Indexes**             | Query performance exploration             |
| **EXPLAIN ANALYZE**     | Query execution analysis                  |
| **CLUSTER**             | Table organization experiment             |
| **Git / GitHub**        | Version control and project portfolio     |


## The implemented SQL specifically
