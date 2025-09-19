/* 
    TRIGGER trong SQL Server
    ------------------------
    1. Khái niệm:
       - Trigger là một đoạn code tự động chạy khi có sự kiện (INSERT, UPDATE, DELETE) xảy ra trên bảng.
       - Dùng để kiểm tra ràng buộc, log dữ liệu, hoặc đồng bộ dữ liệu.

    2. Đặc điểm:
       - Gắn trực tiếp vào bảng.
       - Có 2 loại chính:
            + AFTER Trigger (chạy sau khi thao tác xong) → mặc định.
            + INSTEAD OF Trigger (thay thế thao tác).
       - Có thể truy cập bảng ảo: 
            + INSERTED (chứa dữ liệu mới sau khi INSERT/UPDATE).
            + DELETED (chứa dữ liệu cũ trước khi DELETE/UPDATE).
*/

/* ===============================
   1. DỮ LIỆU BAN ĐẦU
   =============================== */
-- Bảng sinh viên
SELECT * FROM Students
-- Bảng môn học
SELECT * FROM Courses
-- Bảng đăng ký học
SELECT * FROM Enrollments


/* ===============================
   2. TRIGGER: TỰ ĐỘNG TRỪ SỐ LƯỢNG CHỖ TRỐNG TRONG MÔN HỌC
   =============================== */
CREATE TRIGGER trg_insert_enrollment 
ON Enrollments 
FOR INSERT
AS
BEGIN
    UPDATE Courses
    SET AvailableSlots = AvailableSlots - i.Quantity
    FROM Courses c
    JOIN inserted i ON c.CourseId = i.CourseId
END

-- Test: sinh viên đăng ký môn học (CourseId=2, Quantity=1)
INSERT INTO Enrollments VALUES (1, 2, 1)

-- Xem lại bảng Courses sau khi đăng ký
SELECT * FROM Courses


/* ===============================
   3. TRIGGER: LƯU LỊCH SỬ THAY ĐỔI HỌC PHÍ
   =============================== */
CREATE TABLE CourseFeeHistory(
    id INT IDENTITY PRIMARY KEY,
    courseId INT FOREIGN KEY REFERENCES Courses(CourseId),
    oldFee DECIMAL(10,2),
    createDate DATETIME DEFAULT GETDATE()
)

CREATE TRIGGER trg_update_course_fee 
ON Courses 
AFTER UPDATE
AS
BEGIN
    INSERT INTO CourseFeeHistory(courseId, oldFee)
    SELECT d.CourseId, d.Fee
    FROM deleted d
    JOIN inserted i ON d.CourseId = i.CourseId
    WHERE d.Fee <> i.Fee
END

-- Test: cập nhật học phí
UPDATE Courses
SET Fee = 1500
WHERE CourseId = 1

-- Xem bảng lịch sử học phí
SELECT * FROM CourseFeeHistory


/* ===============================
   4. INSTEAD OF TRIGGER
   =============================== */
-- Ngăn không cho xóa sinh viên → chỉ cập nhật IsActive = 0
CREATE TRIGGER trg_delete_student
ON Students
INSTEAD OF DELETE
AS
BEGIN
    UPDATE Students
    SET IsActive = 0
    WHERE StudentId IN (SELECT StudentId FROM deleted)

    PRINT N'Không xóa sinh viên, chỉ cập nhật IsActive = 0'
END

-- Test: xóa sinh viên có ID = 3
DELETE FROM Students WHERE StudentId = 3

-- Kết quả: sinh viên không bị xóa mà chỉ IsActive = 0
SELECT * FROM Students


/* ===============================
   5. XEM LẠI NỘI DUNG TRIGGER
   =============================== */
sp_helptext [trg_insert_enrollment]