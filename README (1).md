# Hospital Management System - SQL Project

This project implements a basic **Hospital Management System** using SQL. It is designed to manage key hospital operations such as patient data, doctor details, appointments, treatments, and billing.

## 🗂️ Project Structure

The database consists of the following tables:

- **Patient**: Stores personal and contact information of patients.
- **Doctor**: Contains details about doctors, including specialization and contact.
- **Appointment**: Records appointment information between patients and doctors.
- **Treatment**: Tracks treatment details given during appointments.
- **Billing**: Maintains records of charges associated with treatments.

## 🧱 Schema Overview

### Patient
- `patient_id` (Primary Key)
- `name`, `gender`, `age`, `phone`, `address`

### Doctor
- `doctor_id` (Primary Key)
- `name`, `specialization`, `phone`, `email`

### Appointment
- `appointment_id` (Primary Key)
- `patient_id` (Foreign Key)
- `doctor_id` (Foreign Key)
- `appointment_date`, `appointment_time`, `reason`

### Treatment
- `treatment_id` (Primary Key)
- `appointment_id` (Foreign Key)
- `diagnosis`, `prescription`

### Billing
- `bill_id` (Primary Key)
- `treatment_id` (Foreign Key)
- `amount`, `billing_date`, `payment_status`

## 🛠️ How to Use

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/hospital-management-sql.git
   ```

2. **Run the SQL Script**:
   Import `HotelManagementSystem.sql` into your SQL client (MySQL, PostgreSQL, etc.) to create the schema and tables.

3. **Start Managing Hospital Data**!

## ✅ Features

- Relational schema with appropriate primary and foreign keys
- Normalized data structure
- Suitable for integration into larger health management applications

## 📌 Note

This is a backend-only project focusing on SQL database structure and is ideal for learning or integration into full-stack applications.
