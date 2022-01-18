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

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  CONSTRAINT medical_history_id_fk FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  type VARCHAR(80),
  name VARCHAR(80)
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  CONSTRAINT invoice_id_FK FOREIGN KEY (invoice_id) REFERENCES invoices (id),
  CONSTRAINT treatment_id_FK FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);
CREATE TABLE prescription (
  medical_history_id INT,
  treatment_id INT,
  CONSTRAINT medica_FK FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id),
  CONSTRAINT treatment_id_FK FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);