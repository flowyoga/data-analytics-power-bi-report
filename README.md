# Data Analytics Power BI Report

### Data Ingestion Steps 

* Orders - The data was retrieved from an Azure SQL database. The Card Number column was removed and the date columns (Order Date and Shipping Date) were split into date and time columns. 
* Products - The data was imported from a csv file. Duplicates in the Product Code column were removed. 
* Stores - The data was imported from Azure Blob Storage.  
* Customers - 3 csv files in Customers.zip were imported. 

### Data Model Steps

* Date table was created based on the earliest date in Order Date column and the latest date in the Shipping Date column.
* Relationships - The following relationships were created to form a star schema: 
  - Products[Product Code] to Orders[Product Code]
  - Stores[Store Code] to Orders[Store Code]
  - Customers[User UUID] to Orders[User ID]
  - Date[date] to Orders[Order Date]
  - Date[date] to Orders[Shipping Date] 

  Date[date] to Orders[Shipping Date] is currently inactive as Power BI allows only one active relationship between tables at a time. 

* Measures Table was created. 
* Additionally, the following measures were created: 
  - Total Orders : the number of orders in Orders table.
  - Total Revenue : Orders[Product Quantioty] times Products[Sales Price].
  - Total Profit: Sum of ((Products[Sale Price]-Products[Cost Price]) times Orders[Product Quantity]).
  - Total Customers : The number of unique customers in the Orders table.
  - Total Quantity: The sum of the number of items sold in the Orders table. 
  - Profit YTD: Total profit of the current year
  - Revenue YTD: Total revenue of the current year 
*  Date/Geography Hierarchies and Cleanups 
  - Date Hierarchy using:
    - Start of Year
    - Start of Quarter
    - Start of Month
    - Start of Week
    - Date
  - Country Column was added based on Stores[Coutry Code]:
    - GB: United Kingdom
    - US: United States
    - DE: Germany
  - Geography column was added by concatenating Stores[Country Region] and Stores[Country].
  - Typos in Region column were corrected.
  - Geography Hierarchy was created using:
    - Region
    - Country
    - Country Region

### Reports 
#### Customer Detail Page 

* Card Visuals 
  - Unique Customers: displays Total Customers.
  - Revenue Per Customer: displays Total Revenue measure divided by Total Customers.
* Donut Chart
  - Total Customer by Country: created based on Users[Country] vs. Total Customer measure.

    Please note that there are 6 users that appear in Users table, but not in Customers table. These users are in Blank Category. 
* Column Chart 
  - Total Customers by Category:  created using Products[Category] to filter the Total Customers measure.
* Line Chart 
  -  Total Customers: displays Total Customers vs Dates. The drill-down feature is enabled up to the month level. There is also a trend line that forecasts the next 10 points with a 95% confidence interval.
* Table 
  - Top 20 Customers: displays the top 20 customers by revenue. Data bars are enabled in Revenue column. 

  Please note that as there are 6 users that do exist in Users table but not in Customers table. When the User ID column is not used in aggregation, these 6 are grouped into one and appear in the table, which is incorrect.  
* Additional Card  
  - Top Customer, Top Customer's Revenue, Top Customer's Total No of Orders:  displays the top customer's name, revenue and total number of orders.  

#### Executive Summary Page 

* Card Visuals 
  - Total Revenue: displays Total Revenue.
  - Total Orders: displays Total Orders.
  - Total Profit: displays Total Profit.
* Line Chart 
  -  Total Revenue: displays Total Revenue vs Dates. The drill-down feature is enabled up to the month level.
* Donut Charts
  - Total Revenue by Country: created based on Store[Country] vs. total revenue. 
  - Total Revenue by Store Type: created based on Store[Store Type] vs. total revenue.
* Bar/Column Chart 
  - Total Orders by Category:  created based on Products[Category] vs. total orders.
* KPI Visuals
  - Quarterly Profit: displays total profit against target profit (5% growth from the previous quarter's profit).
  - Quarterly Orders: displays total orders against target orders (5%  growth from the previous quarter's orders)
  - Quarterly Revenue: displays total revenue against target revenue (5% growth from the previous quarter's revenue)

