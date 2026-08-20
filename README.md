# GreenCampus Database Project

## Project Overview
This repository contains the SQL schema and initial mock data for a comprehensive smart campus and agricultural management system. The relational database is designed to handle ecological monitoring, workforce logistics, equipment inventory, and resource consumption.

## Database Schema & Core Entities
The database architecture consists of multiple interconnected tables designed to track campus operations:
*   **Environmental Monitoring**: Tracks real-time data using sensors calibrated for temperature, humidity, soil moisture, light, and pH levels.
*   **Botanical Records**: Manages plant species, their specific growth stages, and their current health status as either healthy or diseased.
*   **Workforce Management**: Organizes staff details, shift schedules, salaries, and individual performance ratings.
*   **Operations & Logistics**: Handles task prioritization, equipment availability, supplier transactions, and warehouse inventory stock.
*   **Resource Tracking**: Monitors energy consumption across different source types and records specific water usage events.

---

## Technology Stack
*   **Relational Database**: PostgreSQL
*   **Key Features Used**: Constraint checks for data integrity, cascading foreign keys for dependency management, and auto-generated identity columns for transaction tracking.

---

## Setup Instructions
To recreate this database locally or in a sandbox environment, execute the files in the following order:
1.  Run the DDL script to generate the table structures, primary keys, and constraints. 
2.  Run the DML script to populate the tables with initial environmental readings and operational records.