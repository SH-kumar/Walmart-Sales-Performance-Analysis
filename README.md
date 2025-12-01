# Walmart-Sales-Performance-Analysis

# 📊 Introduction

In the contemporary retail landscape, **data-driven decision-making** is essential for maintaining a competitive advantage. This project analyzes **Walmart's sales data using SQL** to uncover valuable insights that support strategic planning, marketing optimization, and customer-focused decision-making.

By examining multiple dimensions—such as customer types, product lines, branch performance, and time-based sales trends—this analysis provides a detailed understanding of **consumer behavior**, **sales patterns**, and **operational efficiency**.

The objective is to identify trends and patterns that can:
- Improve marketing strategies  
- Enhance customer satisfaction  
- Optimize product offerings  
- Improve overall sales performance  

Through structured SQL querying and exploratory analysis, this project answers critical business questions and supports Walmart’s operational and strategic goals.

---

# 📈 Key Insights

### 🔹 Gender-Based Purchasing Behavior
- **Females** predominantly purchase *fashion accessories*.
- **Males** lead in purchasing *electronic accessories*.
- This highlights clear, behavior-driven product preferences.

### 🔹 Product Performance Insights
- **Food & Beverages** has the **highest average customer rating**, indicating strong customer satisfaction.
- **Home and Lifestyle** products have the **highest average VAT**, suggesting they may be higher-priced or premium items.

### 🔹 Time-Based Sales Patterns
- Sales consistently **peak in the evening** across most weekdays.
- **Saturday evenings** show the highest sales volumes, highlighting increased leisure-based shopping activity.

### 🔹 Customer Type Insights
- Members and normal customers are almost equally distributed.
- **Members slightly outnumber normal customers**, suggesting a strong loyalty program participation.

---

# 📂 DataSet

The dataset used in this project was obtained from the **Kaggle Walmart Sales Forecasting Competition**.

It contains **1,000 sales transactions** from Walmart branches located in:
- **Mandalay**
- **Yangon**
- **Naypyitaw**

The dataset consists of **17 columns**, including:

| Column | Description |
|--------|-------------|
| invoice_id | Invoice of the sales transaction |
| branch | Branch at which the sale took place |
| city | City where the branch is located |
| customer_type | Type of customer (Member / Normal) |
| gender | Gender of customer |
| product_line | Category of product sold |
| unit_price | Price of each product |
| quantity | Quantity of the product purchased |
| VAT | Tax applied to the purchase |
| total | Total value of the transaction |
| date | Date of purchase |
| time | Time of purchase |
| payment | Payment method |
| cogs | Cost of goods sold |
| gross_margin_pct | Gross margin percentage |
| gross_income | Gross income from the sale |
| rating | Customer rating of service |

---

# 🛠️ Approach Used

## 1. **Data Wrangling**
This is the initial phase where the dataset is inspected to ensure quality and consistency.  
The main goals include:
- Detecting **NULL values** or missing data  
- Verifying column data types  
- Applying necessary cleaning or transformations  
- Ensuring no invalid or duplicate entries remain  

During table creation, `NOT NULL` constraints were used, which automatically prevented null entries from being inserted into the database.

---

## 2. **Feature Engineering**
Feature engineering helps create new, meaningful attributes that add deeper insights into the analysis.  
The following columns were generated from existing data:

### 🔹 **`time_of_day`**
Specifies whether the transaction occurred in the:
- Morning  
- Afternoon  
- Evening  

Helps determine **which time of the day records the highest sales**.

---

### 🔹 **`day_name`**
Extracts the **day of the week** (Mon, Tue, Wed, Thu, Fri, Sat, Sun).  
Helps answer:
- *Which day of the week is each branch busiest?*  
- *Which days show peak sales?*

---

### 🔹 **`month_name`**
Extracts the **month** (Jan, Feb, Mar, etc.).  
Helps determine:
- *Which month has the highest sales?*  
- *Which month contributes the most to profit?*

---

# Business Questions to Answer

## 🟦 Generic Questions
- How many distinct cities are present in the dataset?
- In which city is each branch situated?

---

## 🟩 Product Analysis
- How many distinct product lines are there in the dataset?
- What is the most common payment method?
- What is the top-selling product line?
- What is the total revenue generated each month?
- Which month recorded the highest Cost of Goods Sold (COGS)?
- Which product line generated the highest revenue?
- Which city has the highest revenue?
- Which product line incurred the highest VAT?
- Retrieve each product line and classify it as **'Good'** or **'Bad'** based on whether its total sales exceed the average.
- Which branch sold more products than the average quantity sold?
- What is the most common product line purchased by each gender?
- What is the average rating for each product line?

---

## 🟥 Sales Analysis
- How many sales were made at each time of the day per weekday?
- Which customer type generates the highest revenue?
- Which city has the highest average VAT?
- Which customer type pays the most VAT?

---

## 🟧 Customer Analysis
- How many unique customer types exist in the data?
- How many unique payment methods are available?
- Which customer type is the most common?
- Which customer type buys the most products?
- What is the gender distribution of customers?
- What is the gender distribution per branch?
- During which time of the day do customers give the most ratings?
- During which time of the day does each branch receive the most ratings?
- Which day of the week has the highest average ratings?
- Which day of the week has the highest average ratings per branch?

---

# ✔️ Recommendations

Based on the insights obtained from the data analysis and SQL queries, the following recommendations can help Walmart optimize its sales strategy and improve customer satisfaction:

## 🎯 1. Targeted Marketing Strategies
- Create marketing campaigns tailored to gender-based purchasing patterns.
- Promote **fashion accessories** more to female customers.
- Strengthen promotional efforts for **electronic accessories** targeted toward male customers.

---

## 🍽️ 2. Enhance Food & Beverages Experience
- The **Food and Beverages** category has the highest customer satisfaction.
- Walmart can expand offerings, introduce combo deals, or run special promotions to capitalize on its popularity.

---

## ⏰ 3. Optimize Promotional Timing
- Since sales peak during **evening hours** and **weekends**, promotions should focus on these periods.
- Introduce morning promotions or weekday offers (especially **Tuesdays and Thursdays**) to boost traffic during slower hours.

---

## 🎁 4. Strengthen Customer Loyalty Programs
- Members and non-members are nearly equally represented.
- Introduce benefits like:
  - Exclusive discounts  
  - Loyalty points  
  - Early-access deals  
- Encourage more customers to join the membership program.

---

## 📦 5. Improve Home & Lifestyle Product Strategy
- This category shows **lower customer satisfaction** (high VAT but lower ratings).
- Recommendations:
  - Review pricing strategy  
  - Evaluate customer feedback  
  - Optimize product quality and inventory  

---

These recommendations, when implemented, can help Walmart improve customer experience, enhance product performance, and increase overall revenue.
