-- Sinh viên có tuổi > 20
SELECT * FROM Students
WHERE Age > 20;

-- Sinh viên tên bắt đầu bằng "Nguyen"
SELECT * FROM Students
WHERE _Name_ LIKE 'Nguyen%';

-- Sinh viên có tuổi trong khoảng 18 đến 22
SELECT * FROM Students
WHERE Age BETWEEN 18 AND 22;

-- Sinh viên có tuổi bằng 20 hoặc 23
SELECT * FROM Students
WHERE Age IN (20, 23);
