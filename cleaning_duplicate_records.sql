use sales;
select distinct (sales.transactions.currency) from sales.transactions;
-- 'INR'
-- 'USD'
-- 'INR\r'
-- 'USD\r'
select count(*) from sales.transactions where sales.transactions.currency='INR\r';
select count(*) from sales.transactions where sales.transactions.currency='USD\r';

describe sales.transactions;

-- finding duplicate records
select sales.transactions.customer_code, sales.transactions.market_code, sales.transactions.order_date, sales.transactions.product_code, sales.transactions.sales_amount, sales.transactions.sales_qty, count(*) from sales.transactions where sales.transactions.currency='INR' or sales.transactions.currency='INR\r'   group by sales.transactions.customer_code, sales.transactions.market_code, sales.transactions.order_date, sales.transactions.product_code, sales.transactions.sales_amount, sales.transactions.sales_qty having count(*) > 1;
select sales.transactions.customer_code, sales.transactions.market_code, sales.transactions.order_date, sales.transactions.product_code, sales.transactions.sales_amount, sales.transactions.sales_qty, count(*) from sales.transactions where sales.transactions.currency='USD' or sales.transactions.currency='USD\r'   group by sales.transactions.customer_code, sales.transactions.market_code, sales.transactions.order_date, sales.transactions.product_code, sales.transactions.sales_amount, sales.transactions.sales_qty having count(*) > 1;
