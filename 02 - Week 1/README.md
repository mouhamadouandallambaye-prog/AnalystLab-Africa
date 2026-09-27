# 🏦 FinTrust Digital Bank — Week 1: Business Intelligence & Data Understanding

**Track:** Data Analytics  
**Program:** AnalystLab Africa — Experience Lab Internship  
**Author:** Mouhamadou Andalla Mbaye  
**Contact:** m.andalla.mbaye@gmail.com  

---

## 📌 Executive Summary
FinTrust Digital Bank is a digital banking institution seeking to leverage customer and transactional data to enhance business understanding, optimize operational performance across channels, and identify potential risk factors.

Week 1 focuses on establishing the analytical foundation: defining the business problem, profiling the underlying customer and transaction datasets, formulating key analytical questions, defining core KPIs, and designing a 3-page Power BI dashboard wireframe.

---

## 📊 Dataset Overview & Profiling

### 1. Customer Dataset (`FinTrust_Customer_Data.csv`)
* **Records:** 1,500 clients | **Columns:** 12 attributes
* **Primary Key:** `Customer_ID`
* **Completeness:** 100% (0 missing values)
* **Key Fields:** Age, Gender, City, Customer Segment, Account Type, Tenure Months, Digital Engagement Score, Monthly Income Band, Preferred Channel, Account Status.

### 2. Transaction Dataset (`FinTrust_Transaction_Data.csv`)
* **Records:** 12,000 transactions | **Columns:** 11 attributes
* **Foreign Key:** `Customer_ID` (100% referential integrity verified)
* **Key Fields:** Transaction ID, DateTime, Type, Amount (NGN), Channel, Device Type, Location, International Flag, Status, Risk Review Flag.
* **Missing Values:** 96 missing entries in `Device_Type` and `Location` (~0.8%), intentionally included as synthetic network noise.

---

## 📈 Key Performance Indicators (KPIs)

| KPI Name | Formula / Definition | Baseline Value | Strategic Value |
| :--- | :--- | :--- | :--- |
| **Total Monetary Volume** | `SUM(Amount_NGN)` | ₦560,477,354.85 | Tracks total throughput across banking channels |
| **Total Transactions** | `COUNT(Transaction_ID)` | 12,000 | Measures system usage and adoption |
| **Average Transaction Value** | `AVERAGE(Amount_NGN)` | ₦46,706.45 | Establishes baseline basket size for limits & tiering |
| **Transaction Success Rate** | `(Successful / Total) * 100` | 90.47% | Operational reliability and user satisfaction metric |
| **Transaction Failure Rate** | `(Failed / Total) * 100` | 5.25% | Pinpoints system outages and integration bugs |
| **Risk Review Rate** | `(Risk_Flag = 'Yes' / Total) * 100` | 19.60% | Monitors proportion of transactions flagged for review |

---

## 🎯 Core Analytical Questions
1. **Demographics vs Engagement:** How do age and income band correlate with Digital Engagement Scores?
2. **Channel Performance:** Which channels process the highest monetary volume in NGN?
3. **Operational Failure Points:** What is the failure/reversal rate per channel and transaction type?
4. **Risk Pattern Identification:** What attributes characterize transactions flagged with `Risk_Review_Flag = Yes`?
5. **Customer Segment Value:** Which customer segment contributes the highest average transaction value?

---

## 🖥️ Power BI Dashboard Architecture (Wireframe)

* **Page 1: Executive Overview** — High-level financial volume (NGN), transaction counts, success rates, channel trends, and top cities.
* **Page 2: Operational Intelligence** — Channel reliability, transaction status breakdown (Failed vs Reversed), device usage, and preferred vs actual channel matrix.
* **Page 3: Risk Intelligence** — Risk review flag concentration, international transaction monitoring, high-value risk matrix, and geographic heatmaps.

---

## 📁 Week 1 Deliverables
* `Submission/FinTrust_Digital_Bank_Week1_Presentation_EN.pptx` — Official 10-slide English presentation deck.
* `Dataset/` — Approved synthetic banking datasets and dictionary.