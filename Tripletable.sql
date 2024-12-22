
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50),
    BookID INT,
    FOREIGN KEY (BookID) REFERENCES Bookss(BookID)
);

CREATE TABLE Bookss (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Price DECIMAL(10, 2),
    PublishedYear INT
);


CREATE TABLE SaleOfBooks (
    SaleID INT PRIMARY KEY,
    BookID INT,
    SaleDate DATE,
    QuantitySold INT,
    FOREIGN KEY (BookID) REFERENCES Bookss(BookID)
);

INSERT INTO Bookss (BookID, Title, Price, PublishedYear) 
VALUES 
(1, 'The Great Adventure', 19.99, 2020),
(2, 'Data Science 101', 29.99, 2021),
(3, 'Mystery of the Night', 14.99, 2019),
(4, 'Finance for Everyone', 24.99, 2022),
(5, 'The Art of Coding', 34.99, 2021);
select * from bookss

INSERT INTO Authors (AuthorID, Name, Country, BookID) 
VALUES 
(11, 'John Doe', 'USA', 1),
(12, 'Jane Smith', 'UK', 2),
(13, 'Emily Johnson', 'Canada', 3),
(14, 'Michael Brown', 'Australia', 4),
(15, 'Laura White', 'Germany', 5);

INSERT INTO SaleOfBooks (SaleID, BookID, SaleDate, QuantitySold) 
VALUES 
(1, 1, '2024-01-15', 120),
(2, 2, '2024-02-20', 85),
(3, 3, '2024-03-05', 150),
(4, 4, '2024-04-18', 200),
(5, 5, '2024-05-22', 75);



SELECT 
    B.BookID,
    B.Title,
	B.price,
    A.Name AS AuthorName,
    A.Country,
    B.Price,
    S.SaleDate,
    S.QuantitySold
FROM 
    Authors A
JOIN 
    Bookss B ON A.BookID = B.BookID
JOIN 
    SaleOfBooks S ON B.BookID = S.BookID;





--Find the titles of books and the names of their authors along with the quantity sold
select b.title,a.name,s.quantitysold  from bookss b join authors a  on b.BookID=a.BookID join SaleOfBooks s on s.BookID=b.BookID;

--List the names of authors whose books have sold more than 100 copies.
select a.name,s.Quantitysold from  authors a join SaleOfBooks s on s.BookID=a.BookID where s.QuantitySold>100; 

--Get a list of all books, their authors, and their price, even if they have not been sold yet.
select b.title,a.name,b.price  from bookss b join authors a  on a.BookID=b.BookID right join SaleOfBooks s on s.BookID=a.BookID;


--Find the author(s) who have written books,books title that were sold the most in terms of quantity.
select a.Name ,b.title,max(s.QuantitySold) as MaxQtySold from authors a join Bookss b on b.BookID=a.BookID join SaleOfBooks s on s.BookID=a.BookID
GROUP BY a.Name, b.Title;

--Find the title of the book that was sold on the most recent sale date

select title,price from Bookss where bookid=(select bookid from saleofbooks where  SaleDate=(select max(saledate) from saleofbooks))

--List all authors along with the total number of books sold for each, including authors who have not sold any books.
select name from author where bookid=(select bookid from authors  where bookid=(select bookid from saleofbooks group by Quantitysold))

--Find the title and author name of books that were sold more than 100 times in total
SELECT b.Title, a.Name  FROM Bookss b JOIN Authors a ON a.BookID = b.BookID WHERE b.BookID IN (SELECT BookID FROM SaleOfBooks WHERE QuantitySold > 100);


 