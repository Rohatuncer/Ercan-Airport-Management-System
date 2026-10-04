

USE ErcanAirportDB;
GO

SELECT m.model_no, m.capacity, COUNT(a.plane_no) AS total_planes
FROM Model m
JOIN Airplane a ON m.model_no = a.model_no
GROUP BY m.model_no, m.capacity;

SELECT plane_no, hangar_no, in_date
FROM Airplane_Hangar_Log
WHERE out_date IS NULL;

SELECT plane_no, score
FROM Testing_Event
WHERE score > (SELECT AVG(score) FROM Testing_Event);

SELECT e.name, t.test_date, t.score
FROM Employee e
JOIN Testing_Event t ON e.ssn = t.technician_ssn
ORDER BY t.score DESC;

SELECT technician_ssn, SUM(hours_spent) AS total_hours
FROM Testing_Event
GROUP BY technician_ssn;

SELECT test_id, COUNT(plane_no) AS planes_tested
FROM Testing_Event
GROUP BY test_id;

SELECT e.name, te.model_no
FROM Employee e
JOIN Technician_Expertise te ON e.ssn = te.ssn
WHERE te.model_no = 'Boeing 737';

SELECT e.name, tc.last_medical_exam_date
FROM Employee e
JOIN Traffic_Controller tc ON e.ssn = tc.ssn;

SELECT hangar_no, COUNT(plane_no) AS current_planes
FROM Airplane_Hangar_Log
WHERE out_date IS NULL
GROUP BY hangar_no;

SELECT ssn, COUNT(model_no) AS expertise_count
FROM Technician_Expertise
GROUP BY ssn
HAVING COUNT(model_no) > 1;

SELECT test_id, MAX(score) AS highest_score
FROM Testing_Event
GROUP BY test_id;

SELECT test_id, AVG(hours_spent) AS avg_hours
FROM Testing_Event
GROUP BY test_id;

SELECT name, union_membership_number
FROM Employee
ORDER BY name;

SELECT a.plane_no
FROM Airplane a
LEFT JOIN Testing_Event t ON a.plane_no = t.plane_no
WHERE t.event_id IS NULL;

SELECT technician_ssn, AVG(score) AS average_score
FROM Testing_Event
GROUP BY technician_ssn;