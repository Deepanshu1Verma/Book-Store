SELECT
    b.BookID,
    b.ISBN,
    b.Title,
    b.AuthorID,
    b.GenreID,
    b.PublisherID,
    b.PublicationDate,
    b.Price,
    b.StockQuantity
FROM
    Books b
INNER JOIN
    OrderDetails od ON b.BookID = od.BookID
WHERE
    b.StockQuantity < (SELECT AVG(StockQuantity) FROM Books)
    AND (SELECT COUNT(*) FROM OrderDetails WHERE BookID = b.BookID) > 50;
