
# DBT + DuckDB Data Transformation Project

This project demonstrates how to use [dbt (data build tool)](https://www.getdbt.com/) with [DuckDB](https://duckdb.org/) to perform SQL-based data transformations. It was built and run inside a Google Colab environment.

## 📁 Project Overview

We load CSV data, build DBT models, and transform data inside a local DuckDB database — all from a Colab notebook.

### ✔️ Features

- Uses **dbt-duckdb** to manage models and run transformations
- Processes `orders.csv` and `products.csv` as source data
- Creates a final model: `orders_with_products`
- Runs and queries everything within Colab using DuckDB

---
```
## 🗂️ Project Structure

dbt-duckdb-project/
│
├── models/
│ └── orders_with_products.sql # DBT SQL model
│
├── orders.csv # Source data
├── products.csv # Source data
├── my_duckdb.duckdb # DuckDB database file
├── dbt_project.yml # DBT project config
├── target/ # Compiled DBT outputs
└── README.md # This file

```
---

## ⚙️ How to Run This Project

> You can run this directly in a Colab notebook.

### 1. Install DBT and DuckDB

```python
%pip install dbt-duckdb duckdb

### 2. Set Up the Project Folder
```python
!mkdir -p /content/my_dbt_project/models

### 3. Create Profiles and Config Files
Write profiles.yml to /root/.dbt/ and dbt_project.yml to your project folder.

### 4. Upload Data and Define Models
Upload orders.csv, products.csv, and create your model orders_with_products.sql.

### 5. Run the DBT Models
```python
%cd /content/my_dbt_project
!dbt run

### 6. Query the Transformed Data
Using DuckDB or Pandas:

```python
import duckdb
con = duckdb.connect("/content/my_dbt_project/my_duckdb.duckdb")
df = con.execute("SELECT * FROM orders_with_products").fetchdf()
df.head()


📊 Output Model
The final model orders_with_products combines order and product details using a SQL
