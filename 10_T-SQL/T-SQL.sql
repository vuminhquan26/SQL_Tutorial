/*
    T-SQL (Transact-SQL) trong SQL Server
    -------------------------------------
    1. Khái niệm:
       - T-SQL là phần mở rộng của ngôn ngữ SQL chuẩn (ANSI SQL),
         được Microsoft phát triển cho SQL Server.
       - Bao gồm tất cả các câu lệnh SQL chuẩn (SELECT, INSERT, UPDATE, DELETE)
         và bổ sung thêm nhiều tính năng nâng cao.

    2. Đặc điểm chính:
       - Hỗ trợ biến (DECLARE, SET).
       - Hỗ trợ cấu trúc điều khiển (IF...ELSE, WHILE, CASE).
       - Hỗ trợ thủ tục lưu trữ (Stored Procedure), hàm (Function), Trigger.
       - Có thể xử lý lỗi với TRY...CATCH.
       - Cho phép thao tác trực tiếp với hệ thống (system stored procedures).

    3. Cấu trúc cơ bản trong T-SQL:
       - DDL (Data Definition Language): CREATE, ALTER, DROP (tạo/sửa/xóa đối tượng DB).
       - DML (Data Manipulation Language): SELECT, INSERT, UPDATE, DELETE (truy xuất và thao tác dữ liệu).
       - DCL (Data Control Language): GRANT, REVOKE, DENY (phân quyền).
       - TCL (Transaction Control Language): BEGIN TRANSACTION, COMMIT, ROLLBACK (quản lý giao dịch).

    4. Ví dụ T-SQL:
       -- Khai báo biến và gán giá trị
       DECLARE @MinAge INT;
       SET @MinAge = 20;

       -- Dùng biến trong truy vấn
       SELECT * FROM Students
       WHERE Age >= @MinAge;

    5. Kết luận:
       - SQL chuẩn: chỉ tập trung vào truy vấn và thao tác dữ liệu.
       - T-SQL: mạnh hơn, có khả năng lập trình (biến, vòng lặp, điều kiện, thủ tục...).
*/



-- 1. Khai báo biến
DECLARE 
    @hoVaTen NVARCHAR(50),   -- Biến tên sinh viên
    @namSinh INT;            -- Biến năm sinh

-- Gán giá trị
SET @hoVaTen = N'Nguyễn Văn An';
SET @namSinh = 2002;

-- In ra màn hình
PRINT N'Họ và tên: ' + @hoVaTen;
PRINT N'Năm sinh: ' + CAST(@namSinh AS VARCHAR);
-- Có thể chuyển đổi kiểu dữ liệu bằng CAST hoặc CONVERT


-- 2. Khai báo biến và lấy dữ liệu từ bảng
DECLARE 
    @tongSV INT,      -- Tổng số sinh viên
    @tuoiTB FLOAT;    -- Tuổi trung bình

SELECT @tongSV = COUNT(*), @tuoiTB = AVG(Age) 
FROM Students;

PRINT N'Tổng số sinh viên: ' + CONVERT(VARCHAR, @tongSV) 
      + N' | Tuổi trung bình: ' + CONVERT(VARCHAR, @tuoiTB);


-- 3. Cấu trúc điều khiển IF...ELSE
DECLARE @mark FLOAT = 7.2;

IF @mark >= 8 AND @mark <= 10
    PRINT N'Học lực GIỎI';
ELSE IF @mark >= 5 AND @mark < 8
    PRINT N'Học lực KHÁ';
ELSE IF @mark >= 0 AND @mark < 5
    PRINT N'Thi lại';
ELSE
    PRINT N'Điểm không hợp lệ';


-- 4. Sử dụng CASE trong SELECT
SELECT s.StudentID, s.Name, s.Age,
    CASE
        WHEN s.Age >= 22 THEN N'Sắp tốt nghiệp'
        WHEN s.Age BETWEEN 18 AND 21 THEN N'Sinh viên đang học'
        WHEN s.Age < 18 THEN N'Học sinh THPT'
        ELSE N'Không hợp lệ'
    END AS 'Tình trạng'
FROM Students s;


-- 5. Vòng lặp WHILE
DECLARE @cnt INT = 1;
WHILE @cnt <= 5
BEGIN
    PRINT 'Bảng cửu chương 5 x ' + CONVERT(VARCHAR, @cnt) 
          + ' = ' + CONVERT(VARCHAR, 5 * @cnt);
    SET @cnt = @cnt + 1;  -- Tăng biến đếm
END;


-- 6. Viết hàm scalar function (tính thuế 8%)
CREATE FUNCTION fnTax(@price FLOAT) RETURNS FLOAT AS
BEGIN
    RETURN @price * 0.08;
END;

-- Gọi hàm scalar
SELECT s.StudentID, s.Name, s.Age, dbo.fnTax(s.Age) AS ThueTuoi
FROM Students s;


-- 7. Viết hàm table-valued function (tra cứu theo tuổi)
CREATE FUNCTION fnSearchByAge(@min INT, @max INT) RETURNS TABLE AS
RETURN (
    SELECT s.StudentID, s.Name, s.Age
    FROM Students s
    WHERE s.Age BETWEEN @min AND @max
);

-- Gọi hàm table-valued
SELECT * FROM fnSearchByAge(18, 22);

-- So sánh với query trực tiếp
SELECT s.StudentID, s.Name, s.Age
FROM Students s
WHERE s.Age BETWEEN 18 AND 22;