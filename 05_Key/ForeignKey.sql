/*
    Bảng Enrollments
    - EnrollmentID: PRIMARY KEY (PK)
    - StudentID: FOREIGN KEY (FK) → tham chiếu tới Students(StudentID)
    - ClassID: FOREIGN KEY (FK) → tham chiếu tới Classes(ClassID)
*/
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    ClassID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);