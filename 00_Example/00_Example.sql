-- Nhóm	Ý nghĩa	Lệnh
-- DQL	Lấy dữ liệu	SELECT
-- DML	Thao tác dữ liệu	INSERT, UPDATE, DELETE
-- DDL	Tạo cấu trúc	CREATE, ALTER, DROP
-- DCL	Phân quyền	GRANT, REVOKE
-- TCL	Transaction	COMMIT, ROLLBACK
/*
    1. SQL chuẩn (Standard SQL)
    - Chỉ tập trung vào truy vấn và thao tác dữ liệu.
    - Ví dụ: SELECT, INSERT, UPDATE, DELETE, CREATE TABLE...
        + SELECT: truy vấn dữ liệu.
        + INSERT: thêm dữ liệu mới.
        + UPDATE: sửa dữ liệu.
        + DELETE: xóa dữ liệu.
        + CREATE TABLE: tạo bảng mới.
        + ALTER TABLE: sửa cấu trúc bảng.

    2. T-SQL (Transact-SQL)
    - Phiên bản mở rộng của SQL do Microsoft phát triển.
    - Hỗ trợ thêm các tính năng lập trình như biến, điều kiện, vòng lặp, thủ tục lưu trữ...
    - Ví dụ: DECLARE, SET, IF...ELSE, WHILE, CREATE PROCEDURE...
        + DECLARE: khai báo biến.
        + SET: gán giá trị cho biến.
        + IF...ELSE: cấu trúc điều kiện.
        + WHILE: vòng lặp.
        + CREATE PROCEDURE: tạo thủ tục lưu trữ.

    3. Trigger trong T-SQL:
    - Là một loại thủ tục tự động thực thi khi có sự kiện xảy ra trên bảng (INSERT, UPDATE, DELETE).
    - Có 2 loại trigger chính:
            + BEFORE Trigger (chạy trước khi thao tác) → không được hỗ trợ trong SQL Server.
            + AFTER Trigger (chạy sau khi thao tác) → mặc định.
        - Trigger có thể truy cập bảng ảo:
            + INSERTED (chứa dữ liệu mới sau khi INSERT/UPDATE).
            + DELETED (chứa dữ liệu cũ trước khi DELETE/UPDATE).

    4. Cursor trong T-SQL:
    - Là một đối tượng cho phép di chuyển qua từng hàng của kết quả truy vấn.    
    - Vòng đời của cursor: DECLARE → OPEN → FETCH → CLOSE → DEALLOCATE.
        + DECLARE: khai báo cursor.
        + OPEN: mở cursor.
        + FETCH: đọc dữ liệu từ cursor vào biến.
        + CLOSE: đóng cursor.
        + DEALLOCATE: giải phóng tài nguyên của cursor.
    - Sử dụng cursor khi cần xử lý từng dòng dữ liệu một cách tuần tự, nhưng nên hạn chế vì hiệu suất thấp.

    5. Cascade trong SQL Server:
    - Là một tính năng cho phép tự động cập nhật hoặc xóa dữ liệu liên quan khi có thay đổi ở bảng chính.
    - Ví dụ: ON DELETE CASCADE, ON UPDATE CASCADE trong ràng buộc
        FOREIGN KEY. Khi một bản ghi ở bảng chính bị xóa hoặc cập nhật, các bản ghi liên quan ở bảng phụ cũng sẽ bị xóa hoặc cập nhật theo.
*/