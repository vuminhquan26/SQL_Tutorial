/*
    Bảng Students
    - StudentID: PRIMARY KEY (PK) → định danh duy nhất mỗi sinh viên
*/
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Age INT
);

/*
    Bảng Classes
    - ClassID: PRIMARY KEY (PK) → định danh duy nhất mỗi lớp
*/
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName NVARCHAR(50)
);
