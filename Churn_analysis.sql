CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  signup_date DATE,
  plan VARCHAR(20),
  region VARCHAR(20),
  acquisition_channel VARCHAR(30)
);

CREATE TABLE subscriptions (
  customer_id INT,
  plan VARCHAR(20),
  start_date DATE,
  end_date DATE NULL,
  status VARCHAR(10), -- active|churned
  PRIMARY KEY (customer_id, start_date)
);

CREATE TABLE transactions (
  transaction_id INT PRIMARY KEY,
  customer_id INT,
  date DATE,
  amount DECIMAL(10,2),
  type VARCHAR(20), -- renewal|upgrade
  plan VARCHAR(20)
);

CREATE TABLE logins_monthly (
  customer_id INT,
  month DATE,
  active_days INT,
  total_sessions INT,
  PRIMARY KEY (customer_id, month)
);

CREATE TABLE support_tickets (
  ticket_id INT PRIMARY KEY,
  customer_id INT,
  created_at DATE,
  category VARCHAR(20),
  resolved BOOLEAN
);


-- Expand monthly base from transactions (each renewal = active month)
CREATE VIEW v_active_base AS
SELECT
  CAST(DATE_FORMAT(date, '%Y-%m-01') AS DATE) AS month,
  customer_id,
  plan,
  amount
FROM transactions;


-- MRR by month
CREATE OR REPLACE VIEW v_mrr AS
SELECT month, SUM(amount) AS mrr
FROM v_active_base
GROUP BY month;

-- Customers active in month M and not in M+1 = churned in M+1
WITH months AS (
  SELECT DISTINCT month FROM v_active_base
),
active_m AS (
  SELECT month, customer_id FROM v_active_base
),
active_next AS (
  SELECT DATE_FORMAT(DATE_ADD(month, INTERVAL 1 MONTH), '%Y-%m-01') AS month, customer_id
  FROM v_active_base
)
SELECT
  m.month AS churn_month,
  COUNT(DISTINCT a.customer_id) AS churned_customers
FROM months m
LEFT JOIN active_m a ON a.month = m.month
LEFT JOIN active_next an ON an.month = DATE_FORMAT(DATE_ADD(m.month, INTERVAL 1 MONTH), '%Y-%m-01')
  AND an.customer_id = a.customer_id
WHERE an.customer_id IS NULL
GROUP BY m.month
ORDER BY m.month;


WITH cohorts AS (
  SELECT 
    customer_id, 
    CAST(DATE_FORMAT(signup_date, '%Y-%m-01') AS DATE) AS cohort_month
  FROM customers
),
activity AS (
  SELECT 
    customer_id_int AS customer_id,
    CAST(DATE_FORMAT(`date`, '%Y-%m-01') AS DATE) AS month
  FROM transactions
)
SELECT
  c.cohort_month,
  a.month,
  COUNT(DISTINCT a.customer_id) AS active_customers
FROM cohorts c
JOIN activity a USING (customer_id)
GROUP BY c.cohort_month, a.month
ORDER BY c.cohort_month, a.month;

