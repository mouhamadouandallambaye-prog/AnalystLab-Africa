--Question 1: Quel est le volume, le nombre et la valeur moyenne des transactions par canal ?
SELECT 
    Channel,
    COUNT(Transaction_ID) AS Total_Transactions,
    ROUND(SUM(Amount_NGN), 2) AS Total_Volume_NGN,
    ROUND(AVG(Amount_NGN), 2) AS Avg_Transaction_Value_NGN
FROM transactions
GROUP BY Channel
ORDER BY Total_Volume_NGN DESC;

--Question 2: Quel est le taux d'échec des transactions par canal ?
SELECT 
    Channel,
    COUNT(Transaction_ID) AS Total_Tx,
    SUM(CASE WHEN Transaction_Status = 'Successful' THEN 1 ELSE 0 END) AS Successful_Tx,
    SUM(CASE WHEN Transaction_Status = 'Failed' THEN 1 ELSE 0 END) AS Failed_Tx,
    ROUND(100.0 * SUM(CASE WHEN Transaction_Status = 'Failed' THEN 1 ELSE 0 END) / COUNT(Transaction_ID), 2) AS Failure_Rate_Pct
FROM transactions
GROUP BY Channel
ORDER BY Failure_Rate_Pct DESC;

--Question 3: Comment se répartissent les révisions de risque selon le type de transaction ?
SELECT 
    Transaction_Type,
    COUNT(Transaction_ID) AS Total_Tx,
    SUM(CASE WHEN Risk_Review_Flag = 'Yes' THEN 1 ELSE 0 END) AS Flagged_Tx,
    ROUND(100.0 * SUM(CASE WHEN Risk_Review_Flag = 'Yes' THEN 1 ELSE 0 END) / COUNT(Transaction_ID), 2) AS Risk_Flag_Rate_Pct,
    ROUND(SUM(CASE WHEN Risk_Review_Flag = 'Yes' THEN Amount_NGN ELSE 0 END), 2) AS Flagged_Volume_NGN
FROM transactions
GROUP BY Transaction_Type
ORDER BY Risk_Flag_Rate_Pct DESC;

--Question 4: Quelle est la contribution financière de chaque segment de clientèle ?
SELECT 
    c.Customer_Segment,
    COUNT(DISTINCT c.Customer_ID) AS Total_Customers,
    COUNT(t.Transaction_ID) AS Total_Transactions,
    ROUND(SUM(t.Amount_NGN), 2) AS Total_Volume_NGN,
    ROUND(AVG(t.Amount_NGN), 2) AS Avg_Tx_Value_NGN
FROM customers c
JOIN transactions t ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_Segment
ORDER BY Total_Volume_NGN DESC;

--Question 5: Dans quelle mesure le canal préféré des clients correspond-il au canal d'exécution réel ?
SELECT 
    c.Preferred_Channel,
    t.Channel AS Actual_Channel,
    COUNT(t.Transaction_ID) AS Transaction_Count,
    ROUND(SUM(t.Amount_NGN), 2) AS Total_Volume_NGN
FROM customers c
JOIN transactions t ON c.Customer_ID = t.Customer_ID
GROUP BY c.Preferred_Channel, t.Channel
ORDER BY c.Preferred_Channel, Transaction_Count DESC;

--Question 6: Quelles sont les villes principales en terme de volume financier et de taux de risque ?
SELECT 
    COALESCE(Location, 'Unknown') AS City_Location,
    COUNT(Transaction_ID) AS Total_Transactions,
    ROUND(SUM(Amount_NGN), 2) AS Total_Volume_NGN,
    SUM(CASE WHEN Risk_Review_Flag = 'Yes' THEN 1 ELSE 0 END) AS Risk_Flagged_Count,
    ROUND(100.0 * SUM(CASE WHEN Risk_Review_Flag = 'Yes' THEN 1 ELSE 0 END) / COUNT(Transaction_ID), 2) AS Risk_Rate_Pct
FROM transactions
GROUP BY City_Location
ORDER BY Total_Volume_NGN DESC;

--Question 7: Quel est le profil de risque et le montant moyen des transactions internationales ?
SELECT 
    International_Transaction,
    COUNT(Transaction_ID) AS Total_Tx,
    ROUND(SUM(Amount_NGN), 2) AS Total_Volume_NGN,
    ROUND(AVG(Amount_NGN), 2) AS Avg_Amount_NGN,
    SUM(CASE WHEN Risk_Review_Flag = 'Yes' THEN 1 ELSE 0 END) AS Risk_Flagged_Tx,
    ROUND(100.0 * SUM(CASE WHEN Risk_Review_Flag = 'Yes' THEN 1 ELSE 0 END) / COUNT(Transaction_ID), 2) AS Risk_Rate_Pct
FROM transactions
GROUP BY International_Transaction;

--Question 8: Quel est l'impact du niveau d'engagement digital sur l'activité transactionnelle du client ?
WITH Customer_Stats AS (
    SELECT 
        c.Customer_ID,
        c.Digital_Engagement_Score,
        CASE 
            WHEN c.Digital_Engagement_Score >= 80 THEN 'High Engagement (80-100)'
            WHEN c.Digital_Engagement_Score >= 50 THEN 'Medium Engagement (50-79)'
            ELSE 'Low Engagement (<50)'
        END AS Engagement_Level,
        COUNT(t.Transaction_ID) AS Tx_Count,
        SUM(t.Amount_NGN) AS Total_Spend
    FROM customers c
    LEFT JOIN transactions t ON c.Customer_ID = t.Customer_ID
    GROUP BY c.Customer_ID, c.Digital_Engagement_Score
)
SELECT 
    Engagement_Level,
    COUNT(Customer_ID) AS Total_Customers,
    ROUND(AVG(Tx_Count), 2) AS Avg_Tx_Per_Customer,
    ROUND(AVG(Total_Spend), 2) AS Avg_Spend_Per_Customer_NGN
FROM Customer_Stats
GROUP BY Engagement_Level
ORDER BY Avg_Spend_Per_Customer_NGN DESC;
