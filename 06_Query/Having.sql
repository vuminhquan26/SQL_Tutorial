-- Chỉ lấy những nhóm tuổi có nhiều hơn 2 sinh viên
SELECT Age, COUNT(*) AS SoLuong
FROM Students
GROUP BY Age
HAVING COUNT(*) > 2;
-- Having lọc sau GroupBy