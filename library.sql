

create table books(Bookid int primary key,
                   Title varchar(60),
				   Author varchar(80),
				   Available_copies int not null default(1));

create table BorroweBooks(BorrowId int primary key,
                           MemberName varchar(70),
						   BorrowDate Date,
						   ReturnDate Date,
						   Bookid int,
						   foreign key (Bookid) references Books(Bookid));
						  
 select* from books
 select * from BorroweBooks


 insert into books values(101,'Python','Ville Parle',2),
                         (102,'CPP','Yogendra sharma',5),
						 (103,'youtube','Mr Beast',3),
						 (104,'Marketing','Mr Bishnoi',2),
						 (105,'sales','Mr j.j thomson',3),
	                     (106,'dairy','kalinga',2);


 insert into BorroweBooks values(111,'raj','01-13-2024','01-17-2024',101),
                                (112,'karan','02-22-2024','02-18-2024',102),
						       (113,'yodha','03-15-2024','03-19-2024',102),
						       (114,'ram','02-16-2024','02-22-2024',105),
						       (115,'harbajan','03-19-2024','03-24-2024',106),
	                           (116,'satya','03-23-2024','03-24-2024',104);
insert into BorroweBooks(BorrowId,Bookid) values(117,103);
insert into Books(Bookid,title,author,available_copies) values(107,'my books','j.j',4);




 select b.title ,b.bookid,bd.membername, bd.borrowdate from books b full join borrowebooks bd on b.bookid=bd.bookid;

 
 select b.title,b.author,bd.membername,bd.borrowdate from books  b inner join borrowebooks bd on b.bookid=bd.bookid;


select author from books where author like 'k%a';
alter table books add  price int;
update  books set price=120 where bookid=101;
update  books set price=170 where bookid=102;
update  books set price=220 where bookid=103;
update  books set price=100 where bookid=104;
update  books set price=190 where bookid=105;
update  books set price=320 where bookid=106;
update  books set price=520 where bookid=107;
select * from books

alter table books add copies_sold int; 
alter table books add published_year int;
update  books set copies_sold=15,published_year=2009 where bookid=101;
update  books set copies_sold=5,published_year=2021 where bookid=102;
update  books set copies_sold=11,published_year=2019 where bookid=103;
update  books set copies_sold=4,published_year=2010 where bookid=104;
update  books set copies_sold=25,published_year=2015 where bookid=105;
update  books set copies_sold=7,published_year=2022 where bookid=106;
update  books set copies_sold=10,published_year=2017 where bookid=107;


--a)Write a query to find the title and author of the book with the highest price.
select title,author, price from books where price=(select max(price) from books)

--b)Write a query to find the titles of books that have sold more copies than the average across all books.
select title,copies_sold  from  books where copies_sold >(select avg(copies_sold) from books);

--c)Write a query to calculate the average price of books that were published after the year 2020.
select avg(price) from books where published_year>2020;

--d)Write a query to find the title and author of the book with the highest price.
select title,author,price from books where price=(select max(price) from books);

--e) Find the Most Expensive Book with Uppercase Title and Author
SELECT top (1) upper(title), upper(author), price FROM Books  order  BY price DESC  ;

