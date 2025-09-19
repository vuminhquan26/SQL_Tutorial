-- Đếm số sinh viên theo từng tuổi
SELECT Age, COUNT(*) AS SoLuong
FROM Students
GROUP BY Age;
