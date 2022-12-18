create DATABASE QuanLyNhaHang
CREATE TABLE CuaHang
(
	MaCuaHang CHAR(4) NOT NULL,
	MaQuanLy CHAR(4) NOT NULL,
	CONSTRAINT PK_CuaHang PRIMARY KEY (MaCuaHang),
)


alter table cuahang
add TenCuaHang varchar(30)


alter table Nguoiquanly
alter column DiaChi nvarchar(200)


alter table CuaHang
add NgayThanhLap datetime

alter table cuahang
drop constraint FK_CuaHangMaQuanLy

alter table nhanvien
drop constraint FK_MaNhanVien_CuaHang

alter table nhanvien
drop column macuahang

create TABLE NguoiQuanLy
(
	MaQuanLy Char(4) not null constraint PK_NguoiQuanLy primary key,
	MaCuaHang char(4) not null,
	constraint FK_CuaHang FOREIGN key (MaCuaHang) REFERENCES CuaHang(MaCuaHang),
	TenQuanLy nvarchar(30),
	SoDienThoai varchar(12),
	TenNguoiDung varchar(20),
	MatKhau varchar(30),
)

alter table NguoiQuanLy
add NgayThamGia datetime

alter table NhanVien
alter column ImgUrl VARCHAR(MAX)

alter table NguoiQuanLy
Add NgaySinh datetime
alter table nhanvien
alter column diachi varchar(200)

drop table NguoiQuanLy

CREATE TABLE NhanVien
(
	MaNV CHAR(4) NOT NULL,
	MaCuaHang CHAR(4) NOT NULL,
	HoTen NVARCHAR(40),
	GioiTinh VARCHAR(10),
	NgaySinh SMALLDATETIME,
	DiaChi VARCHAR(50),
	Luong MONEY,
	SoDienThoai VARCHAR(20),
	NgayVaoLam SMALLDATETIME,
    TenNguoiDung VARCHAR(20) UNIQUE,
    MatKhau VARCHAR(30),
	CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV),
)

alter table Nhanvien
add MaQuanLy char(4)
alter table Nhanvien
add constraint FK_MaNhanVien_NguoiQuanLy FOREIGN KEY (MaQuanLy) REFERENCES NguoiQuanLy(MaQuanLy)



CREATE TABLE MonAn
(
	MaMonAn CHAR(4) NOT NULL,
	TenMonAn NVARCHAR(40),
	Gia MONEY,
	ImgExtension VARCHAR(5),
	CONSTRAINT PK_MAMONAN PRIMARY KEY (MAMONAN),
)

alter table monan
add MaCuaHang char(4)
alter table monan
add constraint FK_MaMonAn_CuaHang FOREIGN KEY (MaCuaHang) REFERENCES CuaHang(MaCuaHang)

CREATE TABLE BanAn
(
	MaBanAn CHAR(4) NOT NULL,
	Loai NVARCHAR(6),
    TrangThai NVARCHAR(10) DEFAULT N'Trống',
	CONSTRAINT PK_MABANAN PRIMARY KEY (MABANAN),
)
alter table BanAn
add MaCuaHang char(4)
alter table BanAn
add constraint FK_MaBanAn_CuaHang FOREIGN KEY (MaCuaHang) REFERENCES CuaHang(MaCuaHang)

alter table banan add constraint DF_BanAn_TrangThai DEFAULT N'Trống' for Trangthai 

CREATE TABLE NguoiDung
(
	HoTen NVARCHAR(40),
	SoDienThoai VARCHAR(20),
	CONSTRAINT PK_MANGUOIDUNG PRIMARY KEY (TenNguoiDung),
	TenNguoiDung VARCHAR(20) UNIQUE,
    MatKhau VARCHAR(30),
)
SELECT * from NhanVien
create table DonHang
(
	SoDonHang int NOT NULL ,
	NgayLapDonHang SMALLDATETIME,
	TenNguoiDung VARCHAR(20),
	TriGia MONEY ,
	TieuDe NVARCHAR(50),
	GhiChu NVARCHAR(50),
	MaNV CHAR(4),
	CONSTRAINT PK_SoDonHang PRIMARY KEY (SoDonHang),
	CONSTRAINT FK_TenNguoiDung FOREIGN KEY (TenNguoiDung) REFERENCES NGUOIDUNG (TenNguoiDung),
	CONSTRAINT FK_MANV_DONHANG FOREIGN KEY (MaNV) REFERENCES NHANVIEN (MaNV),
)

CREATE TABLE ChiTietDonHang
(
	SoDonHang INT NOT NULL,
	MaMonAn CHAR(4) NOT NULL,
	SoLuong INT,
	CONSTRAINT PK_SoDonHang_MAMONAN PRIMARY KEY (SoDonHang,MaMonAn),
	CONSTRAINT FK_SoDonHang FOREIGN KEY (SoDonHang) REFERENCES DonHang (SoDonHang),
	CONSTRAINT FK_MAMONAN_ChiTietDonHang FOREIGN KEY (MaMonAn) REFERENCES MONAN (MaMonAn),
)


create table HoaDon
(
	SoHoaDon int NOT NULL ,
	NgayLapHoaDon SMALLDATETIME,
	MaBanAn CHAR(4),
	TriGia MONEY ,
	CONSTRAINT PK_SoHoaDon PRIMARY KEY (SoHoaDon),
	CONSTRAINT FK_MABANAN FOREIGN KEY (MaBanAn) REFERENCES BANAN (MaBanAn),
	CONSTRAINT FK_MANV FOREIGN KEY (MaNV) REFERENCES NHANVIEN (MaNV),
)
SELECT * from hoadon

ALTER TABLE HoaDon
ADD CONSTRAINT DF_HoaDon_TriGia DEFAULT 0 FOR TriGia

alter table hoadon
drop column MaNV

alter table hoadon
drop constraint FK_HoaDon_NguoiQuanLy FOREIGN KEY (MaQuanLy) REFERENCES NguoiQuanLy(MaQuanLy)
alter table hoadon
drop column maquanly

alter table hoadon drop CONSTRAINT FK_MaNV

CREATE TABLE ChiTietHoaDon
(
	SoHoaDon INT NOT NULL,
	MaMonAn CHAR(4) NOT NULL,
	SoLuong INT,
	CONSTRAINT PK_SoHoaDon_MAMONAN PRIMARY KEY (SoHoaDon,MaMonAn),
	CONSTRAINT FK_SoHoaDon FOREIGN KEY (SoHoaDon) REFERENCES HOADON (SoHoaDon),
	CONSTRAINT FK_MAMONAN FOREIGN KEY (MaMonAn) REFERENCES MONAN (MaMonAn),
)
drop table ChiTietHoaDon
alter table HoaDon
Drop column manv

CREATE TABLE ChiTietDatBan (
	MaDatBan char(4) not null constraint PK_ChiTietDatBan PRIMARY KEY,
	MaBan char(4),
	NguoiDat nvarchar(30),
	SoDienThoai varchar(12),
	GhiChu nvarchar(100),
	TrangThai tinyint constraint DF_ChiTietDatBan_TrangThai DEFAULT 1,
	NgayDat datetime constraint DF_ChiTietDatBan_NgayDat default GETDATE(),
	constraint FK_ChiTietDatBan_MaBan FOREIGN KEY (MaBan) REFERENCES BanAn(MaBanAn)
)



SELECT * from ChiTietDatBan
drop table ChiTietDatBan
DELETE from chitietdatban

Alter table ChiTietDatBan add constraint FK_ChiTietDatBan_MaBan
FOREIGN KEY (MaBan) REFERENCES BanAn(MaBanAn)

alter table chitietdatban
drop constraint FK_ChiTietDatBan_MaNhanVien
alter table chitietdatban
drop column manv


Alter table chitietdatban
add TrangThai tinyint

Alter table chitietdatban
add MaNV char(4) constraint FK_ChiTietDatBan_MaNhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)

ALTER TABLE ChiTietHoaDon
ADD SoLuong int DEFAULT 0

ALTER TABLE ChiTietHoaDon
DROP COLUMN SoLuong

select * from NhanVien

/*Giá bán của sản phẩm từ 0 đồng trở lên*/
ALTER TABLE MONAN
ADD CONSTRAINT GIA_CHECK CHECK(GIA>0)

ALTER TABLE ChiTietHoaDon
DROP CONSTRAINT SoLuong_CHECK

ALTER TABLE NHANVIEN ADD CONSTRAINT ngayvaolam_CHECK CHECK(NgayVaoLam>NGaySINH)

ALTER TABLE ChiTietHoaDon ADD CONSTRAINT SoLuong_CHECK CHECK(SoLuong>=1)

alter table hoadon
drop trigger ngaylaphoadon_ngayvaolam_hoad_update


-- CREATE TRIGGER ngaylaphoadon_ngayvaolam_hoad_update
-- ON hoadon 
-- AFTER UPDATE
-- AS 
-- IF (UPDATE (manv) OR UPDATE (ngaylaphoadon))
-- BEGIN
-- 	DECLARE @ng_hoadon smalldatetime 
-- 	DECLARE @ng_vaolam smalldatetime 
-- 	SELECT @ng_hoadon=ngaylaphoadon, @ng_vaolam=ngayvaolam
-- 	FROM NHANVIEN, inserted
-- 	WHERE NHANVIEN.MANV=inserted.MANV
-- 	IF @ng_hoadon< @ng_vaolam
-- 	BEGIN
-- 		rollback transaction
-- 		print  N'Ngày hóa đơn phải lớn hơn ngày vào làm'
-- 	END
-- END

-- CREATE TRIGGER ngaylaphoadon_ngayvaolam_nhanvien_update
-- ON nhanvien
-- AFTER UPDATE
-- AS 
-- 	DECLARE @ng_vaolam smalldatetime, @manhvien char(4)
-- 	SELECT @ng_vaolam=ngayvaolam, @manhvien=manv
-- 	FROM inserted
-- IF (UPDATE (ngayvaolam))
-- BEGIN
-- 	IF (EXISTS (SELECT * 
-- 	FROM hoadon 
-- 	WHERE manv=@manhvien AND @ng_vaolam>ngaylaphoadon))
-- 	BEGIN
-- 		rollback transaction
-- 	print N' Thao tác sửa ngày vào làm phải nhỏ hơnn gày hóa đơn'
-- END
-- END


-- CREATE TRIGGER trg_del_ChiTietHoaDon ON ChiTietHoaDon
-- FOR Delete
-- AS
-- BEGIN
-- 	IF ((SELECT COUNT(*) FROM deleted WHERE SoHoaDon = deleted.SoHoaDon)
-- 		= (SELECT COUNT(*) FROM HoaDon, deleted WHERE deleted.SoHoaDon = HoaDon.SoHoaDon))
-- 	BEGIN
-- 		PRINT N'Error: Mỗi một hóa đơn phải có ít nhất một chi tiết hóa đơn'
-- 		ROLLBACK TRANSACTION
-- 	END
-- END


-- /*Trị giá của một hóa đơn là tổng thành tiền (số lượng*đơn giá) của các chi tiết thuộc hóa đơn đó.
-- */

-- CREATE TRIGGER trigia_hoad_insert
-- ON hoadon 
-- AFTER INSERT 
-- AS 
-- 	DECLARE @trigia_hoadon money 
-- 	DECLARE @SoLuong_ChiTietHoaDon int
-- 	DECLARE @gia_monan money
-- 	SELECT @trigia_hoadon=TRIGIA, @SoLuong_ChiTietHoaDon=SoLuong,@gia_monan=GIA
-- 	FROM ChiTietHoaDon, MONAN,inserted
-- 	WHERE ChiTietHoaDon.MAMONAN=MONAN.MAMONAN AND ChiTietHoaDon.SoHoaDon=inserted.SoHoaDon
-- IF @trigia_hoadon!= SUM(@SoLuong_ChiTietHoaDon*@gia_monan)
-- BEGIN
-- 	rollback transaction
-- 	print N'Trị giá của một hóa đơn là tổng thành tiền (số lượng*đơn giá) của các chi tiết thuộc hóa đơn đó.'
-- END;



INSERT INTO MONAN(MAMONAN,TENMONAN,GIA, MaCuaHang) VALUES ('M01',N'Súp cá hồi',50000, 'CH02')
INSERT INTO MONAN(MAMONAN,TENMONAN,GIA, MaCuaHang) VALUES ('M02',N'Rau bí xào',26000, 'CH02')
INSERT INTO MONAN(MAMONAN,TENMONAN,GIA, MaCuaHang) VALUES ('M03',N'Nộm rau má',26500, 'CH02')
INSERT INTO MONAN(MAMONAN,TENMONAN,GIA, MaCuaHang) VALUES ('M04',N'Khoai tây chiên',30000,'CH02')
INSERT INTO MONAN(MAMONAN,TENMONAN,GIA, MaCuaHang) VALUES ('M05',N'Bánh bao chiên',30500, 'CH02')
INSERT INTO MONAN(MAMONAN,TENMONAN,GIA) VALUES ('M06',N'Bánh hỏi',30500)
INSERT INTO MONAN(MAMONAN,TENMONAN,GIA) VALUES ('M07',N'Gà rán',45000)
INSERT INTO MONAN(MAMONAN,TENMONAN,GIA) VALUES ('M08',N'Khoai tây lắc phô mai',25500)
INSERT INTO MONAN(MAMONAN,TENMONAN,GIA) VALUES ('M09',N'Bò bít tết',80500)
INSERT INTO MONAN(MAMONAN,TENMONAN,GIA) VALUES ('M10',N'Cá diêu hồng',20000)
SELECT * FROM MONAN

delete from MonAn
where MaMonAn='m02'

alter table monan
add ImgSource varchar(8)

INSERT INTO BANAN(MABANAN,LOAI) VALUES ('B01',N'Thường')
INSERT INTO BANAN(MABANAN,LOAI) VALUES ('B02',N'Thường')
INSERT INTO BANAN(MABANAN,LOAI) VALUES ('B03',N'Vip')
INSERT INTO BANAN(MABANAN,LOAI) VALUES ('B04',N'Thường')
INSERT INTO BANAN(MABANAN,LOAI) VALUES ('B05',N'Thường')
INSERT INTO BANAN(MABANAN,LOAI, TrangThai) VALUES ('B06',N'Thường', N'Có khách')
INSERT INTO BANAN(MABANAN,LOAI, TrangThai) VALUES ('B07',N'VIP', N'Đã đặt')
INSERT INTO BANAN(MABANAN,LOAI, TrangThai) VALUES ('B08',N'VIP', N'Trống')
select * from banan

delete from banan
where MaBanAn='b08'

insert into HoaDon(SoHoaDon, MaBanAn, TriGia) values (1, 'B03', 10000)
insert into HoaDon(SoHoaDon, MaBanAn, TriGia) values (2, 'B05', 10000)
SELECT * from HoaDon

insert into ChiTietHoaDon(MaMonAn, SoHoaDon, SoLuong) values ('M01', 1, 1)
insert into ChiTietHoaDon(MaMonAn, SoHoaDon, SoLuong) values ('M02', 1, 1)
insert into ChiTietHoaDon(MaMonAn, SoHoaDon, SoLuong) values ('M02', 2, 1)
insert into ChiTietHoaDon(MaMonAn, SoHoaDon, SoLuong) values ('M04', 2, 3)

delete from nhanvien
where MaNV='nv01'

SELECT * from NhanVien
SELECT * from NguoiQuanlY


select * from ChiTietHoaDon
select * from HoaDon
DELETE from hoadon
DELETE from NhanVien


select BanAn.TrangThai, MaMonAn, SoLuong, ChiTietHoaDon.SoHoaDon, BanAn.MaBanAn from ChiTietHoaDon, HoaDon, BanAn
where ChiTietHoaDon.SoHoaDon = HoaDon.SoHoaDon and BanAn.MaBanAn = HoaDon.MaBanAn


DROP TRIGGER trg_del_ChiTietHoaDon;

delete from ChiTietHoaDon
delete from hoadon

delete from nhanvien

select MaMonAn,SoLuong, HoaDon.SoHoaDon, MaBanAn from ChiTietHoaDon, HoaDon
where HoaDon.SoHoaDon=ChiTietHoaDon.SoHoaDon

select * from ChiTietHoaDon
DELETE from ChiTiethoadon
where SoHoaDon=1

select * from HoaDon
DELETE from HoaDon
alter table hoadon
add TrangThai tinyint
alter table hoadon
add ThoiGianThanhToan DATETIME
select * from MonAn
select * from BanAn
delete from MonAn
delete from banan
where MaMonAn='M15'
SELECT * from BanAn
select distinct SoLuong,MaBanAn, TrangThai, MaMonAn from ChiTietHoaDon, BanAn
where TrangThai=N'Có khách'
update BanAn set TrangThai=N'Trống'

select * from chitietdatban
delete from chitietdatban

select * from cuahang

ALTER TABLE CuaHang
NOCHECK CONSTRAINT FK_CuaHangMaQuanLy
insert into CuaHang (MaCuaHang, MaQuanLy, TenCuaHang) VALUES ('CH01', 'NV01', 'FoodeLive')
insert into NhanVien (MaNV, TenNguoiDung, MatKhau, MaCuaHang) VALUES ('NV01', 'tuankietcoder', '1','CH01')
select * from cuahang

delete from CuaHang
delete from NhanVien
delete from NguoiQUanLy

where MaCuaHang='ch01'
select * from Nguoiquanly

select * from NhanVien
SELECT * from chitiethoadon

select * from monan

alter table monan
add ImgUrl varchar(Max)