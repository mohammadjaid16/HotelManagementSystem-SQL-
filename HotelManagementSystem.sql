-- DROP TABLES IF THEY ALREADY EXIST (for reruns)
DROP TABLE IF EXISTS Billing;
DROP TABLE IF EXISTS Treatment;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS Patient;

-- PATIENT TABLE
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    phone VARCHAR(15),
    address TEXT
);

-- DOCTOR TABLE
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

-- APPOINTMENT TABLE
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- TREATMENT TABLE
CREATE TABLE Treatment (
    treatment_id INT PRIMARY KEY,
    appointment_id INT,
    diagnosis TEXT,
    prescription TEXT,
    notes TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id)
);

-- BILLING TABLE
CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    treatment_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    payment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatment(treatment_id)
);

-- SAMPLE DATA
INSERT INTO Patient VALUES (1, 'John Doe', 'Male', 30, '1234567890', '123 Main Street');
INSERT INTO Patient VALUES (2, 'Jane Smith', 'Female', 25, '0987654321', '456 Side Street');

INSERT INTO Doctor VALUES (101, 'Dr. Smith', 'Cardiologist', '9876543210', 'smith@hospital.com');
INSERT INTO Doctor VALUES (102, 'Dr. Brown', 'Neurologist', '8765432190', 'brown@hospital.com');

INSERT INTO Appointment VALUES (1001, 1, 101, '2025-04-15', '10:00:00', 'Chest Pain');
INSERT INTO Appointment VALUES (1002, 2, 102, '2025-04-16', '11:30:00', 'Headache');

INSERT INTO Treatment VALUES (201, 1001, 'Mild Heart Condition', 'Aspirin 100mg', 'Avoid stress and fatty food');
INSERT INTO Treatment VALUES (202, 1002, 'Migraine', 'Paracetamol 500mg', 'Proper sleep required');

INSERT INTO Billing VALUES (301, 1, 201, 1500.00, 'Paid', '2025-04-16');
INSERT INTO Billing VALUES (302, 2, 202, 1200.00, 'Unpaid', NULL);

-- SAMPLE QUERIES

-- View All Patients
SELECT * FROM Patient;

-- View All Doctors
SELECT * FROM Doctor;

-- Get All Appointments for a Patient
SELECT A.appointment_id, D.name AS doctor_name, A.appointment_date, A.reason
FROM Appointment A
JOIN Doctor D ON A.doctor_id = D.doctor_id
WHERE A.patient_id = 1;

-- View Treatment Details by Appointment
SELECT T.diagnosis, T.prescription, T.notes
FROM Treatment T
WHERE T.appointment_id = 1001;

-- View Billing Status for Patient
SELECT B.bill_id, B.amount, B.payment_status, B.payment_date
FROM Billing B
WHERE B.patient_id = 1;

-- Total Bill Paid by a Patient
SELECT SUM(amount) AS total_paid
FROM Billing
WHERE patient_id = 1 AND payment_status = 'Paid';
