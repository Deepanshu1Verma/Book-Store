WITH RankedBooks AS (
    SELECT
        b.*,
        g.GenreName,
        ROW_NUMBER() OVER (PARTITION BY g.GenreName ORDER BY b.StockQuantity DESC) AS Ranking
    FROM
        Books b
        JOIN Genres g ON b.GenreID = g.GenreID
)
SELECT
    BookID,
    ISBN,
    Title,
    AuthorID,
    GenreID,
    PublisherID,
    PublicationDate,
    Price,
    StockQuantity,
    GenreName
FROM
    RankedBooks
WHERE
    Ranking <= 3;
