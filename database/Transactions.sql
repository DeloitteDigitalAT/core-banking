CREATE TABLE TRANSACTION
(
TRANS_ID BIGINT GENERATED ALWAYS AS IDENTITY (START WITH 10000),
ACCOUNT_ID VARCHAR (20),
ACCOUNT_IBAN VARCHAR (20),
TYPES VARCHAR (20),
AMOUNT DECIMAL(19,2),
BALANCE DECIMAL(19,2),
TRANSACTION_DATE DATE
);

INSERT INTO TRANSACTION ( ACCOUNT_ID,ACCOUNT_IBAN, TYPES, AMOUNT, BALANCE, TRANSACTION_DATE)
VALUES
('00638932','AT00638932','Credit',8779.6,4598.28,'2001-11-18'),
('22286356','AT22286356','Credit',1374.57,1374.57,'2012-11-24'),
('22286356','AT22286356','Debit',396.94,977.63,'2016-04-06' ),
('02286356','AT02286356','Debit',6785.77,9973.41,'2012-04-18'),
('12286356','AT12286356','Credit',751.85,5053.56,'2012-12-12'),
('12286356','AT12286356','Credit',7936.72,12990.28,'2011-12-14'),
('12286356','AT12286356','Credit',8243.83,21234.11,'2012-03-09'),
('00638932','AT00638932','Credit',9764.5,14362.78,'2012-10-07'),
('12286356','AT12286356','Credit',743.7,21977.81,'2015-02-10'),
('00286356','AT00286356','Debit',4546.8,8005.52,'2012-04-09'),
('12286356','AT12286356','Debit',9138.0,12839.81,'2015-07-13'),
('02286356','AT02286356','Debit',287.7,949.02,'2018-04-29'),
('12286356','AT12286356','Debit',8885.1,3954.71,'2016-06-16'),
('00000635','AT00000635','Debit',6796.2,9856.55,'2012-01-22'),
('00000635','AT00000635','Debit',5077.31,4779.55,'2020-12-20'),
('00286356','AT00286356','Debit',6976.54,1028.95,'2017-06-03'),
('12286356','AT12286356','Debit',787.94,3166.77,'2018-10-02'),
('02286356','AT02286356','Credit',8595.95,9544.97,'2021-06-10'),
('00000635','AT00000635','Debit',1507.79,3271.79,'2021-11-06'),
('00286356','AT00286356','Credit',9057.91,10086.89,'2017-03-29'),
('22286356','AT22286356','Credit',6236.39,7214.02,'2017-12-10'),
('12286356','AT12286356','Credit',2459.63,5626.4,'2020-01-14'),
('00638932','AT00638932','Credit',7624.24,21987.02,'2014-04-17'),
('22286356','AT22286356','Debit',876.5,6337.52,'2017-11-14');