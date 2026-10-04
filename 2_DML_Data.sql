
USE ErcanAirportDB;
GO

INSERT INTO Model (model_no, capacity) VALUES 
('Boeing 737', 200),
('Airbus A320', 180),
('Cessna 172', 4);

INSERT INTO Airplane (plane_no, model_no) VALUES 
('TC-ERC1', 'Boeing 737'),
('TC-ERC2', 'Airbus A320'),
('TC-ERC3', 'Cessna 172');

INSERT INTO Hangar (hangar_no, location) VALUES 
(1, 'North Terminal A'),
(2, 'South Terminal B');

INSERT INTO Airplane_Hangar_Log (plane_no, hangar_no, in_date, out_date) VALUES 
('TC-ERC1', 1, '2026-05-01 10:00:00', '2026-05-02 15:30:00'),
('TC-ERC2', 2, '2026-05-10 08:15:00', NULL);

INSERT INTO Employee (ssn, name, union_membership_number) VALUES 
('111111111', 'Ali Yilmaz', 'UN-1001'),
('222222222', 'Ayse Demir', 'UN-1002'),
('333333333', 'Mehmet Kaya', 'UN-1003'),
('444444444', 'Fatma Sahin', 'UN-1004');

INSERT INTO Traffic_Controller (ssn, last_medical_exam_date) VALUES 
('111111111', '2026-01-15');

INSERT INTO Technician (ssn) VALUES 
('222222222'),
('333333333');

INSERT INTO Technician_Expertise (ssn, model_no) VALUES 
('222222222', 'Boeing 737'),
('222222222', 'Airbus A320'),
('333333333', 'Cessna 172');

INSERT INTO Test (test_id, test_name) VALUES 
(1, 'Engine Diagnostics'),
(2, 'Landing Gear Inspection'),
(3, 'Avionics System Check');

INSERT INTO Testing_Event (plane_no, test_id, technician_ssn, test_date, hours_spent, score) VALUES 
('TC-ERC1', 1, '222222222', '2026-05-05', 4.5, 95),
('TC-ERC2', 3, '222222222', '2026-05-11', 2.0, 100),
('TC-ERC3', 2, '333333333', '2026-05-12', 1.5, 85);