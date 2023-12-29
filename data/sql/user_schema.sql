/**
 * Creates a table named 'patients' to store information about individual patients.
 * Columns:
 * - patient_id: Unique identifier for each patient.
 * - name: Patient's name.
 * - date_of_birth: Patient's date of birth.
 * - gender: Patient's gender.
 * - street: Patient's street address.
 * - city: Patient's city of residence.
 * - state: Patient's state of residence.
 * - zip_code: Patient's ZIP code.
 * - email: Patient's email address.
 * - phone: Patient's phone number.
 */
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    gender VARCHAR(10),
    street VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(50),
    zip_code VARCHAR(10),
    email VARCHAR(255),
    phone VARCHAR(15)
);

/**
 * Creates a table named 'family_members' to store information about family members related to patients.
 * Columns:
 * - family_member_id: Unique identifier for each family member.
 * - patient_id: Foreign key referencing 'patients' table.
 * - name: Family member's name.
 * - relationship: Relationship of the family member to the patient.
 * - date_of_birth: Family member's date of birth.
 * - email: Family member's email address.
 * - phone: Family member's phone number.
 */
CREATE TABLE family_members (
    family_member_id INT PRIMARY KEY,
    patient_id INT,
    name VARCHAR(255),
    relationship VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(255),
    phone VARCHAR(15),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

/**
 * Creates a table named 'health_records' to store health-related information about patients.
 * Columns:
 * - patient_id: Foreign key referencing 'patients' table.
 * - blood_type: Patient's blood type.
 * - allergies: JSON array storing patient's allergies.
 * - medical_conditions: JSON array storing patient's medical conditions.
 */
CREATE TABLE health_records (
    patient_id INT PRIMARY KEY,
    blood_type VARCHAR(5),
    allergies JSON,
    medical_conditions JSON
);

/**
 * Creates a table named 'medications' to store information about medications prescribed to patients.
 * Columns:
 * - medication_id: Unique identifier for each medication.
 * - patient_id: Foreign key referencing 'patients' table.
 * - name: Medication name.
 * - dosage: Medication dosage.
 * - frequency: Medication frequency.
 * - start_date: Date when the medication was prescribed.
 * - prescribing_doctor: Doctor who prescribed the medication.
 */
CREATE TABLE medications (
    medication_id INT PRIMARY KEY,
    patient_id INT,
    name VARCHAR(255),
    dosage VARCHAR(20),
    frequency VARCHAR(50),
    start_date DATE,
    prescribing_doctor VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

/**
 * Creates a table named 'doctors' to store information about medical doctors.
 * Columns:
 * - doctor_id: Unique identifier for each doctor.
 * - name: Doctor's name.
 * - specialty: Doctor's medical specialty.
 * - email: Doctor's email address.
 * - phone: Doctor's phone number.
 */
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(255),
    specialty VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(15)
);

/**
 * Creates a table named 'patient_doctors' to establish a many-to-many relationship
 * between patients and doctors.
 * Columns:
 * - patient_id: Foreign key referencing 'patients' table.
 * - doctor_id: Foreign key referencing 'doctors' table.
 */
CREATE TABLE patient_doctors (
    patient_id INT,
    doctor_id INT,
    PRIMARY KEY (patient_id, doctor_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

/**
 * Creates a table named 'insurance' to store information about patient insurance.
 * Columns:
 * - patient_id: Foreign key referencing 'patients' table.
 * - provider: Insurance provider's name.
 * - policy_number: Patient's insurance policy number.
 * - group_number: Patient's insurance group number.
 * - expiration_date: Expiration date of the insurance policy.
 */
CREATE TABLE insurance (
    patient_id INT PRIMARY KEY,
    provider VARCHAR(255),
    policy_number VARCHAR(50),
    group_number VARCHAR(50),
    expiration_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

/**
 * Creates a table named 'hospitals' to store information about hospitals.
 * Columns:
 * - hospital_id: Unique identifier for each hospital.
 * - name: Hospital's name.
 * - location: Hospital's location.
 */
CREATE TABLE hospitals (
    hospital_id INT PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(255)
);

/**
 * Creates a table named 'hospital_treatments' to store information about treatments
 * received by patients in hospitals.
 * Columns:
 * - treatment_id: Unique identifier for each hospital treatment.
 * - hospital_id: Foreign key referencing 'hospitals' table.
 * - patient_id: Foreign key referencing 'patients' table.
 * - date: Date of the hospital treatment.
 * - procedure: Name of the medical procedure performed.
 * - doctor: Doctor who performed the medical procedure.
 */
CREATE TABLE hospital_treatments (
    treatment_id INT PRIMARY KEY,
    hospital_id INT,
    patient_id INT,
    date DATE,
    procedure VARCHAR(255),
    doctor VARCHAR(255),
    FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

/**
 * Inserts sample data into the 'patients' table.
 */
INSERT INTO patients VALUES (1, 'John Doe', '1980-01-01', 'Male', '123 Main St', 'Cityville', 'CA', '12345', 'john.doe@example.com', '555-1234');

/**
 * Inserts sample data into the 'family_members' table.
 */
INSERT INTO family_members VALUES (1, 1, 'Jane Doe', 'Spouse', '1982-05-15', 'jane.doe@example.com', '555-5678');

/**
 * Inserts sample data into the 'health_records' table.
 */
INSERT INTO health_records VALUES (1, 'A+', '["Penicillin", "Pollen"]', '["Hypertension", "Diabetes"]');

/**
 * Inserts sample data into the 'medications' table.
 */
INSERT INTO medications VALUES (1, 1, 'Medication A', '10mg', 'Twice daily', '2022-01-01', 'Dr. Smith');
INSERT INTO medications VALUES (2, 1, 'Medication B', '20mg', 'Once daily', '2022-05-01', 'Dr. Johnson');

/**
 * Inserts sample data into the 'doctors' table.
 */
INSERT INTO doctors VALUES (1, 'Dr. Smith', 'Cardiologist', 'dr.smith@example.com', '555-9999');
INSERT INTO doctors VALUES (2, 'Dr. Johnson', 'Endocrinologist', 'dr.johnson@example.com', '555-8888');

/**
 * Establishes relationships between patients and doctors in the 'patient_doctors' table.
 */
INSERT INTO patient_doctors VALUES (1, 1);
INSERT INTO patient_doctors VALUES (1, 2);

/**
 * Inserts sample data into the 'insurance' table.
 */
INSERT INTO insurance VALUES (1, 'HealthCare Insurance', 'ABC123', 'XYZ789', '2023-12-31');

/**
 * Inserts sample data into the 'hospitals' table.
 */
INSERT INTO hospitals VALUES (1, 'City General Hospital', 'Cityville');
INSERT INTO hospitals VALUES (2, 'County Medical Center', 'Countytown');

/**
 * Inserts sample data into the 'hospital_treatments' table.
 */
INSERT INTO hospital_treatments VALUES (1, 1, 1, '2022-02-15', 'Appendectomy', 'Dr. Brown');
INSERT INTO hospital_treatments VALUES (2, 2, 1, '2022-08-10', 'Cardiac Angioplasty', 'Dr. Smith');
