/*
    Bảng Students
    - ID: khóa chính, tự động tăng
    - Name: tên sinh viên
    - Age: tuổi
*/
CREATE TABLE Students (
    ID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(50),
    Age INT
);
/*
    INSERT INTO: thêm bản ghi mới vào bảng
    Cú pháp:
    INSERT INTO table_name (column1, column2, ...)
    VALUES (value1, value2, ...);
*/
INSERT INTO Students (Name, Age)
VALUES 
    (N'Nguyen Van A', 20),
    (N'Tran Thi B', 22),
    (N'Le Van C', 21);
