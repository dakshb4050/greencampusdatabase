# DAU Green Campus Management Database 🌱

## Overview
The DAU Green Campus Management Database is a centralized digital system designed to replace fragmented, paper-based records for managing campus flora, gardening equipment, and maintenance activities[cite: 1]. It tracks the complete life-cycle of campus plants, the resources that support them (water, fertilizers, equipment), and the human activities that maintain them[cite: 1]. 

The system aims to optimize resource usage for sustainability and cost savings while providing authoritative records for external accreditation (e.g., NAAC/AQAR)[cite: 1].

## Core Modules & Features
* **Plant Records Management:** Tracks unique IDs, species, GPS locations, planting dates, health status, and QR tags for over 5,300 campus trees[cite: 1].
* **Task & Staff Management:** Facilitates role-based task assignments, mobile completion logging, and scheduling for gardening staff[cite: 1].
* **Equipment & Inventory:** Monitors equipment status (available, in-use, under repair) and tracks fertilizer/consumable stock with automated alerts[cite: 1].
* **Irrigation Tracking:** Logs watering events, volumes, and specific water sources (STP, borewell) to align with sustainability goals[cite: 1].
* **Reporting & Analytics:** Generates automated monthly usage reports and sustainability dashboards[cite: 1].

## Database Architecture
The backend is driven by a highly normalized (3NF) relational database architecture[cite: 1]. 

* **Schema:** Contains nearly 30 interlinked tables including `Plant`, `Area`, `Staff`, `Soil`, `Weather`, `Equipment`, `Task`, `Inventory`, and `WaterEvent`[cite: 1].
* **Constraints:** Enforces strict data integrity using primary/foreign keys, `CHECK` constraints, `UNIQUE` identifiers, and cascading update/delete protocols[cite: 1].
* **Operations:** Includes a suite of 40 optimized SQL queries utilizing complex joins, aggregate functions, subqueries, and date/time manipulation to drive the analytics dashboard[cite: 1].

## Technology Stack
* **Database:** PostgreSQL (with PostGIS extension for geospatial data)[cite: 1]
* **Backend API (Proposed):** Node.js / Django / Spring Boot[cite: 1]
* **Reporting:** Python (Pandas/ReportLab) / JavaScript (jsPDF)[cite: 1]
* **Integrations:** OpenWeatherMap API, Google Maps API, QR Code parsing[cite: 1]

## Repository Structure
* `/sql/schema_ddl.sql`: Contains the complete Data Definition Language script to generate the database schema, tables, and constraints.
* `/sql/operations_queries.sql`: Contains 40 operational queries used for analytics, reporting, and daily data retrieval.
* `/docs/`: Contains the complete Software Requirements Specification (SRS) and Entity-Relationship (ER) models.

## Future Enhancements
* Integration with IoT sensors for real-time water and soil telemetry[cite: 1].
* AI-assisted fertilizer and maintenance recommendations[cite: 1].
* Full integration with the campus Decentralized Wastewater Treatment System (DEWATS)[cite: 1].
