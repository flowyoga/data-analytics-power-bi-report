# Data Analytics Power BI Report

### Data Ingestion Steps 

* Orders - The data was retrieved from an Azure SQL database. Card Number column was removed and dates columns (Order Date and Shipping Date) were splitted into date and time columns. 
* Products - The data was imported from a csv file. Duplicates in Product Code column were removed. 
* Stores - The data was imported from an Azure's Blob Storage.  
* Customers - 3 csv files in Customers.zip were imported. 

### Data Model Steps

* Date table was created based on the earliest date in Order Date column and the latest date in Shipping Date column.
* The following relationships were created to form a star schema. 
  - Products[Product Code] to Orders[Product Code]
  - Stores[Store Code] to Orders[Store Code]
  - Customers[User UUID] to Orders[User ID]
  - Date[date] to Orders[Order Date]
  - Date[date] to Orders[Shipping Date] 

Date[date] to Orders[Shipping Date] is currently inactive as Power BI allows only one active relationship between tables at a time. 

* Measures Table was created. 
* Also following measures were created: 
 - Total Orders : the number of orders in Orders table 
 - Total Revenue : Orders[Product Quantioty] times Products[Sales Price]
 - Total Profit: Sum of ((Products[Sale Price]-Products[Cost Price]) times Orders[Product Quantity])
 - Total Customers : unique customers in the Orders table 
 - Total Quantity: sums of the number of items sold in the Orders table 
 - Profit YTD: Total profit of the current year
 - Revenue YTD: Total revenue of the current year 
*  Date/Geography Hierarchies and cleanups 
 - Date Hierarchy using 
    - Start of Year
    - Start of Quarter
    - Start of Month
    - Start of Week
    - Date
  - Country Column was added based on Stores[Coutry Code]
    - GB: United Kingdom
    - US: United States
    - DE: Germany
  - Geography column was added by concatenating Stores[Country Region] and Stores[Country]
  - Typos in Region column were corrected
  - Geography Hierarchy was created using
    - Region
    - Country
    - Country Region

    
