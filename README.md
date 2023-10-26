# SmartCheckout

SmartCheckout is a web-based e-commerce platform that allows users to browse and purchase products online. This repository contains the codebase for both the server and client applications, as well as the database setup.

## Getting Started

Follow these steps to set up and run the SmartCheckout application locally:

### Server Setup

1. Navigate to the server directory:
2. Npm i
3. Nodemon
4. create a new console
5. cd server
6. node index.js

### Client Setup

1. Navigate to the client directory:
2. npm i
3. npm start

### Setting up SQL

1. Run the sql queries in the workbench

# ShopSmart Database Setup

This repository contains the SQL queries and table structures to set up the ShopSmart database. Below are the SQL commands to create the necessary tables and insert sample data. You can copy and paste these SQL commands into your database system to set up the database.

## Table Structure for `admin`

```sql
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(35) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` date NOT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`admin`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`)
);

-- Dumping data for table `admin`
LOCK TABLES `admin` WRITE;
INSERT INTO `admin` VALUES (101,'Joel B Koshy','joelbkoshy@gmail.com','Joel@123','2001-04-14',8330829907);
UNLOCK TABLES;

