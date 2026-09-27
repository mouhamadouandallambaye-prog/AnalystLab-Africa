# 📊 FinTrust Digital Bank — Week 2: Data Analysis & Business Intelligence

**Program:** AnalystLab Africa — Experience Lab Internship  
**Track:** Data Analytics  
**Author:** Mouhamadou Andalla Mbaye  
**Contact:** m.andalla.mbaye@gmail.com  

---

## 📌 Executive Summary
Week 2 marks the transition from initial planning into practical execution. This repository contains the complete analytical pipeline for **FinTrust Digital Bank**, transforming 1,500 customer profiles and 12,000 transaction records into actionable business intelligence.

Key outputs include data quality assessments, 8 business SQL queries, Python Exploratory Data Analysis (EDA) with 5 visualisations, an initial Power BI dashboard model, and 5 structured business findings.

---

## 📂 Repository Structure

```text
03 - Week 2/
├── Assignement/
│   └── AnalystLab_Africa_Week2_FinTrust_Assignment.pdf
├── Dataset/
│   ├── FinTrust_Customer_Data.csv
│   └── FinTrust_Transaction_Data.csv
├── Documentation/
│   └── Findings.docx
├── Screenshots/
│   ├── visualisation 1_channel_volume.png
│   ├── visualisation 2_risk_by_type.png
│   ├── visualisation 3_intl_risk.png
│   ├── visualisation 4_status_by_channel.png
│   └── visualisation 5_income_vs_engagement.png
├── Work/
│   ├── FinTrust_Week2_SQL_Analysis.sql
│   ├── FinTrust_Week2_Data_Analysis.ipynb
│   └── FinTrust_Week2_Analytics_Dashboard.pbix
└── README.md
---

## 💡 Key Business Findings

1. **Mobile App Dominance:** The Mobile App is the primary revenue driver, processing **₦240.1M** (42.8% of total monetary volume) across 5,102 transactions.
2. **High Risk in Transfers & Cash Withdrawals:** Transfers recorded a **28.5%** risk review rate, while Cash Withdrawals reached **25.3%**, marking them as primary targets for fraud monitoring.
3. **Vulnerability of International Transactions:** International transactions exhibit a **36.9%** risk review rate compared to **18.9%** for domestic transactions.
4. **Channel Failure Friction:** Mobile App and USSD channels show the highest failure rates at **5.8%** and **5.4%** respectively, highlighting backend system bottlenecks.
5. **Omnichannel Behavior:** Only **61.4%** of transactions by customers who declared "Mobile App" as their preferred channel actually used the app, proving significant channel cross-over.

---

## 🧪 Testing & Quality Assurance

| Stage / Component | Evaluation Test | Finding | Action / Improvement | Result |
| :--- | :--- | :--- | :--- | :--- |
| **Data Integration** | Key join integrity check on `Customer_ID` | 100% referential integrity | Retained all records without drops | Clean relational model without orphan records |
| **Missing Values** | Checked `Device_Type` & `Location` | 96 missing records (~0.8%) | Imputed missing values with `'Unknown'` | Preserved monetary volumes without data loss |
| **DAX Measures** | Cross-validated rates with SQL output | Initial filter context variance | Implemented explicit DAX filter contexts | Perfect alignment (90.47% Success, 19.60% Risk) |

---

## 🛠️ Tools Used
* **Microsoft Excel / Power Query:** Data quality auditing and cleaning.
* **SQL (SQLite / PostgreSQL):** Business querying and multi-table aggregations.
* **Python (Pandas, Seaborn, Matplotlib):** Exploratory data analysis and chart generation.
* **Microsoft Power BI:** Star schema modeling, DAX measure calculations, and dashboard layout.