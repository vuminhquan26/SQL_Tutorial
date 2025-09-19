/*
    - VIEW giống như một "bảng ảo", được tạo ra từ kết quả của một câu SELECT.
    - Dùng VIEW để:
        + Đơn giản hóa câu truy vấn phức tạp (SELECT nhiều JOIN).
        + Tăng tính bảo mật (giấu bớt cột nhạy cảm).
        + Tái sử dụng nhiều lần mà không cần viết lại query dài.

    Cú pháp:
    CREATE VIEW view_name AS
    SELECT ...
*/

/*
    Demo: Tạo VIEW hiển thị danh sách sinh viên và lớp học
*/
CREATE VIEW vw_StudentClasses AS
SELECT s.StudentID, s.Name AS StudentName, c.ClassName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Classes c ON e.ClassID = c.ClassID;


/*
    Sửa VIEW: Thêm cột Age (từ bảng Students) và ClassID (từ bảng Classes)
*/
ALTER VIEW vw_StudentClasses AS
SELECT 
    s.StudentID, 
    s.Name AS StudentName, 
    s.Age,
    c.ClassID,
    c.ClassName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Classes c ON e.ClassID = c.ClassID;

/*
    Gọi VIEW như một bảng bình thường
*/
SELECT * FROM vw_StudentClasses;


/*
    Drop View
*/
DROP VIEW vw_StudentClasses;