SELECT
    b.BookID,
    b.Title,
    AVG(r.Rating) AS AvgRating,
    COUNT(o.OrderDetailID) AS TotalSales
FROM
    Books b
INNER JOIN
    Reviews r ON b.BookID = r.BookID
LEFT JOIN
    OrderDetails o ON b.BookID = o.BookID
GROUP BY
    b.BookID, b.Title
HAVING
    AVG(r.Rating) >= 4.5 -- High ratings threshold
    AND COUNT(o.OrderDetailID) < 100; -- Low sales threshold


