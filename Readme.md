# 📊 Customer Churn Analysis  

## 📝 Overview  
This project analyzes **customer churn in a subscription-based business model** to identify at-risk customers, understand churn drivers, and recommend retention strategies.  

The workflow integrates:  
- **SQL** → for structured data extraction, churn calculation, and cohort building  
- **Python** → for exploratory analysis, churn risk segmentation, and visualization  
- **Power BI** → for an interactive dashboard to track churn KPIs and support business decisions  

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/Souvik2730/Churn-Analysis/blob/main/risk_score.ipynb)
---


### 3. **Screenshots Section (for Graphs and Power BI Dashboard)**

## Visualizations

Below are some screenshots from the Python analysis and the Power BI dashboard:

### Python Plots:
![Customer Engagement by Risk Band](https://github.com/Souvik2730/Churn-Analysis/blob/main/Screenshots/Screenshot%202025-08-22%20001806.png)
*Engagement levels of customers categorized by risk band.*

![Monthly Churn Rate Trend](https://github.com/Souvik2730/Churn-Analysis/blob/main/Screenshots/Screenshot%202025-08-22%20001710.png)
*Monthly churn rate trend analysis.*

### Power BI Dashboard:
![Churn Risk Overview Dashboard](https://github.com/Souvik2730/Churn-Analysis/blob/main/Screenshots/Screenshot%202025-08-22%20001907.png)
*Power BI dashboard showing churn risk overview.*

![Customer Retention by Cohort](https://github.com/Souvik2730/Churn-Analysis/blob/main/Screenshots/Screenshot%202025-08-22%20002100.png)
*Customer retention analysis based on cohorts.*

![Customer Level Details](https://github.com/Souvik2730/Churn-Analysis/blob/main/Screenshots/Screenshot%202025-08-22%20002207.png)
*Detailed customer-level analysis based on their activity, payment, and risk band.*


---

## 📌 Project Summary – Customer Churn Analysis

- Built a **churn analysis system** using SQL, Python, and Power BI to identify at-risk customers.  
- Designed **SQL queries & cohort analysis** to calculate churn rate, retention, and Monthly Recurring Revenue (MRR).  
- Used **Python (pandas, numpy, matplotlib, seaborn)** for churn risk segmentation and engagement insights.  
- Delivered an **interactive Power BI dashboard** showing churn trends, regional breakdowns, and risk-based customer segmentation.  
- Helped businesses identify **high-risk customers (Premium plan, low engagement)** and design **targeted retention strategies**.  

---

## 📂 Project Structure  

### Data Sources  
- **customers.csv** → customer details (signup date, plan, region, demographics)  
- **subscriptions.csv** → subscription lifecycle (start date, end date, status)  
- **transactions.csv** → payments, amount, and billing history  
- **logins_monthly.csv** → customer engagement (logins, sessions, activity days)  
- **support_tickets.csv** → support history (category, resolution time, satisfaction)  
- **risk_scored_customers.csv** → churn likelihood labels (Low, Medium, High risk)  

### SQL Process  
- Built **normalized tables** (`customers`, `subscriptions`, `transactions`, etc.)  
- Created **views** for:  
  - Monthly Active Customers (MAC)  
  - Churn Rate % calculation  
  - Monthly Recurring Revenue (MRR)  
  - Cohort-based retention  
- Defined **Churn** as customers inactive for 30+ days or subscription ended without renewal  

### Python Analysis  
- **Cohort Analysis** → tracked retention month-over-month from signup  
- **Churn Risk Segmentation** → used engagement metrics + support history to classify customers into *Low, Medium, High* risk  
- **Visualizations** → churn trends, login activity, support ticket intensity, regional churn variation (via `matplotlib` & `seaborn`)  

### Power BI Dashboard  
Interactive visuals for:  
- 📈 **Churn Rate & Trend Analysis**  
- 🌍 **Churn by Region & Plan**  
- 👥 **Customer Retention & Risk Bands**  
- 🧮 **Cohort Retention Heatmap**  
- 🛠 **Support Tickets vs Churn Risk**  

---

## 🔍 Key Insights  

1. **High-Risk Profiles** → Premium plan users with low engagement & frequent support complaints churn the most  
2. **Cohort Drop-Off** → Major churn happens within the **first 90 days** after signup  
3. **Regional Trends** → Certain regions show consistently higher churn due to poor retention campaigns  
4. **Revenue Impact** → Churn in premium plans affects **30–40% of lost Monthly Recurring Revenue (MRR)**  

---

## 🎯 Strategic Recommendations  

1. **Early Engagement Campaigns** → Focus on customer onboarding & product training within first 3 months  
2. **Proactive Retention Offers** → Discounts/benefits for customers predicted in *High Risk* band  
3. **Support Process Improvement** → Faster resolution for premium customers to reduce frustration  
4. **Plan Optimization** → Introduce flexible pricing tiers to improve retention & upsell opportunities  

---

## 📊 Dashboard Preview  

⚡ Power BI Dashboard provides real-time view of:  
- Churn trends over time  
- Retention across plans/regions  
- Cohort heatmaps (retention lifecycle)  
- High-risk customer lists for targeted action  

(👉 Add screenshots of your dashboard here for better recruiter visibility)

---

## ⚙️ Setup Instructions  

To run this project locally:  

1. **Clone repository**  
   ```bash
   git clone https://github.com/yourusername/customer-churn-analysis.git
   cd customer-churn-analysis

2. Install Python dependencies
   pip install -r requirements.txt

3. Run SQL scripts → to set up database tables & views

4. Launch Jupyter/Colab Notebook → for churn risk analysis

5. Open Power BI file (.pbix) → to explore the interactive dashboard

