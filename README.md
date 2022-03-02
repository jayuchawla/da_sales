# da_sales
## Project Title
#### Analysing Sales for AtliQ Hardware

## Problem Statement
#### AtliQ Hardware, a computer hardware and peripheral manufacturer which supplies hardware and peripherals to it's clients.
#### Head Office: New Delhi
#### Regional Offices: North, East, South, West (Pan India)
#### Challenges faced by Sales Director (Head Office):
- Due to dynamic market growth issues are faced in terms of sales tracking.
- Issues with business insights.
- Regional Managers present a sugar-coated picture of respective regional salesto the Sales Director, in form of humongous excel files.

## Project Planning & Data Discovery
#### Aim's Grid
[Definition](https://www.leadership-elearning.com/courses/aims-grid/#:~:text=The%20Aim%E2%80%99s%20Grid%20is%20a%20central%20tool%20for,hence%20lay%20the%20foundation%20for%20a%20successful%20implementation.)
1.  Purpose: To unlock sales insights (not visible before) for sales team for decision support & automate those to reduce manual time spent in data gathering.
2.  Stakeholders: 
    -   Sales Director
    -   Marketing Team
    -   Customer Service Team
    -   Data & Analytics Team
    -   IT
3.  End Result: An automated dashboard providing quick & latest insights in order to support data driven decision making.
4.  Success Criteria: 
    -   Dashboards uncovering sales order insights with latest available data.
    -   Sales team able to take better decisions & prove 10% cost savings of total spends.
    -   Reduce data gatering for Sales analysts in order to save 20% of business time and reinvest it in value added activity. 

#### Data Discovery
-   The regional sales data (aggregated using sales systems) is stored in database instance (OLTP, mysql) and is owned by IT Team.
-   It is the job of the data and analytics team to reach out to IT team and ask them for data.

#### _Tip_:
-   Heavy and complex querying an OLTP instance may affect its performance.
-   Hence data warehouses are built (OLAP).
-   Data Engineers are responsible for handling OLAP(s).
-   ETL: the process of reformatting OLTP data in a way that it is best for performing analytical queries.
-   Some ETL tools:
    -   Apache Nifi
    -   Informatica
    -   Talend
    -   Python (pandas)

## SQL Analysis
-   Analyse basic structure of each table.
-   Look out for anamolies or values of concern (for e.g. few transacations in our analysis are also done in USD).
-   Check for interesting aggreagates (sum, avg, count) with and without joining tables. 

## Data Cleaning & ETL
-   A good observation is that there are duplicate rows in transactions table with difference in currency values though (INR, INR\r and USD, USD\r), a query to identify this is:
    - select sales.transactions.customer_code, sales.transactions.market_code, sales.transactions.order_date, sales.transactions.product_code, sales.transactions.sales_amount, sales.transactions.sales_qty, count(*) from sales.transactions group by sales.transactions.customer_code, sales.transactions.market_code, sales.transactions.order_date, sales.transactions.product_code, sales.transactions.sales_amount, sales.transactions.sales_qty having count(*) > 1;
-   Load data in PowerBI
-   Extracted Schema diagram:
    ![star_schema](https://user-images.githubusercontent.com/35540277/155880019-8a48a8d1-6174-4acf-8ce5-166b7c3c32fc.png)
-   Clean & Transform Data:
    -   Zone 'not equal' to blank
    -   Only allow those transactions which have sales_amount 'greater than equal to' 1   
    -   It is found that records with currency='INR\r' >> currency='INR', consider records which have currency as INR\r and USD\r (each record with currency='INR' has a duplicate entry with currency='INR\r' vice versa not true though, same applies for USD\r and USD)
    -   Normalize sales amount to INR (multiply normalize factor by sales_amount)

## Building Dashboard (PowerBI)
-   Card visual for Revenue and Sales Qty
-   List visual for selecting Year
-   List visual for selecting Month
-   Line chart visual for Revenue trend
-   Stacked Bar chart visual for Revenue by market region
-   Stacked Bar chart visual for Sale quantity by market region
-   Stacked Bar chart visual for Top products by Revenue
-   Stacked Bar chart visual for Top customers by Products
-   ![report](https://user-images.githubusercontent.com/35540277/155890884-c7e5df4d-09fe-48a0-8527-c59e2d480cd4.png)

## Feedback
-   Bug: evaluation of revenue considers sales_amount, it should rather have considered normalized_sales_amount
-   Include a visual for overall profit margin
-   Include a visual for profit margin by markets
-   Just profit percentage does not give a clear picture, have a visual for contribution percentage to total profit margin by markets
-   A table with total revenue, revenue contribution %, profit margin contribution %, profit margin % _instead of a stacked chart of top 5 cutomers by reveue_.
-   Have a Customer Type distribution by Revenue using pie-chart.
-   Have a dynamic Performance Insights.
    -   Have bar chart for Revenue by zone, Revenue Contribution % by zone


## Extra Inferences from post plotting Feedback visuals
-   Inferring from Profit % Mesaure: _Delhi though gets you higher revenue values, but Bhuvaneshwar tops the list for profit percentage for the year 2020._
-   Inferring from Profit Margin Contribution Percentage Measure: _Mumbai is the highest contributor to overall profit margin for year 2020, although Delhi region has the highest revenue for the same year._
-   Inferring from table visual: _Though Electricalsara Stores provides you with a profit margin% of 0.37%, but the profit margin contribution in overall profit margin is quite high (11.92%) (this is due to high sales volume made to Electricalsara Stores, if they give you loads of orders which will raise their profit margin contribution you give them loads of discount hence low profit margin%)._
-   Lucknow has negative profit %, clicking on it then referring the table will allow you to view stores within Lucknow, there is only one named as Insight and hence sales director can decide to not continue business with this store or negotiate the sell value or increase the sales volume.
-   Inferring from Customer Type distribution by Revenue pie-chart: _High revenue is generated from Brick & Mortar cutomer type as compared to E-Commerce._
-   Inferring from Revenue by zone, Revenue Contribution % by zone: 
    -   _North zone contributes to highest revenue._
    -   _Though South Zone is the least contributor to Revenue Contribution % (4.61%), but due to Surge Stores' high(inferring from table) Profit Margin Contribution % (11.95%) the metric value soars high for South zone too (18.51%). In simple terms: The biggest reason business is still being continued in South Zone is Surge Stores!!_
-   

## Credits
-   Data Dump: https://github.com/codebasics/DataAnalysisProjects/blob/master/1_SalesInsights/db_dump.sql
