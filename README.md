# E-Commerce RFM Customer Segmentation

A complete end-to-end data analytics project using Python and PostgreSQL
to segment customers of an online retail business based on their buying behaviour.

---

## Project Overview

Every e-commerce business has thousands of customers but not all customers
are equal. Some buy every week and spend a lot. Others bought once and never
came back. This project uses RFM Analysis to identify exactly who each
customer is and what the business should do about it.

RFM stands for:
- **Recency** — How recently did the customer buy?
- **Frequency** — How often do they buy?
- **Monetary** — How much do they spend?

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Python (Google Colab) | Data cleaning, EDA, RFM analysis |
| Pandas | Data manipulation |
| Matplotlib and Seaborn | Data visualisation |
| PostgreSQL | SQL analysis and querying |

---

## Dataset

- **Source:** Online Retail Dataset — Kaggle
- **Period:** December 2010 to December 2011
- **Size:** 541,909 transactions, 4,338 customers, 38 countries

---

## Project Structure

```
ecommerce-rfm-segmentation/
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_eda.ipynb
│   ├── 03_rfm_analysis.ipynb
│   └── 04_segmentation.ipynb
│
├── sql/
│   └── rfm_queries.sql
│
├── visuals/
│   ├── python_charts/
│   └── sql_screenshots/
│
├── data/
│   └── processed/
│       ├── rfm_scores.csv
│       └── rfm_segmented.csv
│
└── reports/
    └── Executive_Summary_RFM.pdf
```

---

## Key Business Findings

1. **UK dominates revenue** — Over 80% of total revenue comes from
   the United Kingdom

2. **November is peak month** — Revenue spikes every November
   due to holiday shopping

3. **Champions drive 65% of revenue** — Only 957 customers out of
   4,338 are responsible for 65% of all revenue

4. **43% of customers are At Risk or Lost** — A large portion of
   customers have stopped buying

---

## Customer Segments

| Segment | Customers | Avg Spend | Revenue Share |
|---------|-----------|-----------|---------------|
| Champion | 957 | £6,052 | 65.17% |
| Loyal Customer | 764 | £1,828 | 15.71% |
| At Risk | 643 | £1,241 | 8.98% |
| Lost | 1,229 | £478 | 6.61% |
| Potential Loyalist | 426 | £396 | 1.90% |
| New Customer | 319 | £455 | 1.63% |

---

## Business Recommendations

1. Protect Champions with exclusive rewards
2. Win back At Risk customers with discount campaigns
3. Convert New Customers with follow up emails
4. Diversify into Netherlands and Germany
5. Prepare November campaigns 6 weeks early

---

## Author

**Anand Prajapati**
BMS Graduate | Aspiring Data Analyst
PW Data Analytics Certificate

GitHub: github.com/anandprajapati0806-cloud
