/* ================================
   INDEX & UNIQUE INDEX
   ================================ */

/*
    1. INDEX (chỉ mục)
    - Dùng để tăng tốc tìm kiếm, lọc dữ liệu.
    - Có 2 loại chính:
        + Clustered Index: sắp xếp dữ liệu vật lý trong bảng, mỗi bảng chỉ có 1.
        + Nonclustered Index: tạo cấu trúc riêng, có thể tạo nhiều (tối đa 999).
*/

/* Ví dụ: Nonclustered Index cho cột DiemTB */
CREATE NONCLUSTERED INDEX IX_SinhVien_DiemTB
ON SINH_VIEN(DiemTB);

/* Ví dụ: Clustered Index cho cột MaSV */
CREATE CLUSTERED INDEX IX_SinhVien_MaSV
ON SINH_VIEN(MaSV);



/*
    2. UNIQUE INDEX
    - Đảm bảo rằng các giá trị trong cột (hoặc nhóm cột) là duy nhất.
    - Tự động được tạo khi khai báo ràng buộc UNIQUE hoặc PRIMARY KEY.
    - Có thể tạo thủ công bằng CREATE UNIQUE INDEX.
*/

/* Ví dụ: Unique Index cho cột Email */
CREATE UNIQUE INDEX UQ_SinhVien_Email
ON SINH_VIEN(Email);
