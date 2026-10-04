
USE ErcanAirportDB;
GO


CREATE TABLE Model (
    model_no VARCHAR(50) PRIMARY KEY,
    capacity INT
);


CREATE TABLE Airplane (
    plane_no VARCHAR(50) PRIMARY KEY,
    model_no VARCHAR(50),
    FOREIGN KEY (model_no) REFERENCES Model(model_no)
);


CREATE TABLE Hangar (
    hangar_no INT PRIMARY KEY,
    location VARCHAR(100)
);


CREATE TABLE Airplane_Hangar_Log (
    log_id INT PRIMARY KEY IDENTITY(1,1),
    plane_no VARCHAR(50),
    hangar_no INT,
    in_date DATETIME,
    out_date DATETIME,
    FOREIGN KEY (plane_no) REFERENCES Airplane(plane_no),
    FOREIGN KEY (hangar_no) REFERENCES Hangar(hangar_no),
CONSTRAINT chk_dates CHECK (out_date >= in_date)
);


CREATE TABLE Employee (
    ssn VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    union_membership_number VARCHAR(50)
);


CREATE TABLE Traffic_Controller (
    ssn VARCHAR(20) PRIMARY KEY,
    last_medical_exam_date DATE,
    FOREIGN KEY (ssn) REFERENCES Employee(ssn)
);


CREATE TABLE Technician (
    ssn VARCHAR(20) PRIMARY KEY,
    FOREIGN KEY (ssn) REFERENCES Employee(ssn)
);


CREATE TABLE Technician_Expertise (
    ssn VARCHAR(20),
    model_no VARCHAR(50),
    PRIMARY KEY (ssn, model_no),
    FOREIGN KEY (ssn) REFERENCES Technician(ssn),
    FOREIGN KEY (model_no) REFERENCES Model(model_no)
);


CREATE TABLE Test (
    test_id INT PRIMARY KEY,
    test_name VARCHAR(100)
);


CREATE TABLE Testing_Event (
    event_id INT PRIMARY KEY IDENTITY(1,1),
    plane_no VARCHAR(50),
    test_id INT,
    technician_ssn VARCHAR(20),
    test_date DATE,
    hours_spent DECIMAL(5,2),
    score INT,
    FOREIGN KEY (plane_no) REFERENCES Airplane(plane_no),
    FOREIGN KEY (test_id) REFERENCES Test(test_id),
    FOREIGN KEY (technician_ssn) REFERENCES Technician(ssn)
);

