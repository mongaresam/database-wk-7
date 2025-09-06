-- quiz 1
USE salesdb; 
SELECT OrderID, CustomerName, 'Laptop' AS Product
FROM ProductDetail WHERE OrderID = 101
UNION ALL
SELECT OrderID, CustomerName, 'Mouse'
FROM ProductDetail WHERE OrderID = 101
UNION ALL
SELECT OrderID, CustomerName, 'Tablet'
FROM ProductDetail WHERE OrderID = 102
UNION ALL
SELECT OrderID, CustomerName, 'Keyboard'
FROM ProductDetail WHERE OrderID = 102
UNION ALL
SELECT OrderID, CustomerName, 'Mouse'
FROM ProductDetail WHERE OrderID = 102
UNION ALL
SELECT OrderID, CustomerName, 'Phone'
FROM ProductDetail WHERE OrderID = 103;

- quiz 2
-- Orders table (Customer depends only on OrderID)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- OrderDetails table (Product depends on full key OrderID+Product)
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert into Orders
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert into OrderDetails_2NF
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);