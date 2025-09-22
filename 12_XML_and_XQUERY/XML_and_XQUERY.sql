/*
	XML trong SQL Server
	1. Khái niệm
	- XML là định dạng dữ liệu sử dụng để truyền tải giữa các hệ thống(Thành Phần API)
	+ (API là viết tắt của Application Programming Interface hay còn gọi là giao diện lập trình ứng dụng)

	- JSON là đối tượng hoặc các mảng đối tượng
	+ Trong đối tượng JSON sẽ có 1 cặp dữ liệu KEY-VALUE đi chung với nhau
	+ KEY cần viết dạng chuỗi
	+ VALUE là các dữ liệu căn bản( hoặc có thể là mảng/ đối tượng JSON khác)

	_______________________________________
	|DEMO XML CHỈ CÓ 1 XML CHỨA 1 SINH VIÊN|
	______________________________________________________________________________________________________________________________________
	|<xml version="1.0" charset="UTF-8">                                                                                                 |
	|// Khai báo sử dụng tài liệu XML đang sử dụng phiên bản 1.0 và bảng mã UTF-8                                                        |
	|                                                                                                                                    |
	|<sinhvien svid="123456" address="Tây Hải Phòng">                                                                                    |
	|   <hovaten>Lê Bá Ôn</hovaten>                                                                                                      |
	|   <ngaysinh>2005-11-02</ngaysinh>                                                                                                  |
	|   <gioitinh>Pê đê</gioitinh>                                                                                                       |
	|</sinhvien>                                                                                                                         |
	|                                                                                                                                    |
	|THUỘC TÍNH CỦA THẺ SINHVIEN                                                                                                         |
	|// <sinhvien>...</sinhvien> là thẻ gốc (root element) đại diện cho một sinh viên và chứa các thuộc tính cũng như các thẻ con khác   |
	|// svid = '...' là một thuộc tính của thẻ <sinhvien> có giá trị là .... Đây có thể là mã sinh viên                                  |
	|// address = '...' là một thuộc tính khác của thẻ <sinhvien> có thể là lấy giá trị địa chỉ                                          |
	|                                                                                                                                    |
	|CÁC THẺ CÒN CỦA THẺ SINH VIÊN                                                                                                       |
	|// <hovaten> : chứa tên đầy đủ của sinh viên                                                                                        |
	|// <ngaysinh> : chứa thông tin về ngày sinh của sinh viên                                                                           |
	|// <gioitinh> : chứa thông tin về giới tính của sinh viên                                                                           |
	|____________________________________________________________________________________________________________________________________|


	____________________________________________
	|DEMO XML CHỈ CÓ 1 XML CHỨA NHIỀU SINH VIÊN|
	_________________________________________________
	|<xml version="1.0" charset="UTF-8">            |
	|<dsSinhVien>                                   |
	|	<sinhvien svid="1" address="Tây Hải Phòng"> |
	|		<hovaten>Lê Bá Ôn</hovaten>             |
	|		<ngaysinh>2005-11-02</ngaysinh>         |
	|		<gioitinh>Pê đê</gioitinh>              |
	|	</sinhvien>                                 |
	|	<sinhvien svid="2" address="Đông Hải Phòng">|
	|		<hovaten>Phan Hoàng Mai Nhi</hovaten>   |
	|		<ngaysinh>2005-09-22</ngaysinh>         |
	|		<gioitinh>LGBT</gioitinh>               |
	|	</sinhvien>                                 |
	|</dsSinhVien>                                  |
	|_______________________________________________|

	<!-- Đảm bảo trong tập tin XML chỉ có DUY NHẤT 1 thẻ root gốc -->   
	<!-- Tương tự HTML chỉ có 1 thẻ html ở root gốc duy nhất -->
	<!-- Hệ thống API xây dựng theo RESTful -->
	- API RESTful là một kiểu giao diện lập trình ứng dụng dựa trên tiêu chuẩn RESt
	+ REST (Representational State Transfer) Chuyển giao trạng thái biểu diễn 

	JSON TRONG SQL
	
	JSON CHỈ CÓ 1 SINH VIÊN
	{
		"ho_va_ten" : "Lê Văn Tùng",
		"gioi_tinh" : true,
		"ngay_sinh" : "2004-09-18",
		"hoc_phi" : 489.56
	}

	JSON CÓ NHIỀU SINH VIÊN
	[
		{
			"ho_va_ten" : "Lê Văn Tùng",
			"gioi_tinh" : true,
			"ngay_sinh" : "2004-09-18",
			"hoc_phi" : 489.56
		},
		{
			"ho_va_ten" : "Hoàng Thị Loan",
			"gioi_tinh" : true,
			"ngay_sinh" : "2004-09-18",
			"hoc_phi" : 489.56
		}
	]
*/


/* DEMO THAO TÁC VỚI DỮ LIỆU */

-- Tạo bảng
CREATE TABLE Products(
	ProductId int IDENTITY PRIMARY KEY,
	ProductName nvarchar(50) NOT NULL,
	ProductDetail xml
)

-- Thêm dữ liệu
INSERT INTO Products 
VALUES
	(N'Oppo Reno 15', N'
		<details>
			<price>356</price>
			<features>
				<feature>Màn cảm ứng</feature>
				<feature>Sạc không dây</feature>
			</features>
		</details>
	'),
	(N'Laptop HP Ellitebook', N'
		<details>
			<price>498</price>
			<features>
				<feature>Ram 32Gb</feature>
				<feature>1Tb SSD</feature>
				<feature>Bàn phím cơ</feature>
			</features>
		</details>
	')

-- Truy vấn lấy dữ liệu bảng Products
SELECT * 
FROM Products
-- Lệnh trên trả về tất cả các dữ liệu trong bảng Products, bao gồm tất cả các cột.
-- Dấu * đại diện cho tất cả các cột trong bảng.

-- Truy vấn lấy giá trị trong cột XML: sử dụng XQuery để chỉ định lấy dữ liệu
SELECT p.ProductId, p.ProductName,
       p.ProductDetail.value('(/details/price)[1]', 'decimal(10,2)') AS 'Giá'
FROM Products p
-- Câu lệnh này trích xuất giá trị của phần tử <price> từ cột ProductDetail (kiểu XML).
-- Sử dụng phương thức .value để trích xuất giá trị và chuyển thành kiểu dữ liệu decimal(10,2).
-- (/details/price)[1] là đường dẫn XQuery để chỉ định phần tử <price> trong XML. [1] lấy phần tử đầu tiên.

-- Truy vấn lấy dữ liệu XML
SELECT p.ProductId, p.ProductName,
       p.ProductDetail.query('(/details/features)') AS 'Tính năng'
FROM Products p
-- Câu lệnh này sẽ trả về toàn bộ phần tử <features> (dưới dạng XML), bao gồm tất cả các thẻ <feature> của sản phẩm.
-- Phương thức .query sẽ trả về dữ liệu dưới dạng XML thay vì giá trị đơn giản.

-- Thêm dữ liệu vào XML
UPDATE Products 
SET ProductDetail.modify(N'insert <feature>Wifi 6</feature> as first into (/details/features)[1]')
WHERE ProductId = 2
-- Câu lệnh này thêm phần tử <feature>Wifi 6</feature> vào đầu danh sách tính năng trong XML.
-- `as first` chỉ định vị trí thêm phần tử vào đầu danh sách <features>.

-- Cập nhật dữ liệu trong XML
UPDATE Products 
SET ProductDetail.modify(N'replace value of (/details/features/feature/text())[2] with "DDRAM 64Gb"')
WHERE ProductId = 2
-- Câu lệnh này thay thế giá trị của phần tử thứ 2 trong danh sách <feature> trong XML.
-- (/details/features/feature/text())[2] chọn phần tử <feature> thứ 2 và thay thế giá trị của nó.

-- Xóa dữ liệu trong XML
UPDATE Products 
SET ProductDetail.modify(N'delete (/details/features/feature)[4]')
WHERE ProductId = 2
-- Câu lệnh này xóa phần tử <feature> thứ 4 trong danh sách tính năng của sản phẩm có ProductId = 2.

-- Liệt kê tính năng
SELECT T1.ProductId, T1.ProductName, 
       T2.Feature.value('(.)','nvarchar(100)') AS 'Tính năng'
FROM Products T1
CROSS APPLY
T1.ProductDetail.nodes('/details/features/feature') AS T2(Feature)
-- CROSS APPLY kết hợp bảng Products với kết quả trả về từ phương thức .nodes() để phân tách các phần tử <feature> thành các dòng riêng biệt.
-- nodes() sẽ phân tích tài liệu XML và trả về một bảng với mỗi phần tử <feature> làm một dòng.

-- Thống kê số tính năng
SELECT T1.ProductName, 
       COUNT(T2.Feature.value('(.)','nvarchar(100)')) AS 'Số tính năng'
FROM Products T1
CROSS APPLY
T1.ProductDetail.nodes('/details/features/feature') AS T2(Feature)
GROUP BY T1.ProductName
-- Câu lệnh này đếm số lượng tính năng của mỗi sản phẩm, nhóm theo tên sản phẩm.
-- COUNT() đếm số lượng phần tử <feature> trong XML của mỗi sản phẩm.

-- Viết lệnh update thông tin dữ liệu XML của cột ProductDetail
UPDATE Products
SET ProductDetail = N'<details>
        <price>498</price>
        <features>
            <feature>Ram 16Gb</feature>
            <feature>1Tb SSD</feature>
            <feature>Bàn phím cơ</feature>
        </features>
    </details>'
WHERE ProductId = 2
-- Câu lệnh này thay thế toàn bộ nội dung XML trong cột ProductDetail của sản phẩm có ProductId = 2.
-- Toàn bộ thông tin XML được thay đổi, bao gồm giá và tính năng của sản phẩm.
