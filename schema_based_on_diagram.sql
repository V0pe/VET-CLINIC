/*Project schema*/

CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(30),
    date_of_birth DATE,
    PRIMARY KEY(id)
);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(30),
    name VARCHAR(30),
    PRIMARY KEY(id)
);

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    paid_at TIMESTAMP,
    medical_history_id INT,
    CONSTRAINT fk_invoices_medical_history FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE, 
    PRIMARY KEY(id)
);

CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT,
    CONSTRAINT fk_medical_histories_patient FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE,
    status VARCHAR(30);
    PRIMARY KEY(id)
);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL, 
    invoice_id INT,
    CONSTRAINT fk_invoice_items_invoices FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
    treatment_id INT,
    CONSTRAINT fk_treatment_invoices FOREIGN KEY (treatment_id) REFERENCES treatments(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);

CREATE TABLE medical_histories_treatments(
    medical_history_id int,
    treatment_id int,
    constraint fk_medical_histories foreign key (medical_history_id) references medical_histories(id),
    constraint fk_treatments foreign key (treatment_id) references treatments(id)
);

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON medical_histories_treatments (medical_history_id);
CREATE INDEX ON medical_histories_treatments (treatment_id);


