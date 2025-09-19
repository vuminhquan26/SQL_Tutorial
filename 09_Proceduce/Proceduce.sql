/*
    Stored Procedure (Thủ tục lưu trữ) trong SQL Server
    ---------------------------------------------------
    1. Khái niệm:
       - Là tập hợp các câu lệnh SQL được đặt tên và lưu trữ trong CSDL.
       - Giúp tái sử dụng code, giảm lặp lại, tăng hiệu suất, và bảo mật dữ liệu.

    2. Đặc điểm:
       - Được biên dịch và lưu sẵn → khi gọi chạy nhanh hơn.
       - Có thể nhận tham số INPUT (đầu vào) và OUTPUT (đầu ra).
       - Có thể thực hiện đầy đủ CRUD (Create, Read, Update, Delete).
       - Người dùng có thể gọi procedure mà không cần quyền trực tiếp trên bảng.

    3. Cú pháp:
       CREATE PROCEDURE TenThuTuc
           @ThamSo1 KieuDuLieu,
           @ThamSo2 KieuDuLieu OUTPUT
       AS
           -- Các câu lệnh SQL
       
       Gọi thủ tục:
       EXEC TenThuTuc @ThamSo1 = value, @ThamSo2 = value OUTPUT;

    4. Ví dụ đơn giản:
       CREATE PROCEDURE GetAllStudents
       AS
       SELECT * FROM Students;

       -- Gọi:
       EXEC GetAllStudents;
*/
/*
    Stored Procedure (Thủ tục lưu trữ) trong SQL Server
    ---------------------------------------------------
    1. Khái niệm:
       - Là tập hợp các câu lệnh SQL được đặt tên và lưu trữ trong CSDL.
       - Giúp tái sử dụng code, giảm lặp lại, tăng hiệu suất, và bảo mật dữ liệu.

    2. Đặc điểm:
       - Được biên dịch và lưu sẵn → khi gọi chạy nhanh hơn.
       - Có thể nhận tham số INPUT (đầu vào) và OUTPUT (đầu ra).
       - Có thể thực hiện đầy đủ CRUD (Create, Read, Update, Delete).
       - Người dùng có thể gọi procedure mà không cần quyền trực tiếp trên bảng.

    3. Cú pháp:
       CREATE PROCEDURE TenThuTuc
           @ThamSo1 KieuDuLieu,
           @ThamSo2 KieuDuLieu OUTPUT
       AS
           -- Các câu lệnh SQL
       
       Gọi thủ tục:
       EXEC TenThuTuc @ThamSo1 = value, @ThamSo2 = value OUTPUT;

    4. Ví dụ đơn giản:
       CREATE PROCEDURE GetAllStudents
       AS
       SELECT * FROM Students;

       -- Gọi:
       EXEC GetAllStudents;
*/


/* 
    Stored Procedure: Lấy toàn bộ sinh viên
    - Không tham số
    - Không cần BEGIN...END vì chỉ có 1 lệnh SELECT
*/
CREATE PROCEDURE GetAllStudents
AS
SELECT * FROM Students;


/* 
    Stored Procedure: Lấy sinh viên theo tuổi tối thiểu
    - Tham số đầu vào: @MinAge
    - Chỉ có 1 lệnh SELECT
*/
CREATE PROCEDURE GetStudentsByMinAge
    @MinAge INT
AS
SELECT * FROM Students
WHERE Age >= @MinAge;


/* 
    Stored Procedure: Đếm số sinh viên
    - Tham số đầu ra: @Total (OUTPUT)
    - Chỉ có 1 lệnh SELECT gán giá trị
*/
CREATE PROCEDURE CountStudents
    @Total INT OUTPUT
AS
SELECT @Total = COUNT(*) FROM Students;
