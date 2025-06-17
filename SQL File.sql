SELECT
    CASE
        WHEN c.Age >= 18 AND c.Age < 25 THEN '18-24'
        WHEN c.Age >= 25 AND c.Age < 35 THEN '25-34'
        WHEN c.Age >= 35 AND c.Age < 45 THEN '35-44'
        WHEN c.Age >= 45 AND c.Age < 55 THEN '45-54'
        WHEN c.Age >= 55 THEN '55+'
    END AS age_group,
    c.gender,
    c.income_level,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(t.amount_spent) AS total_spent,
    ROUND(AVG(t.amount_spent)) AS avg_spent_per_transaction
FROM customers c
JOIN transaction t ON c.custumer_id = t.customer_id
GROUP BY age_group, c.gender, c.income_level
ORDER BY total_spent DESC;

SELECT
    c.custumer_id,
    c.gender,
    c.age,
    c.income_level,
    COUNT(t.transaction_id) AS transactions,
    SUM(t.amount_spent) AS total_spent,
    ROUND(AVG(t.amount_spent)) AS avg_transaction_value
FROM customers c
JOIN transaction t ON c.custumer_id = t.customer_id
GROUP BY c.custumer_id, c.gender, c.age, c.income_level
ORDER BY total_spent DESC
LIMIT 20; 


SELECT
	p.product_name,
    p.product_category,
	t.product_id,
	COUNT(t.quantity) AS total_quantity,
	SUM(amount_spent) AS total_spent
 FROM transaction t
 JOIN products p ON  t.product_id=p.product_id
 GROUP BY t.product_id,p.product_name, p.product_category
 ORDER BY total_quantity DESC;
 
 
 SELECT 
	f.satisfaction_score,
    f.comments,
    p.product_name,
    p.product_category
FROM feedback f 
JOIN transaction t ON f.transaction_id=t.transaction_id
JOIN products p ON t.product_id=p.product_id
GROUP BY f.satisfaction_score,f.comments,p.product_name,p.product_category;