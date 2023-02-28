-- Create database table based on diagram
CREATE TABLE patients (
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(250),
	date_of_birth DATE,
	PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
	id INT GENERATED ALWAYS AS IDENTITY,
	admitted_at TIMESTAMP,
	patient_id INT REFERENCES patients(id),
	status VARCHAR(250),
	PRIMARY KEY (id)
);

CREATE TABLE invoices (
	id INT GENERATED ALWAYS AS IDENTITY,
	total_amount DECIMAL,
	generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	medical_history_id INT REFERENCES medical_histories(id),
	PRIMARY KEY (id)
);

CREATE TABLE treatments (
	id INT GENERATED ALWAYS AS IDENTITY,
	type VARCHAR(250),
	name VARCHAR(250),
	PRIMARY KEY (id)
);

CREATE TABLE between_histories_treatments (
	medical_histories_id INT REFERENCES medical_histories(id),
	treatments_id INT REFERENCES treatments(id)
);

CREATE TABLE invoice_items (
	id INT GENERATED ALWAYS AS IDENTITY,
	unit_price DECIMAL,
	quantity INT,
	total_price DECIMAL,
	invoice_id INT REFERENCES invoices(id),
	treatment_id INT REFERENCES treatments(id),
	PRIMARY KEY (id)
);

CREATE INDEX ON medical_histories(patient_id);
CREATE INDEX ON invoice_items(invoice_id);
CREATE INDEX ON invoice_items(treatment_id);
CREATE INDEX ON invoices(medical_history_id);
CREATE INDEX ON between_histories_treatments(medical_histories_id);
CREATE INDEX ON between_histories_treatments(treatments_id);
