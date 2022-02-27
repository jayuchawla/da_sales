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
-   Load data in PowerBI
-   Extracted Schema diagram:
    ![star_schema](https://user-images.githubusercontent.com/35540277/155880019-8a48a8d1-6174-4acf-8ce5-166b7c3c32fc.png)

## Credits
-   Data Dump: https://github.com/codebasics/DataAnalysisProjects/blob/master/1_SalesInsights/db_dump.sql
