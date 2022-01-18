-- Create patients
CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(80),
  date_of_birth DATE
);

-- Create medical histories
CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(80),
  CONSTRAINT patient_id_fk FOREIGN KEY(patient_id) REFERENCES patients(id)
);