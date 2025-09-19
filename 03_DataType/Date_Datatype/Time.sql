/*
    TIME(fractional_seconds)
    Lưu trữ giờ, phút, giây (có thể kèm phần thập phân giây).
    Phạm vi: 00:00:00.0000000 đến 23:59:59.9999999.
    Độ chính xác: tối đa 100 nanosecond.
    Kích thước lưu trữ: 3–5 byte tùy độ chính xác.
*/
CREATE TABLE demo_time(
    myTime TIME(7)
);