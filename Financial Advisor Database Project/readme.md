# Enhanced Financial Advisor Database

## Project Overview

The Enhanced Financial Advisor Tool EFAT is a database driven system designed to manage and analyze complex financial data for financial advisory services. The project focuses on replacing traditional Excel based workflows with a structured scalable and fully normalized relational database that enables efficient data storage retrieval and analysis.

EFAT manages end to end financial data including client profiles financial goals investments assets liabilities and advisor client relationships. The system emphasizes data integrity scalability and analytical querying for real world financial decision making.

## Problem Statement

Traditional tools such as Excel are not suitable for managing large scale financial data due to limitations in scalability real time updates multi user access and advanced querying. Financial advisors require a reliable database system that ensures accurate data handling supports analytical insights and enables informed decision making.

## Solution Approach

The project initially stores financial data in a denormalized structure to represent raw real world data. This data is then systematically transformed into a fully normalized relational database following First Normal Form Second Normal Form and Third Normal Form. This approach reduces redundancy improves consistency and enhances overall query performance.

## Database Design

The EFAT database is designed using a structured relational model that clearly separates financial data into multiple interconnected tables. Each table represents a specific business entity and is linked using primary keys and foreign keys to maintain strong referential integrity. This design enables efficient storage retrieval and analytical processing of financial information.

### Clients Table

The Clients table stores core demographic and risk related information for each client. It acts as the central entity in the database and connects to all other financial tables. Attributes include client identification details contact information date of birth address and risk tolerance level. Each client is uniquely identified using a client ID.

### Financial Goals Table

The Financial Goals table captures individual financial objectives such as retirement education or emergency funds. Each goal is associated with a specific client and includes details such as goal type target amount and target date. This table allows advisors to track progress and align investments with client objectives.

### Investments Table

The Investments table records all investment activities of clients across different asset classes such as stocks bonds mutual funds and real estate. It stores investment type value and purchase date and links each investment to the respective client. This table supports analytical queries such as total investments highest investments and portfolio distribution.

### Assets Table

The Assets table maintains information about tangible and intangible assets owned by clients including property vehicles jewelry and antiques. Each asset is mapped to a client and stores asset type and asset value providing a holistic view of a client’s net worth.

### Liabilities Table

The Liabilities table records financial obligations such as loans mortgages and credit card dues. Each liability is linked to a client and includes liability type and amount enabling advisors to assess financial risk and debt exposure.

### Financial Advisors Table

The Financial Advisors table stores information about advisors including personal details contact information and area of specialization. This table enables efficient advisor assignment based on client requirements and financial goals.

### Advisor Client Relationship Table

The Advisor Client Relationship table manages the many to many relationship between clients and advisors. It records advisor assignments along with assignment dates allowing the system to track advisory history and changes over time.

## Normalization

The database design follows standard normalization principles to ensure efficiency and integrity.

First Normal Form ensures atomic values and removes repeating groups.
Second Normal Form eliminates partial dependencies by separating data into logically related tables.
Third Normal Form removes transitive dependencies so that non key attributes depend only on the primary key.

This normalization process significantly minimizes data redundancy and improves data integrity.

## SQL Implementation

The project includes extensive SQL based implementation covering
Table creation with primary and foreign key constraints
Data insertion and transformation from denormalized to normalized tables
CRUD operations including insert update delete and select
Joins subqueries and nested queries
Aggregate and analytical queries such as AUM calculation risk profiling and investment analysis

## Key Features

Fully normalized and scalable relational database design
Strong data integrity through constraints and relationships
Efficient analytical querying for financial insights
Support for multiple clients and multiple advisors
Optimized structure suitable for future expansion

## Tools and Technologies

SQL for database design and querying
ER modeling for schema design
Normalization techniques including 1NF 2NF and 3NF
Relational constraints and integrity rules

## Outcome

The EFAT system demonstrates how denormalized financial data can be transformed into a scalable and normalized database capable of supporting complex financial operations. The project follows database design best practices and provides a robust foundation for real world financial advisory applications.

## Future Enhancements

Integration with a frontend dashboard for visualization
Role based access control for advisors and administrators
Real time reporting and monitoring
Advanced analytics and performance optimization
