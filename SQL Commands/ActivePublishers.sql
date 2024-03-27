SELECT
    YEAR(b.PublicationDate) AS PublicationYear,
    p.PublisherID,
    p.PublisherName,
    COUNT(b.BookID) AS TotalBooksPublished
FROM
    Books b
INNER JOIN
    Publishers p ON b.PublisherID = p.PublisherID
GROUP BY
    PublicationYear, p.PublisherID, p.PublisherName
ORDER BY
    PublicationYear, TotalBooksPublished DESC;
