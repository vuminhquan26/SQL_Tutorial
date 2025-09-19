/*
    DATETIME
    Lưu trữ cả ngày và giờ (năm-tháng-ngày + giờ:phút:giây).
    Phạm vi: từ '1753-01-01 00:00:00.000' đến '9999-12-31 23:59:59.997'.
    Độ chính xác: khoảng 1/300 giây.
    Kích thước lưu trữ: 8 byte.
*/
CREATE TABLE demo_datetime(
    myDateTime DATETIME
);