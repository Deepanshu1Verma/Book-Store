SELECT
    p.PublisherID,
    p.PublisherName,
    SUM(od.Quantity * od.Price) AS TotalSales,
    SUM(od.Quantity * od.Price) / total.TotalBookstoreSales * 100 AS MarketSharePercentage
FROM
    OrderDetails od
INNER JOIN
    Books b ON od.BookID = b.BookID
INNER JOIN
    Publishers p ON b.PublisherID = p.PublisherID
CROSS JOIN
    (SELECT SUM(Quantity * Price) AS TotalBookstoreSales FROM OrderDetails) AS total
GROUP BY
    p.PublisherID, p.PublisherName, total.TotalBookstoreSales
ORDER BY
    MarketSharePercentage DESC;
