create database tour;

use tour;

create table diemdendulich(
id_DiemDen int auto_increment primary key,
TenDiemDen varchar(255),
MoTa varchar(255),
GiaTrungBinh int not null unique,
id_ThanhPho int,
foreign key (id_ThanhPho) references thanhpho(id_ThanhPho)
);

create table thanhpho(
id_ThanhPho int primary key,
TenThanhPho varchar(255)
);

create table khachhangdattour(
id_KhachHang int auto_increment primary key,
Ten varchar(255) not null,
CCCD varchar(255) unique not null,
NgaySinh Date not null,
id_ThanhPho int
);

create table loaitour(
id_LoaiTour int auto_increment primary key,
MaLoai varchar(50) unique not null,
TenLoai varchar(50) not null
);

create table bangtour(
id_BangTour int auto_increment primary key,
MaTour varchar(50) not null,
id_LoaiTour int not null,
GiaDiemDenDuLich int not null,
NgayBatDau date,
NgayKetThuc date,
foreign key (MaTour) references loaitour(MaLoai),
foreign key (id_LoaiTour) references loaitour(id_LoaiTour),
foreign key (GiaDiemDenDuLich) references diemdendulich(GiaTrungBinh)
);

create table hoadondattour(
id int auto_increment primary key,
id_BangTour int,
id_KhachHang int,
TrangThai varchar(50) not null,
foreign key (id_BangTour) references bangtour(id_BangTour), 
foreign key (id_KhachHang) references khachhangdattour(id_KhachHang) 
);

-- ----------Thêm CSDL-----------
INSERT INTO `tour`.`thanhpho` (`id_ThanhPho`, `TenThanhPho`) VALUES ('23', 'Hà Giang');
INSERT INTO `tour`.`thanhpho` (`id_ThanhPho`, `TenThanhPho`) VALUES ('35', 'Ninh Bình');
INSERT INTO `tour`.`thanhpho` (`id_ThanhPho`, `TenThanhPho`) VALUES ('47', 'Đắk Lắk');
INSERT INTO `tour`.`thanhpho` (`id_ThanhPho`, `TenThanhPho`) VALUES ('79', 'Nha Trang');
INSERT INTO `tour`.`thanhpho` (`id_ThanhPho`, `TenThanhPho`) VALUES ('75', 'Huế');

insert into diemdendulich(TenDiemDen, MoTa, GiaTrungBinh, id_ThanhPho) 
value ('Cột cờ Lũng Cú', 'Hiểm trở', 2350000, 23),
('Tràng An', 'Hữu tình', 650000, 35),
('Cà phê Trung Nguyên', 'Xứ sở cà phê', 4850000, 47),
('Vinpearl', 'Sôi động', 5380000, 79),
('Đại nội Huế', 'Cổ kính', 3950000, 75);

insert into khachhangdattour(Ten, CCCD, NgaySinh, id_ThanhPho) 
value ('Trung', 123456, '1994-01-01', 99),
('Huấn', 123457, '1998-01-01', 34),
('Nam', 123458, '2000-02-02', 29),
('Hùng', 123459, '2002-04-04', 34),
('Tiến', 123666, '1992-10-10', 99),
('Sáng', 123667, '1992-09-09', 12),
('Tuyến', 123668, '2001-10-10', 35),
('Cường', 123669, '1998-05-10', 38),
('Hào', 123777, '1994-11-11', 37),
('Vương', 123888, '1993-05-05', 30);

insert into loaitour (MaLoai, TenLoai) 
value ('KP01', 'Khám Phá'),
('ND02', 'Nghỉ Dưỡng');

insert into bangtour (MaTour, id_LoaiTour, GiaDiemDenDuLich, NgayBatDau, NgayKetThuc)
value ('KP01', 1, 2350000, '2020-03-03', '2020-03-05'),
('KP01', 1, 650000, '2020-03-05', '2020-03-05'),
('KP01', 1, 4850000, '2020-03-10', '2020-03-13'),
('KP01', 1, 3950000, '2020-03-20', '2020-03-22'),
('ND02', 2, 5380000, '2020-03-22', '2020-03-25'),
('KP01', 1, 2350000, '2020-03-10', '2020-03-12'),
('ND02', 2, 650000, '2020-03-12', '2020-03-12'),
('KP01', 1, 4850000, '2020-03-17', '2020-03-20'),
('KP01', 1, 3950000, '2020-03-27', '2020-03-29'),
('ND02', 2, 5380000, '2020-03-29', '2020-04-02'),
('KP01', 1, 2350000, '2020-04-05', '2020-04-07'),
('KP01', 1, 650000, '2020-04-05', '2020-04-05'),
('ND02', 2, 4850000, '2020-04-10', '2020-04-13'),
('KP01', 1, 3950000, '2020-04-20', '2020-04-22'),
('ND02', 2, 5380000, '2020-04-22', '2020-04-25');

insert into hoadondattour (id_BangTour, id_KhachHang, TrangThai)
value (1, 1, 'Sẵn Sàng'),
(2, 2, 'Sẵn Sàng'),
(3, 3, 'Sẵn Sàng'),
(4, 4, 'Sẵn Sàng'),
(4, 5, 'Sẵn Sàng'),
(8, 6, 'Sẵn Sàng'),
(11, 7, 'Sẵn Sàng'),
(12, 8, 'Sẵn Sàng'),
(13, 9, 'Sẵn Sàng'),
(15, 10, 'Sẵn Sàng');

-- ------------Truy vấn-----------------
-- 1. Thống kê số lượng Tour của các thành phố
select tp.TenThanhPho, count(*) as SoLuongTour from thanhpho tp
join diemdendulich dddl on dddl.id_ThanhPho = tp.id_ThanhPho
join bangtour t on t.GiaDiemDenDuLich = dddl.GiaTrungBinh
group by tp.TenThanhPho;

-- 2. Tính số Tour có ngày bắt đầu trong tháng 3/2020
select month(NgayBatDau) as 'Tháng 3/2020', count(*) as SoLuongTour from bangtour
where month(NgayBatDau) = 3;
-- group by month(NgayBatDau);

-- 3. Tính số lượng Tour có ngày kết thúc trong tháng 4/2020
select month(NgayKetThuc) as 'Tháng 4/2020', count(*) as SoLuongTour from bangtour
where month(NgayKetThuc) = 4;