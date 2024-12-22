create table product(
product_id varchar(100) not null,
p_name varchar(100),
quantity int,
price decimal(10,2),
godown_no varchar(10));

insert into product(product_id,p_name,quantity,price,godown_no) values
('P1','Noodles',70,20.00,'A');
INSERT INTO product(product_id, p_name, quantity, price, godown_no) VALUES
('P2', 'Biscuits', 50, 10.00, 'B'),
('P3', 'Juice', 100, 30.00, 'A'),
('P4', 'Rice', 200, 40.00, 'C'),
('P5', 'Oil', 150, 100.00, 'D'),
('P6', 'Flour', 180, 25.00, 'B'),
('P7', 'Soap', 120, 15.00, 'C'),
('P8', 'Shampoo', 90, 50.00, 'D'),
('P9', 'Milk', 75, 20.00, 'A'),
('P10', 'Sugar', 110, 45.00, 'B');

select * from product;

create table sales(
product_id varchar(100),
transaction_id varchar(40) not null,
quant_sold int,
mode_of_payment varchar(70));

insert into sales(product_id,transaction_id,quant_sold,mode_of_payment)
values('P1','T1',30,'Credit Card');
INSERT INTO sales(product_id, transaction_id, quant_sold, mode_of_payment) VALUES
('P2', 'T2', 20, 'Cash'),
('P1', 'T3', 15, 'UPI'),
('P3', 'T4', 50, 'UPI'),
('P4', 'T5', 100, 'Net Banking'),
('P1', 'T6', 10, 'Cash'),
('P5', 'T7', 70, 'Credit Card'),
('P6', 'T8', 40, 'UPI'),
('P8', 'T9', 30, 'UPI'),
('P3', 'T10', 20, 'Net Banking');

select * from sales;
update sales set quant_sold=30 where transaction_id='T2';

delete sales where transaction_id='T10';

alter table sales add new_column varchar(100);

alter table sales drop column new_column;

alter table sales add constraint p_key primary key(transaction_id);
alter table sales drop p_key;

alter table sales drop constraint chk;

alter table sales add constraint chk check(quant_sold>0);

alter table product add constraint pkey primary key(product_id);

alter table sales add constraint fkey foreign key(product_id) references product(product_id);

alter table sales drop constraint fkey;

exec sp_rename 'product.quantity','quantity_avl','column';

select * from products;

exec sp_rename 'product','products';

--product tht never sold
select p_name from products where product_id not in (select distinct(product_id) from sales);

--list quant where quantity sold is greater than avail_quantity

select * from sales where quant_sold>(select quantity_avl from products where products.product_id=sales.product_id);

--find product name with highest quantity avl

select p_name from products where quantity_avl=(select max(quantity_avl) from products);

--list products whose price is higher than the average price of all products

select p_name,price from products where price>(select avg(price) from products);

--find products which are sold more than once

select product_id,count(product_id) from sales group by product_id having count(transaction_id)>1;

--retrieve product name of product sold in transaction t4

select p_name from products where product_id=(select product_id from sales where transaction_id='T4');

--list the mode of payment for product priced over 50
select mode_of_payment from sales where product_id=(select product_id from products where price>50.00);

--find the total qty sold for products stored in godown a
 select  sum(quant_sold) from sales where product_id in(select product_id from products where godown_no='A');

 --find the cheapest product which have been sold
 select p_name, price from products where product_id=(select top 1 product_id from sales order by price  asc );

 --find products name sold through cash transactions
 select p_name from products where product_id in (select product_id from sales where mode_of_payment='Cash');

 --nested queries
 --find products that have been sold using more than two different modes of payments
 select product_id from sales group by product_id having count(distinct(mode_of_payment))>2;

 --list product id that are both sold and stored in godown b
 select distinct(product_id) from sales where product_id in(select product_id from products where godown_no='B');

 --retrieve transaction id of products sold whose price is below 25
 select transaction_id from sales where product_id in(select product_id from products where price<25);

 --find total revenue generated from godown c
select sum(s.quant_sold*p.price) as total_revenue from sales s join products p on s.product_id=p.product_id where p.godown_no='C';

--list all the products that has been sold once along with their quantity sold
select p.p_name,sum(s.quant_sold) from products p join sales s on s.product_id=p.product_id group by p_name;

--find the transaction id for the sale with maximum quantity sold

 select transaction_id from sales where quant_sold=(select max(quant_sold) from sales );

 --list products that are never stored in godown d
 select p_name from products where product_id  in(select distinct(product_id) from sales where godown_no not in ('C'));

 --find heighest price among sold products
 select max(price) from products where product_id in(select product_id from sales )

 --find products that weeresold using only one moded of payment
 select product_id from sales group by product_id having count(distinct(mode_of_payment))=1;

 --joins
 select * from products p left join sales s on  s.product_id=p.product_id;

 --find product names and total quantities sold for each product
 select p.p_name,sum(quant_sold) from products p join sales s on s.product_id=p.product_id group by p.p_name; 

 --list products along with transaction id
 select p_name, transaction_id from products join sales on sales.product_id=products.product_id;

 --retrieve mode of payment for products stored in godown A
 select mode_of_payment from sales join products on products.product_id=sales.product_id where godown_no='A';

 --find products that have not been sold yet using left join
  select p_name from products left  join sales on sales.product_id=products.product_id where sales.product_id is NULL;

  --list all godowns along with total revenue generated from each godown
  select godown_no,sum(quant_sold*price) as total_revenue from products join sales on sales.product_id=products.product_id group by godown_no;

  --retrieve name of products sold in multiple godowns
  select p_name from products left join sales on products.product_id =sales.product_id where godown_no in ('A','B','C','D');


  -- find all transactions details for products priced above 40
  select * from sales join products on products.product_id=sales.product_id where price>40;

  -- find products whose name starts with s
  select p_name from products where p_name like 's%';

  --list transcations having name as card
  select transaction_id from sales where mode_of_payment like '%card%' or mode_of_payment like'%card';

  --find products whose name ends with e
  select p_name from products where p_name like '%e';

  --retrieve  products swith 5 characyter name
  select p_name from products where p_name like '_____';

  --find all modes of payment containing 'net'
  select mode_of_payment from sales where mode_of_payment like '%net%';

  --retrive product havibg second letter as o;
  select p_name from products where  p_name like '_o%';

  --find transactions ids with ids ending in 3
  select transaction_id from sales where transaction_id like '%3';

  --list product names with a space in them
  select mode_of_payment from sales where mode_of_payment like '% %';

  --find products whose name contains oo
  select p_name from products where p_name like '%oo%';

  --iterate over all products and print product anme and quntiy
  DECLARE @p_name NVARCHAR(100);
DECLARE @quantity_avl INT;
  declare product_cursor cursor for select p_name,quantity_avl from products;
  open product_cursor;
  fetch next from product_cursor into @p_name , @quantity_avl;
   while @@fetch_status=0
   begin 
   print 'product :' +@p_name + 'Quantity avl : '+ cast (@quantity_avl as nvarchar);
   fetch next from product_cursor into @p_name,@quantity_avl;
   end;

   close product_cursor;
   deallocate product_cursor;

   --iterate over sales record to calculate over total revenue of each transaction
  
   declare @transaction_id nvarchar(20);
   declare @quant_sold int;
   declare @price decimal(8,2);
   declare @total_revenue decimal(10,2);
   declare revnue_cursor cursor for select transaction_id,quant_sold,price from sales join products on sales.product_id=products.product_id;
   open revnue_cursor
   fetch next from revnue_cursor into @transaction_id, @quant_sold, @price;

   while @@FETCH_STATUS=0
   begin
   set @total_revenue=@quant_sold*@price;
   PRINT 'Transaction: ' + @transaction_id + ', Revenue: ' + CAST(@total_revenue AS VARCHAR);
   FETCH NEXT FROM revnue_cursor INTO @transaction_id, @quant_sold, @price;

END;


--retrieve and predict all products stored in godown A

DECLARE @p_name VARCHAR(50); 
DECLARE godown_cursor CURSOR FOR 
SELECT p_name 
FROM products 
WHERE godown_no = 'A'; 
OPEN godown_cursor;

FETCH NEXT FROM godown_cursor INTO @p_name; 

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Product: ' + @p_name; 
    FETCH NEXT FROM godown_cursor INTO @p_name; 
END;


--Iterate over sales records to calculate total revenue for each mode of payment.

declare @mode_of_payment varchar(20);
declare @total_revenue decimal(10,2);

declare my_cc cursor for select mode_of_payment , sum(quant_sold * price) as total_revenue from products join sales on sales.product_id=products.product_id group by mode_of_payment;

open my_cc
fetch next from my_cc into @mode_of_payment,@total_revenue;

while @@fetch_status=0
begin
print 'mode_of_payment : ' + @mode_of_payment +', total revenue : '+ cast(@total_revenue as varchar);
fetch next from my_cc into @mode_of_payment,@total_revenue;
end


--trigger
--Create a trigger to log every new product added to the product table.

create trigger log_p on products after insert as
begin
insert into products(product_id,p_name) select product_id,p_name from inserted
end;
insert into products(product_id,p_name) values('P17','my_prod');

--create trigger to update qty

create trigger update_sales on sales after insert as
begin
UPDATE products
    SET quantity_avl = quantity_avl - i.quant_sold
    FROM products p
    INNER JOIN inserted i ON p.product_id = i.product_id;
end;

--Write a trigger to prevent inserting a product into the product table if its price is less than or equal to zero.

create trigger prevent on products after insert as
begin
    IF EXISTS (SELECT * FROM inserted WHERE price <= 0)
    BEGIN
        RAISERROR ('Price must be greater than zero.', 16, 1);
        ROLLBACK;
    END
    ELSE
    BEGIN
        INSERT INTO product (product_id, p_name, quantity, price, godown_no)
        SELECT product_id, p_name, quantity_avl, price, godown_no
        FROM inserted;
    END
END;

--Create a trigger to log whenever a product's price is updated in the product table, including the product_id, old price, and new price in the product_log table.

create trigger up_price on products after update as
begin
IF UPDATE(price)
    BEGIN
        INSERT INTO products(product_id, p_name)
        SELECT d.product_id, d.p_name, 
               'Price updated from ' + CAST(d.price AS NVARCHAR) + 
               ' to ' + CAST(i.price AS NVARCHAR), 
               GETDATE()
        FROM deleted d
        INNER JOIN inserted i ON d.product_id = i.product_id;
    END
END;


CREATE TRIGGER prevent_product_deletion
ON products
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM deleted WHERE quantity_avl> 0)
    BEGIN
        RAISERROR ('Cannot delete products with quantity greater than zero.', 16, 1);
        ROLLBACK;
    END
    ELSE
    BEGIN
        DELETE FROM product
        WHERE product_id IN (SELECT product_id FROM deleted);
    END
END;
--

CREATE TRIGGER prevent_product_deletion
ON products
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM deleted WHERE quantity_avl > 0)
    BEGIN
        PRINT 'Cannot delete products with quantity greater than zero.';
        ROLLBACK;
    END
    ELSE
    BEGIN
        DELETE FROM products
        WHERE product_id IN (SELECT product_id FROM deleted);
    END
END;

