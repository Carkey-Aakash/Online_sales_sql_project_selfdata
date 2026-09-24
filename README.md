# Online Retail Database & SQL Analysis

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-blue?logo=postgresql)
![SQL](https://img.shields.io/badge/SQL-Analysis-orange)
![PL/pgSQL](https://img.shields.io/badge/PL%2FpgSQL-Triggers-purple)
![Project Status](https://img.shields.io/badge/Status-In%20Progress-yellow)

## Overview

This project is an **intermediate-level PostgreSQL database project** built around an online retail business.

The project focuses on more than writing SQL queries. It covers the development of a relational database, analytical SQL, database-level automation, audit logging, SQL Views and basic query-performance analysis.

The database models key components of an online retail system, including:

* Customers
* Products
* Categories
* Orders
* Order Items

The project also includes a separate set of documented **business questions** that demonstrate how SQL can be used to extract useful information from the database.

The implementation is currently **in progress**. The core database and analytical components have been completed, while Role-Based Access Control (RBAC)** is the next major development steps.

---

## Project Objectives

The main objectives of this project are to:

* Design a relational PostgreSQL database
* Establish relationships between related entities
* Apply database constraints for data integrity
* Load and work with sample retail data
* Perform business-oriented data analysis using SQL
* Practice joins, aggregations, subqueries, and window functions
* Implement database auditing using triggers
* Explore PostgreSQL indexing and query execution plans
* Create reusable SQL Views for commonly used data analysis
* Learn how database-level permissions and access control work
* Gradually extend the project toward a more complete PostgreSQL database implementation

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


The project uses window functions such as `RANK()` to perform category-level product analysis.

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

## Trigger-Based Audit Logging

PostgreSQL `PL/pgSQL` trigger functions are used to capture:

* `INSERT`
* `UPDATE`
* `DELETE`

operations.

Audit triggers have been implemented across:

* `products`
* `customers`
* `orders`
* `categories`
* `order_items`

This part of the project helped me understand how database triggers can automatically execute logic when data changes occur.

---

# Indexing & Query Performance

The project also includes an introduction to PostgreSQL query-performance analysis.

The performance section explores:

* Existing database indexes
* Creating indexes on selected columns
* `EXPLAIN ANALYZE`
* Query execution plans
* Table clustering using `CLUSTER`

For example:

```sql
CREATE INDEX idx_customers_country
ON customers(country);
```

An index was also created on `products.category_id` for category-based filtering.

The project uses `EXPLAIN ANALYZE` to inspect how PostgreSQL executes queries before and after indexing.

> **Note:** This is a learning and portfolio project using a relatively small dataset. The performance section demonstrates the process of investigating query execution rather than claiming production-scale performance improvements.

---
# Database Views

The project also includes reusable PostgreSQL **Views** to simplify frequently used queries and provide convenient access to commonly analyzed data.

## Views Created

### `vw_product_details`

This view combines product information with the corresponding category name.

It provides:

* Product ID
* Product name
* Price
* Stock
* Category name

This makes it easier to retrieve product information together with its category without repeatedly writing the same join.

### `vw_customer_orders`

This view provides a summary of customer ordering activity.

It includes:

* Customer ID
* First name
* Last name
* Phone
* Address
* Total number of orders
* Total amount spent

This view provides a reusable source for customer purchasing analysis.

### `vw_recent_orders`

This view retrieves orders placed within the last 35 days.

It can be reused for analyzing recent order activity and applying additional filters to recent orders.

## The SQL file also includes additional analytical queries based on these views, including product/category analysis, customer order and spending analysis, recent high-value orders, latest orders per customer, category sales, low-stock products, and recent product sales.

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
