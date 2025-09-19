/*
    1. INNER JOIN
    - Chỉ lấy dữ liệu khớp ở cả 2 bảng
    - Ví dụ: Hiện danh sách sinh viên có đăng ký lớp
*/
SELECT s.Name, c.ClassName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Classes c ON e.ClassID = c.ClassID;


/*
    2. LEFT JOIN
    - Lấy tất cả từ bảng bên trái (Students)
    - Nếu không có trong Enrollments → ClassName sẽ = NULL
    - Ví dụ: Hiện tất cả sinh viên, kể cả chưa đăng ký lớp
*/
SELECT s.Name, c.ClassName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Classes c ON e.ClassID = c.ClassID;


/*
    3. RIGHT JOIN
    - Lấy tất cả từ bảng bên phải (Classes)
    - Nếu không có trong Enrollments → Name sẽ = NULL
    - Ví dụ: Hiện tất cả lớp học, kể cả chưa có sinh viên đăng ký
*/
SELECT s.Name, c.ClassName
FROM Students s
RIGHT JOIN Enrollments e ON s.StudentID = e.StudentID
RIGHT JOIN Classes c ON e.ClassID = c.ClassID;