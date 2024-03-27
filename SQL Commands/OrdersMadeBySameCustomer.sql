SELECT od.*, o.TotalAmount
            FROM OrderDetails od
            JOIN Orders o ON od.OrderID = o.OrderID
            WHERE o.CustomerID = 1 order by  TotalAmount desc;