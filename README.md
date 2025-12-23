# Vehicle Rental System - Database Design & SQL Queries

## 📌 Project Overview
This project involves designing a relational database for a **Vehicle Rental System** and writing SQL queries to manage users, vehicles, and bookings. The system supports two user roles (Admin and Customer), tracks vehicle availability, and manages rental records.

## 🛠️ Tech Stack
- **Database:** PostgreSQL
- **Design Tool:** [Insert your ERD tool name, e.g., Lucidchart]

## 📊 Database Schema (ERD)
The database consists of three main tables:
1. **Users:** Stores user profiles and roles (`Admin` or `Customer`).
2. **Vehicles:** Manages vehicle details, types, and availability status.
3. **Bookings:** Tracks rental transactions between users and vehicles.

**ERD Link:** [PASTE_YOUR_LUCIDCHART_OR_IMAGE_LINK_HERE]

## 🚀 Key Features
- **One-to-Many Relationship:** One user can have multiple bookings.
- **Many-to-One Relationship:** Multiple bookings can be associated with a single vehicle over time.
- **Unique Constraints:** Emails and Registration numbers are unique.
- **Status Management:** Real-time tracking of booking and vehicle status.

## 📝 SQL Query Solutions
The solutions for the required SQL tasks can be found in the `queries.sql` file. It covers:
- **JOINs:** Combining User and Vehicle data for booking reports.
- **EXISTS:** Identifying unbooked vehicles.
- **Filtering:** Finding available vehicles by type.
- **Aggregation:** Counting bookings per vehicle with `HAVING` filters.

## 🎥 Viva Video
**Link:** [PASTE_YOUR_VIDEO_LINK_HERE]

---
*Submitted for Apollo Level 2 Web Development - Assignment 6A3*
