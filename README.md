# Online Retail Database & SQL Analysis

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-blue?logo=postgresql)
![SQL](https://img.shields.io/badge/SQL-Analysis-orange)
![PL/pgSQL](https://img.shields.io/badge/PL%2FpgSQL-Triggers-purple)
![Project Status](https://img.shields.io/badge/Status-In%20Progress-yellow)

## Overview

This project is an **intermediate-level PostgreSQL database project** built around an online retail business.

The project focuses on more than writing SQL queries. It covers the development of a relational database, analytical SQL, database-level automation, audit logging, and basic query-performance analysis.

The database models key components of an online retail system, including:

* Customers
* Products
* Categories
* Orders
* Order Items

The project also includes a separate set of documented **business questions** that demonstrate how SQL can be used to extract useful information from the database.

The implementation is currently **in progress**. The core database and analytical components have been completed, while **SQL Views and Role-Based Access Control (RBAC)** are the next major development steps.

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



