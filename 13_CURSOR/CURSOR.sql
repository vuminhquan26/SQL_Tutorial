/* CON TRỎ LÀ ĐỐI TƯỢNG CHO PHÉP DI CHUYỂN TỪNG HÀNG CẢU KẾT QUẢ THAY VÌ TRUY VẤN CẢ TOÀN BỘ DỮ LIỆU

	VÒNG ĐỜI CỦA CON TRỎ
	DECLARE -> OPEN -> FETCH -> CLOSE -> DEALLOCATE
	______________________________________________
	KHAI BÁO CON TRỎ
	DECLARE	cursor_name CURSOR
		FOR select_statement;
	_____________________________________________
	MỞ VÀ ĐIỀN CON TRỎ
	OPEN cursor_name;
	_____________________________________________
	NẠP DỮ LIỆU MỘT HÀNG TỪ CON TRỎ VÀO 1 HOẶC NHIỀU BIẾN
	FETCH NEXT FROM cursor INTO variable_list;
	_____________________________________________
	NẠP TẤT CẢ DỮ LIỆU CỦA CÁC HÀNG TỪ CON TRỎ 

	WHILE @@FETCH_STATUS = 0
		BEGIN
			FETCH NEXT FROM cursor_name;
		END;
	__________________________________________________
	ĐÓNG CON TRỎ

	CLOSE cursor_name;
	____________________________________________________
	GIẢI PHÓNG BỘ NHỚ
	DEALLOCATE cursor_name
*/

--Khai báo biến @id, @title để lưu nội dung đọc
DECLARE @id int
DECLARE @title nvarchar(200)

DECLARE cursorProduct CURSOR FOR -- khai báo con trỏ cursorProduct
SELECT id, title FROM Product -- dữ liệu trỏ tới
OPEN cursorProduct -- Mở con trỏ
FETCH NEXT FROM cursorProduct -- Đọc dòng đầu tiên
INTO @id, @title
WHILE @@FETCH_STATUS = 0 --vòng lặp WHILE khi đọc Cursor thành công
BEGIN

--In kết quả hoặc thực hiện bất kỳ truy vấn
--nào dựa trên kết quả đọc được

PRINT 'ID:' + CAST(@id as nvarchar)
PRINT 'TITLE:' @title
FETCH NEXT FROM cursorProduct -- Đọc dòng tiếp
INTO @id, @title

END
CLOSE cursorProduct -- Đóng Cursor
DEALLOCATE cursorProduct -- Giải phóng tài nguyên