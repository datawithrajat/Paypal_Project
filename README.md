# PayPal Transaction Analysis using SQL

## Project Overview
This project analyzes transaction data from a PayPal-like digital payment platform using SQL. The analysis focuses on understanding transaction patterns, identifying high-performing markets, evaluating merchant performance, and detecting high-value transactions.

The goal of the project is to demonstrate how SQL can be used to analyze financial transaction data and generate insights that support data-driven decision making.


## Business Problem
PayPal operates in a highly competitive global digital payment ecosystem. Understanding transaction behavior is critical for improving platform performance, managing risk, and increasing market share.

The company needs to answer key business questions such as:
- Which countries generate the highest transaction volumes?
- Which merchants receive the most payments?
- How many transactions are high-value transactions?
- What percentage of transactions are domestic vs international?
- Which users remain consistently active on the platform?

Answering these questions can help PayPal optimize its payment infrastructure, improve user engagement, and identify growth opportunities.


## Solution Approach
To address these business questions, SQL queries were used to analyze transaction data across multiple tables including users, merchants, countries, and currencies.

The analysis includes:
- Joining multiple datasets to understand relationships between users, merchants, and transactions
- Aggregating transaction values to identify key markets
- Categorizing transactions based on value and location
- Evaluating merchant performance based on revenue generated
- Identifying high-value and international transactions
- Tracking user activity over time


## Dataset Description
The dataset consists of five tables that simulate PayPal’s digital payment system.

### Countries
Contains information about countries where users and merchants operate.

| Column | Description |
|------|-------------|
| Country_ID | Unique identifier for each country |
| Country_Name | Name of the country |

### Currencies
Stores information about currencies used in financial transactions.

| Column | Description |
|------|-------------|
| Currency_Code | Unique currency code |
| Currency_Name | Name of the currency |

### Merchants
Contains information about businesses that receive payments.

| Column | Description |
|------|-------------|
| Merchant_ID | Unique identifier for merchants |
| Business_Name | Merchant business name |
| Country_ID | Country where the merchant operates |

### Users
Stores information about users who send transactions.

| Column | Description |
|------|-------------|
| User_ID | Unique identifier for users |
| Email | User email address |
| Name | User name |
| Country_ID | User country |
| Account_Creation_Date | Account creation date |

### Transactions
Contains all payment transactions between users and merchants.

| Column | Description |
|------|-------------|
| Transaction_ID | Unique identifier for each transaction |
| Sender_ID | User sending the payment |
| Recipient_ID | Merchant receiving the payment |
| Transaction_Amount | Amount transferred |
| Transaction_Date | Date of transaction |
| Currency_Code | Currency used |

## Key Analysis Areas
### Country-Level Transaction Analysis
Identify top countries generating the highest transaction volumes.

### Merchant Performance Analysis
Evaluate merchant performance based on total transaction value received.

### High Value Transaction Detection
Identify transactions with values greater than a specified threshold.

### Transaction Classification
Categorize transactions as:
- High Value vs Regular
- Domestic vs International

### User Activity Analysis
Identify users who remain active across multiple months.

## Tools Used
- SQL  
- MySQL Workbench  
- Data Analysis  

## Skills Demonstrated
- SQL Joins  
- Aggregation Functions  
- CASE Statements  
- Date Filtering  
- Business Insight Generation  
- Financial Data Analysis  

## Author
datawithrajat

## License
This project is licensed under the MIT License.
