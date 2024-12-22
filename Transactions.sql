
--commit( permanently saving )/rollback( if some system failures happens it will rollback or reflect changes whatever done) in transactions
--operations in transactions(read/write)

--whatever operations is performed stored temporarily in buffer , after commiting it will saved

create table accounts (account_id varchar(20) primary key,
                       account_holder varchar(100),
					   balance decimal(10,2) not null check(balance>=0),
					   created_at DATEtime Default current_Timestamp
					   );

select * from accounts;

create table transactions (transaction_id int identity primary key,
                           from_account varchar(20) not null,
						   to_account varchar(20) not null,
						   amount decimal(10,2) not null check(amount>0),
						   transaction_date datetime default current_timestamp,
						   status varchar(40) check(status  in ('COMMITTED','ABORTED')),
						   foreign key (from_account) references accounts(account_id),
						   foreign key (to_account) references accounts(account_id));

select * from transactions;

insert into accounts(account_id,account_holder,balance) values('A001','Rajat',1000),
                            ('A002','Ram',700),
							('A003','Rahul',1200);

insert into transactions(from_account,to_account,amount,status) values('A001','A002',100,'COMMITTED'),
                                                                      ('A001','A003',200,'COMMITTED'),
																	  ('A002','A003',160,'COMMITTED'),
																	  ('A003','A001',150,'COMMITTED');

--update
update accounts set balance =balance-100 where account_id='A001';
update accounts set balance =balance+100 where account_id='A002';
update accounts set balance =balance-200 where account_id='A001';
update accounts set balance =balance+200 where account_id='A003';
update accounts set balance =balance-160 where account_id='A002';
update accounts set balance =balance+160 where account_id='A003';
update accounts set balance =balance-150 where account_id='A003';
update accounts set balance =balance+150 where account_id='A001';

--begin transactions
begin transaction;
update accounts set balance=balance-300 where account_id='A002';
update accounts set balance=balance+300 where account_id='A003';
save transaction transfer1;


commit transaction;
begin transaction;
UPDATE accounts SET balance = balance - 300 WHERE account_id = 'A002';
UPDATE accounts SET balance = balance + 300 WHERE account_id = 'A003';
 save transaction Transfer1;
rollback transaction;


rollback transaction;

select * from accounts;
select * from transactions;

