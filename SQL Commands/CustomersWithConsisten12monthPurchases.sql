SELECT
    CustomerID,
    AVG(TotalAmount) AS AvgMonthlyPurchase
FROM
    Orders
WHERE
    OrderDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
GROUP BY
    CustomerID,
    YEAR(OrderDate),
    MONTH(OrderDate)
HAVING
    COUNT(*) >= 12; -- Ensure there are purchases for all 12 months
