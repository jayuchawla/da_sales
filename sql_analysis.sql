-- basic select
select * from sales.customers;
select * from sales.transactions;
select * from sales.products;
select * from sales.markets;
select * from sales.date;

-- count rows
select count(*) from sales.customers;
select count(*) from sales.products;
select count(*) from sales.transactions;

-- have a look at some transactions
select * from sales.transactions limit 5;
-- have a look at number of transactions made for market code Mark011 (Nagpur)
select count(*) from sales.transactions where sales.transactions.market_code='Mark011';

-- have a look if INR is the only currency applicable
select sales.transactions.currency, count(*) from sales.transactions group by sales.transactions.currency;

-- have a look at disticnt years for which sales data is available
select sales.date.year, count(*) from sales.date group by sales.date.year;

-- have a look for number of trnasactions done in 2020
-- join date and transation tables
select count(*) from sales.transactions inner join sales.date on sales.transactions.order_date=sales.date.date where sales.date.year=2020;

-- have a look at total revenue generated for each year
-- first look if any transaction for 2020 involves USD
select * from sales.transactions inner join sales.date on sales.transactions.order_date=sales.date.date where sales.date.year=2020 and sales.transactions.currency='USD';
-- no 2020 transactions in USD
select sales.date.year, sum(sales.transactions.sales_amount) from sales.transactions inner join sales.date on sales.transactions.order_date=sales.date.date group by sales.date.year;
-- have a look at total revenue generated for each year for market code Mark011 (Nagpur)
select sales.date.year, sum(sales.transactions.sales_amount) from sales.transactions inner join sales.date on sales.transactions.order_date=sales.date.date where sales.transactions.market_code='Mark011' group by sales.date.year;

-- have a look at popularity of products for market code Mark011 (Nagpur)
select sales.transactions.product_code, count(*) as count_prods from sales.transactions where sales.transactions.market_code='Mark011' group by sales.transactions.product_code order by count_prods desc;

-- have a look at revenue generated from cutomers 
select sales.customers.custmer_name, sum(sales.transactions.sales_amount) as total_sale_amount from sales.transactions inner join sales.customers on sales.transactions.customer_code=sales.customers.customer_code group by sales.transactions.customer_code order by total_sale_amount desc;

