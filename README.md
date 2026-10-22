# 🍽️ Global Restaurant Analytics & SQL Schema Normalization

A comprehensive SQL data engineering and analysis project that transforms a flat dataset of 9,551 global restaurant records into a clean 3NF relational schema, followed by advanced analytical queries to uncover global dining trends, pricing dynamics, and key drivers of customer ratings.

---

## 📌 Table of Contents
- [Project Overview](#-project-overview)
- [Dataset Architecture & Normalization](#-dataset-architecture--normalization)
- [Database Schema (ERD)](#-database-schema-erd)
- [Key Business Questions](#-key-business-questions)
- [Repository Structure](#-repository-structure)
- [Featured SQL Analytical Techniques](#-featured-sql-analytical-techniques)
- [Key Insights & Findings](#-key-insights--findings)
- [Getting Started](#-getting-started)

---

## 🏢 Project Overview

Raw real-world datasets often arrive as unoptimized single CSV files containing heavy data duplication and functional dependencies. This project demonstrates a end-to-end relational database workflow:

1. **Database Engineering:** Deconstructing a flat 21-column CSV into a normalized, multi-table relational database model up to **Third Normal Form (3NF)** to ensure data integrity and eliminate redundancy.
2. **Exploratory SQL Analysis:** Executing structured analytical queries using **Common Table Expressions (CTEs)**, **Window Functions**, and **Multi-Table Joins** to evaluate restaurant performance across countries, cities, price points, and operational offerings.

---

## 🗄️ Dataset Architecture & Normalization

The original dataset comprised **9,551 restaurant records** across 21 features. To resolve redundancy (such as repetitive city/country details and unnormalized cuisine combinations), the flat file was decomposed into **4 core relational entities**:

### 1. `countries_cities` (Location Entity)
* **Purpose:** Normalizes geographic hierarchies.
* **Fields:** `city_id` (PK), `city_name`, `country_code`, `locality`

### 2. `cuisines` (Lookup Entity)
* **Purpose:** Handles atomic, normalized cuisine types.
* **Fields:** `cuisine_id` (PK), `cuisine_name`

### 3. `restaurants` (Core Entity)
* **Purpose:** Holds core restaurant details, geographic coordinates, and location links.
* **Fields:** `restaurant_id` (PK), `restaurant_name`, `address`, `city_id` (FK), `latitude`, `longitude`

### 4. `restaurant_services` & `restaurant_ratings` (Operational & Metric Entities)
* **Purpose:** Tracks service configurations, cost structures, and ratings.
* **Fields:** `service_id` (PK), `restaurant_id` (FK), `has_table_booking`, `has_online_delivery`, `is_delivering_now`, `price_range`, `average_cost_for_two`, `currency`, `aggregate_rating`, `rating_color`, `rating_text`, `votes`

---

## 📊 Key Business Questions

The analytical queries answer crucial operational and market insights:

1. **Market Distribution & Density:** Which cities and countries exhibit the highest concentration of top-rated restaurants?
2. **Cuisine Popularity:** What are the most dominant cuisines globally, and how does cuisine variety influence customer vote volume?
3. **Price vs. Performance:** Is there a strong correlation between `average_cost_for_two` / `price_range` and high `aggregate_rating`?
4. **Service Feature Impact:** Do operational features like online delivery and table bookings lead to higher engagement and better rating scores?
5. **Geographic Ranking:** How do individual localities rank within their respective cities based on average ratings and vote totals?

---

## 🛠️ Featured SQL Analytical Techniques

* **Explicit CTEs & Subqueries:** Structuring complex logic into readable, maintainable Common Table Expressions.
* **Window Functions:** Utilizing `DENSE_RANK()`, `ROW_NUMBER()`, `NTILE()`, and `AVG() OVER(...)` for localized ranking and cumulative benchmarking.
* **Conditional Aggregations:** Using `CASE WHEN` statements combined with `COUNT()` and `SUM()` to analyze service adoption rates across rating tiers.
* **Multi-Table Joins:** Joining parent and child entities across Normalized PK/FK constraints to produce comprehensive reports.

---
