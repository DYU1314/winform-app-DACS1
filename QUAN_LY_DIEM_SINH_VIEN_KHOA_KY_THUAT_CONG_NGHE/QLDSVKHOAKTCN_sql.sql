CREATE DATABASE db_QLDSVKKTCN
/*ON PRIMARY
(
	NAME = 'db_Quan_Ly_Diem_Sinh_Vien_Khoa_Ky_Thuat_Cong_Nghe',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\db_Quan_Ly_Diem_Sinh_Vien_Khoa_Ky_Thuat_Cong_Nghe.mdf',
	SIZE = 512MB,
	MAXSIZE = 4096MB,
	FILEGROWTH = 10%
)
LOG ON
(
	NAME = 'db_Quan_Ly_Diem_Sinh_Vien_Khoa_Ky_Thuat_Cong_Nghe_log',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\db_Quan_Ly_Diem_Sinh_Vien_Khoa_Ky_Thuat_Cong_Nghe_log.ldf',
	SIZE = 128MB,
	MAXSIZE = 2048MB,
	FILEGROWTH = 10%
)*/
GO
--------------------------------------------------------------------------------
USE db_QLDSVKKTCN
GO
--------------------------------------------------------------------------------
-- TÀI KHOẢN
-- KHÓA HỌC
-- KẾT QUẢ THI CUỐI KÌ
-- KẾT QUẢN NĂM HỌC
-- KẾT QUẢ CUỐI KÌ
-- HỌC KÌ
-- LỚP
-- SINH VIÊN
-- HỌC PHẦN
-- KẾT QUẢ HỌC PHẦN
--------------------------------------------------------------------------------
CREATE TABLE QUYEN
(
	ID INT IDENTITY PRIMARY KEY
	, QUYEN NVARCHAR(20) NOT NULL CHECK ( QUYEN = N'SupperAdmin' OR QUYEN = N'Admin' OR QUYEN =N'Quản trị' OR QUYEN = N'Giáo Viên' )
)
GO
--------------------------------------------------------------------------------
CREATE TABLE TAIKHOAN
(
	ID INT IDENTITY PRIMARY KEY
	, TENTAIKHOAN NVARCHAR(30) NOT NULL UNIQUE -- không được trùng tên tài khoản
	, MATKHAU NVARCHAR(MAX) NOT NULL
	, HOTEN NVARCHAR(50) NOT NULL
	, TENHIENTHI NVARCHAR(50)
	, SODIENTHOAI NVARCHAR(10)
	, EMAIL NVARCHAR(50)
	, DIACHI NVARCHAR(200)
	, IDQUYEN INT NOT NULL
	, FOREIGN KEY (IDQUYEN) REFERENCES DBO.QUYEN(ID)
)
GO
--------------------------------------------------------------------------------
CREATE TABLE KHOAHOC
(
	ID INT IDENTITY PRIMARY KEY
	, MAKHOAHOC NVARCHAR(10) NOT NULL UNIQUE
	, TENKHOAHOC NVARCHAR(100)
	, NAMBATDAU INT NOT NULL
	, NAMKETTHUC INT NOT NULL
	, THOIGIANHOCTOITHIEU INT NOT NULL DEFAULT 1
	, THOIGIANHOCTIEUCHUAN INT NOT NULL DEFAULT 1
	, THOIGIANHOCTOIDA INT NOT NULL DEFAULT 1
)
GO
--------------------------------------------------------------------------------
CREATE TABLE HOCKI
(
	ID INT IDENTITY PRIMARY KEY
	, MAHOCKI NVARCHAR(10) NOT NULL UNIQUE
	, TENHOCKI NVARCHAR(30) NOT NULL DEFAULT 'HK1'
	, TGBATDAU DATE NOT NULL
	, TGKETTHUC DATE NOT NULL
	, IDKHOAHOC INT
	, FOREIGN KEY (IDKHOAHOC) REFERENCES dbo.KHOAHOC (ID)
)
GO
--------------------------------------------------------------------------------
CREATE TABLE LOP
(
	ID INT IDENTITY PRIMARY KEY
	, MALOP NVARCHAR(10) NOT NULL UNIQUE
	, TENLOP NVARCHAR(100)
	, IDKHOAHOC INT
	, FOREIGN KEY (IDKHOAHOC) REFERENCES dbo.KHOAHOC (ID)
)
GO
--------------------------------------------------------------------------------
CREATE TABLE SINHVIEN
(
	ID INT IDENTITY PRIMARY KEY
	, MSSV NVARCHAR(10) NOT NULL UNIQUE
	, HO NVARCHAR(30) NOT NULL
	, TEN NVARCHAR(30) NOT NULL
	, GIOITINH NVARCHAR(5)
	, NGAYSINH DATE
	, SODIENTHOAI NVARCHAR(11)
	, EMAIL NVARCHAR(50)
	, DIACHI NVARCHAR(200)
	, IDLOP INT
	FOREIGN KEY (IDLOP) REFERENCES dbo.LOP(ID)
)
GO
--------------------------------------------------------------------------------
CREATE TABLE KQCUOIKI
(
	ID INT IDENTITY PRIMARY KEY
	, DTBHESO10 FLOAT DEFAULT 0.0 CHECK (DTBHESO10 >=0 AND DTBHESO10 <= 10)
	, DTBHESO4 FLOAT DEFAULT 0.0 CHECK (DTBHESO4 >=0 AND DTBHESO4 <= 4)
	, DTBCHU CHAR(3) DEFAULT 'F' -- A or B or C or D
	, IDHOCKI INT
	, IDSINHVIEN INT
	, FOREIGN KEY (IDSINHVIEN) REFERENCES dbo.SINHVIEN(ID)
	, FOREIGN KEY (IDHOCKI) REFERENCES dbo.HOCKI(ID)
)
GO
--------------------------------------------------------------------------------
CREATE TABLE HOCPHAN
(
	ID INT IDENTITY PRIMARY KEY
	, MAHOCPHAN NVARCHAR(10) NOT NULL UNIQUE
	, TENHOCPHAN NVARCHAR(100) NOT NULL
	, IDHOCKI INT
	, IDKHOAHOC INT
	, FOREIGN KEY (IDHOCKI) REFERENCES dbo.HOCKI (ID)
	, FOREIGN KEY (IDKHOAHOC) REFERENCES dbo.KHOAHOC (ID)
)
GO
--------------------------------------------------------------------------------
CREATE TABLE KQHOCPHAN
(
	ID INT IDENTITY PRIMARY KEY
	, DIEMCHUYENCAN FLOAT DEFAULT 0.0 CHECK (DIEMCHUYENCAN >= 0 AND DIEMCHUYENCAN <= 10)
	, DIEMGIUAKI FLOAT DEFAULT 0.0 CHECK (DIEMGIUAKI >= 0 AND DIEMGIUAKI <= 10)
	, DIEMTHICUOIKI FLOAT DEFAULT 0.0 CHECK (DIEMTHICUOIKI >= 0 AND DIEMTHICUOIKI <= 10)
	, DTBHOCPHANHESO10 FLOAT DEFAULT 0.0 CHECK (DTBHOCPHANHESO10 >=0 AND DTBHOCPHANHESO10 <= 10)
	, DTBHOCPHANHESO4 FLOAT DEFAULT 0.0 CHECK (DTBHOCPHANHESO4 >=0 AND DTBHOCPHANHESO4 <= 4)
	, DTBHOCPHANCHU CHAR(2) -- A or B or C or F thi lại
	, IDHOCPHAN INT
	, IDKQCUOIKI INT
	, IDSINHVIEN INT
	, FOREIGN KEY (IDSINHVIEN) REFERENCES dbo.SINHVIEN(ID)
	, FOREIGN KEY (IDHOCPHAN) REFERENCES dbo.HOCPHAN(ID)
	, FOREIGN KEY (IDKQCUOIKI) REFERENCES dbo.KQCUOIKI(ID)
)
GO
--------------------------------------------------------------------------------
INSERT INTO dbo.QUYEN
        ( QUYEN )
VALUES  ( N'SupperAdmin'  -- QUYEN - nvarchar(20)
          )
GO
--------------------------------------------------------------------------------
INSERT INTO dbo.QUYEN
        ( QUYEN )
VALUES  ( N'Admin'  -- QUYEN - nvarchar(20)
          )
GO
--------------------------------------------------------------------------------
INSERT INTO dbo.QUYEN
        ( QUYEN )
VALUES  ( N'Quản Trị'  -- QUYEN - nvarchar(20)
          )
GO
--------------------------------------------------------------------------------
INSERT INTO dbo.QUYEN
        ( QUYEN )
VALUES  ( N'Giáo Viên'  -- QUYEN - nvarchar(20)
          )
GO
--------------------------------------------------------------------------------
INSERT INTO dbo.TAIKHOAN
        ( TENTAIKHOAN ,
          MATKHAU ,
          HOTEN ,
          IDQUYEN
        )
VALUES  ( N'SupperAdmin' , -- TENTAIKHOAN - nvarchar(30)
          N'C8qiotBAbGg=' , -- MATKHAU - nvarchar(max)
          N'Lê Hoàng Duy' , -- HOTEN - nvarchar(50)
          1  -- IDQUYEN - int
        )
GO
--------------------------------------------------------------------------------
INSERT INTO dbo.TAIKHOAN
        ( TENTAIKHOAN ,
          MATKHAU ,
          HOTEN ,
          IDQUYEN
        )
VALUES  ( N'ADMIN' , -- TENTAIKHOAN - nvarchar(30)
          N'C8qiotBAbGg=' , -- MATKHAU - nvarchar(max)
          N'ADMIN' , -- HOTEN - nvarchar(50)
          2  -- IDQUYEN - int
        )
GO
--------------------------------------------------------------------------------
INSERT INTO dbo.TAIKHOAN
        ( TENTAIKHOAN ,
          MATKHAU ,
          HOTEN ,
          IDQUYEN
        )
VALUES  ( N'QUANTRI' , -- TENTAIKHOAN - nvarchar(30)
          N'SMqn65TuxEs=' , -- MATKHAU - nvarchar(max)
          N'Quản Trị' , -- HOTEN - nvarchar(50)
          3  -- IDQUYEN - int
        )
GO
--------------------------------------------------------------------------------
INSERT INTO dbo.TAIKHOAN
        ( TENTAIKHOAN ,
          MATKHAU ,
          HOTEN ,
          IDQUYEN
        )
VALUES  ( N'GIAOVIEN' , -- TENTAIKHOAN - nvarchar(30)
          N'KywbOlLM3kcEs0sepAH66g==' , -- MATKHAU - nvarchar(max)
          N'Giáo Viên' , -- HOTEN - nvarchar(50)
          4  -- IDQUYEN - int
        )
GO
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CREATE FUNCTION [dbo].[fuConvertToUnsign1] ( @strInput NVARCHAR(4000) ) RETURNS NVARCHAR(4000) AS BEGIN IF @strInput IS NULL RETURN @strInput IF @strInput = '' RETURN @strInput DECLARE @RT NVARCHAR(4000) DECLARE @SIGN_CHARS NCHAR(136) DECLARE @UNSIGN_CHARS NCHAR (136) SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' +NCHAR(272)+ NCHAR(208) SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee iiiiiooooooooooooooouuuuuuuuuuyyyyy AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD' DECLARE @COUNTER int DECLARE @COUNTER1 int SET @COUNTER = 1 WHILE (@COUNTER <=LEN(@strInput)) BEGIN SET @COUNTER1 = 1 WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1) BEGIN IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) ) BEGIN IF @COUNTER=1 SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1) ELSE SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER) BREAK END SET @COUNTER1 = @COUNTER1 +1 END SET @COUNTER = @COUNTER +1 END SET @strInput = replace(@strInput,' ','-') RETURN @strInput END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[USP_Login]
	@userName NVARCHAR(30)
	, @passWord NVARCHAR(MAX)
AS
BEGIN
	SELECT *
	FROM dbo.TAIKHOAN
	WHERE TENTAIKHOAN = @userName AND MATKHAU = @passWord
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_GetTaiKhoanByTenTaiKhoan
	@userName NVARCHAR(30)
AS
BEGIN
	SELECT * FROM dbo.TAIKHOAN WHERE TENTAIKHOAN = @userName
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[USP_GetCountByTenTaiKhoan]
	@tenTaiKhoan NVARCHAR(30) 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT COUNT(*)
	FROM dbo.TAIKHOAN
	WHERE TENTAIKHOAN = @tenTaiKhoan
END
GO
----------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[USP_LoadTaiKhoan]
AS
BEGIN
	SELECT
	TAIKHOAN.ID AS N'ID Tài Khoản'
	, TENTAIKHOAN AS N'Tên Tài Khoản'
	, MATKHAU AS N'Mật Khẩu'
	, HOTEN AS N'Họ Tên'
	, TENHIENTHI AS N'Tên Hiển Thị'
	, SODIENTHOAI AS N'Số Điện Thoại'
	, EMAIL AS N'Email'
	, DIACHI AS N'Địa Chỉ'
	, IDQUYEN AS N'ID Quyền'
	, QUYEN AS N'Quyền'
	FROM dbo.TAIKHOAN, dbo.QUYEN
	WHERE IDQUYEN != 1 AND IDQUYEN = QUYEN.ID AND TENTAIKHOAN != N'ADMIN'
	ORDER BY [Tên Tài Khoản] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemCoHoTen
@hoTen NVARCHAR(50)
,@quyen INT
AS
BEGIN
	SELECT
	TAIKHOAN.ID AS N'ID Tài Khoản'
	, TENTAIKHOAN AS N'Tên Tài Khoản'
	, MATKHAU AS N'Mật Khẩu'
	, HOTEN AS N'Họ Tên'
	, TENHIENTHI AS N'Tên Hiển Thị'
	, SODIENTHOAI AS N'Số Điện Thoại'
	, EMAIL AS N'Email'
	, DIACHI AS N'Địa Chỉ'
	, IDQUYEN AS N'ID Quyền'
	, QUYEN AS N'Quyền'
	FROM dbo.TAIKHOAN ,dbo.QUYEN
	WHERE IDQUYEN = QUYEN.ID AND (IDQUYEN = @quyen OR dbo.fuConvertToUnsign1(HOTEN) LIKE N'%' + dbo.fuConvertToUnsign1(@hoTen) + '%') AND IDQUYEN != 1 AND TENTAIKHOAN != N'ADMIN'
	ORDER BY [Tên Tài Khoản] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemQuyen
@quyen INT
AS
BEGIN
	SELECT
	TAIKHOAN.ID AS N'ID Tài Khoản'
	, TENTAIKHOAN AS N'Tên Tài Khoản'
	, MATKHAU AS N'Mật Khẩu'
	, HOTEN AS N'Họ Tên'
	, TENHIENTHI AS N'Tên Hiển Thị'
	, SODIENTHOAI AS N'Số Điện Thoại'
	, EMAIL AS N'Email'
	, DIACHI AS N'Địa Chỉ'
	, IDQUYEN AS N'ID Quyền'
	, QUYEN AS N'Quyền'
	FROM dbo.TAIKHOAN , dbo.QUYEN
	WHERE IDQUYEN = @quyen AND IDQUYEN = QUYEN.ID AND IDQUYEN != 1 AND TENTAIKHOAN != N'ADMIN'
	ORDER BY [Tên Tài Khoản] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_LoadDanhSachKhoaHoc
AS
BEGIN
	SELECT
	ID AS N'ID Khóa Học'
	, MAKHOAHOC AS N'Mã Khóa Học'
	, TENKHOAHOC AS N'Tên Khóa Học'
	, NAMBATDAU AS N'Năm Bắt Đầu'
	, NAMKETTHUC AS N'Năm Kết Thúc'
	, THOIGIANHOCTOITHIEU AS N'TGH Tối Thiểu'
	, THOIGIANHOCTOIDA AS N'TGH Tối Đa'
	, THOIGIANHOCTIEUCHUAN AS N'TGH Quy Định'
	FROM dbo.KHOAHOC
	ORDER BY [Mã Khóa Học] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_GetCountByMaKhoaHoc
@maKhoaHoc NVARCHAR(10)
AS
BEGIN
	SELECT COUNT(*)
	FROM dbo.KHOAHOC
	WHERE MAKHOAHOC = @maKhoaHoc
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemMKH
@mKH NVARCHAR(10)
AS
BEGIN
	SELECT
	ID AS N'ID Khóa Học'
	, MAKHOAHOC AS N'Mã Khóa Học'
	, TENKHOAHOC AS N'Tên Khóa Học'
	, NAMBATDAU AS N'Năm Bắt Đầu'
	, NAMKETTHUC AS N'Năm Kết Thúc'
	, THOIGIANHOCTOITHIEU AS N'TGH Tối Thiểu'
	, THOIGIANHOCTOIDA AS N'TGH Tối Đa'
	, THOIGIANHOCTIEUCHUAN AS N'TGH Quy Định'
	FROM dbo.KHOAHOC
	WHERE (dbo.fuConvertToUnsign1(MAKHOAHOC) LIKE N'%' + dbo.fuConvertToUnsign1(@mkh) + '%') 
	ORDER BY [Mã Khóa Học] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemTenKH
@tenKH NVARCHAR(100)
AS
BEGIN
	SELECT
	ID AS N'ID Khóa Học'
	, MAKHOAHOC AS N'Mã Khóa Học'
	, TENKHOAHOC AS N'Tên Khóa Học'
	, NAMBATDAU AS N'Năm Bắt Đầu'
	, NAMKETTHUC AS N'Năm Kết Thúc'
	, THOIGIANHOCTOITHIEU AS N'TGH Tối Thiểu'
	, THOIGIANHOCTOIDA AS N'TGH Tối Đa'
	, THOIGIANHOCTIEUCHUAN AS N'TGH Quy Định'
	FROM dbo.KHOAHOC
	WHERE (dbo.fuConvertToUnsign1(TENKHOAHOC) LIKE N'%' + dbo.fuConvertToUnsign1(@tenKH) + '%')
	ORDER BY [Mã Khóa Học] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemNamBDKH
@namBD INT
AS
BEGIN
	SELECT
	ID AS N'ID Khóa Học'
	, MAKHOAHOC AS N'Mã Khóa Học'
	, TENKHOAHOC AS N'Tên Khóa Học'
	, NAMBATDAU AS N'Năm Bắt Đầu'
	, NAMKETTHUC AS N'Năm Kết Thúc'
	, THOIGIANHOCTOITHIEU AS N'TGH Tối Thiểu'
	, THOIGIANHOCTOIDA AS N'TGH Tối Đa'
	, THOIGIANHOCTIEUCHUAN AS N'TGH Quy Định'
	FROM dbo.KHOAHOC
	WHERE (dbo.fuConvertToUnsign1(NAMBATDAU) LIKE N'%' + dbo.fuConvertToUnsign1(@namBD) + '%')
	ORDER BY [Mã Khóa Học] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemMKHvsTenKH
@mKH NVARCHAR(10)
,@tenKH NVARCHAR(100)
AS
BEGIN
	SELECT
	ID AS N'ID Khóa Học'
	, MAKHOAHOC AS N'Mã Khóa Học'
	, TENKHOAHOC AS N'Tên Khóa Học'
	, NAMBATDAU AS N'Năm Bắt Đầu'
	, NAMKETTHUC AS N'Năm Kết Thúc'
	, THOIGIANHOCTOITHIEU AS N'TGH Tối Thiểu'
	, THOIGIANHOCTOIDA AS N'TGH Tối Đa'
	, THOIGIANHOCTIEUCHUAN AS N'TGH Quy Định'
	FROM dbo.KHOAHOC
	WHERE (dbo.fuConvertToUnsign1(MAKHOAHOC) LIKE N'%' + dbo.fuConvertToUnsign1(@mkh) + '%') OR (dbo.fuConvertToUnsign1(TENKHOAHOC) LIKE N'%' + dbo.fuConvertToUnsign1(@tenKH) + '%')
	ORDER BY [Mã Khóa Học] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemMKHvsNamBD
@mKH NVARCHAR(10)
,@namBD INT
AS
BEGIN
	SELECT
	ID AS N'ID Khóa Học'
	, MAKHOAHOC AS N'Mã Khóa Học'
	, TENKHOAHOC AS N'Tên Khóa Học'
	, NAMBATDAU AS N'Năm Bắt Đầu'
	, NAMKETTHUC AS N'Năm Kết Thúc'
	, THOIGIANHOCTOITHIEU AS N'TGH Tối Thiểu'
	, THOIGIANHOCTOIDA AS N'TGH Tối Đa'
	, THOIGIANHOCTIEUCHUAN AS N'TGH Quy Định'
	FROM dbo.KHOAHOC
	WHERE (dbo.fuConvertToUnsign1(MAKHOAHOC) LIKE N'%' + dbo.fuConvertToUnsign1(@mkh) + '%') OR (dbo.fuConvertToUnsign1(NAMBATDAU) LIKE N'%' + dbo.fuConvertToUnsign1(@namBD) + '%')
	ORDER BY [Mã Khóa Học] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemTenKHvsNamBD
@tenKH NVARCHAR(100)
,@namBD INT
AS
BEGIN
	SELECT
	ID AS N'ID Khóa Học'
	, MAKHOAHOC AS N'Mã Khóa Học'
	, TENKHOAHOC AS N'Tên Khóa Học'
	, NAMBATDAU AS N'Năm Bắt Đầu'
	, NAMKETTHUC AS N'Năm Kết Thúc'
	, THOIGIANHOCTOITHIEU AS N'TGH Tối Thiểu'
	, THOIGIANHOCTOIDA AS N'TGH Tối Đa'
	, THOIGIANHOCTIEUCHUAN AS N'TGH Quy Định'
	FROM dbo.KHOAHOC
	WHERE (dbo.fuConvertToUnsign1(TENKHOAHOC) LIKE N'%' + dbo.fuConvertToUnsign1(@tenKH) + '%') OR (dbo.fuConvertToUnsign1(NAMBATDAU) LIKE N'%' + dbo.fuConvertToUnsign1(@namBD) + '%')
	ORDER BY [Mã Khóa Học] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemKHOAHOC
@mKH NVARCHAR(10)
,@tenKH NVARCHAR(100)
,@namBD INT
AS
BEGIN
	SELECT
	ID AS N'ID Khóa Học'
	, MAKHOAHOC AS N'Mã Khóa Học'
	, TENKHOAHOC AS N'Tên Khóa Học'
	, NAMBATDAU AS N'Năm Bắt Đầu'
	, NAMKETTHUC AS N'Năm Kết Thúc'
	, THOIGIANHOCTOITHIEU AS N'TGH Tối Thiểu'
	, THOIGIANHOCTOIDA AS N'TGH Tối Đa'
	, THOIGIANHOCTIEUCHUAN AS N'TGH Quy Định'
	FROM dbo.KHOAHOC
	WHERE (dbo.fuConvertToUnsign1(MAKHOAHOC) LIKE N'%' + dbo.fuConvertToUnsign1(@mkh) + '%') OR (dbo.fuConvertToUnsign1(TENKHOAHOC) LIKE N'%' + dbo.fuConvertToUnsign1(@tenKH) + '%') OR (dbo.fuConvertToUnsign1(NAMBATDAU) LIKE N'%' + dbo.fuConvertToUnsign1(@namBD) + '%')
	ORDER BY [Mã Khóa Học] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_LoadListLop
AS
BEGIN
	SELECT
	MAKHOAHOC AS N'Mã Khóa Học'
	, LOP.ID AS N'ID Lớp'
	, MALOP AS N'Mã Lớp'
	, TENLOP AS N'Tên Lớp'
	, NAMBATDAU AS N'Năm Bắt Đầu'
	, NAMKETTHUC AS N'Năm Kết Thúc'
	, IDKHOAHOC AS N'ID Khóa Học'
	FROM dbo.LOP , dbo.KHOAHOC
	WHERE IDKHOAHOC = KHOAHOC.ID
	ORDER BY [Mã Khóa Học] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_LoadListLopByMaKhoaHoc
@maKhoaHoc NVARCHAR(10)
AS
BEGIN
	SELECT
	MAKHOAHOC AS N'Mã Khóa Học'
	, LOP.ID AS N'ID Lớp'
	, MALOP AS N'Mã Lớp'
	, TENLOP AS N'Tên Lớp'
	, NAMBATDAU AS N'Năm Bắt Đầu'
	, NAMKETTHUC AS N'Năm Kết Thúc'
	, IDKHOAHOC AS N'ID Khóa Học'
	FROM dbo.LOP , dbo.KHOAHOC
	WHERE IDKHOAHOC = KHOAHOC.ID AND MAKHOAHOC = @maKhoaHoc
	ORDER BY [Mã Khóa Học] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_GetCountByMaLop
@maLop NVARCHAR(10)
AS
BEGIN
	SELECT COUNT(*)
	FROM dbo.LOP
	WHERE MALOP = @maLop
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_GetCountLopByIdKhoaHoc
@idKhoaHoc NVARCHAR(10)
AS
BEGIN
	SELECT COUNT(*)
	FROM dbo.LOP
	WHERE IDKHOAHOC = @idKhoaHoc
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_GetCountHocKiByIdKhoaHoc
@idKhoaHoc NVARCHAR(10)
AS
BEGIN
	SELECT COUNT(*)
	FROM dbo.HOCKI
	WHERE IDKHOAHOC = @idKhoaHoc
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemCoMaLop
@maLop NVARCHAR(10)
,@maKhoaHoc NVARCHAR(10)
AS
BEGIN
	SELECT
	LOP.ID AS N'ID Lớp'
	, MALOP AS N'Mã Lớp'
	, TENLOP AS N'Tên Lớp'
	, NAMBATDAU AS N'Năm Bắt Đầu'
	, NAMKETTHUC AS N'Năm Kết Thúc'
	, MAKHOAHOC AS N'Mã Khóa Học'
	, IDKHOAHOC AS N'ID Khóa Học'
	FROM dbo.LOP , dbo.KHOAHOC
	WHERE KHOAHOC.ID = IDKHOAHOC AND (dbo.fuConvertToUnsign1(MALOP) LIKE N'%' + dbo.fuConvertToUnsign1(@maLop) + '%') AND (dbo.fuConvertToUnsign1(MAKHOAHOC) LIKE N'%' + dbo.fuConvertToUnsign1(@maKhoaHoc) + '%')
ORDER BY [Mã Lớp] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemLopTheoMaLop
@maLop NVARCHAR(10)
AS
BEGIN
	SELECT
	LOP.ID AS N'ID Lớp'
	, MAKHOAHOC AS N'Mã Khóa Học'
	, MALOP AS N'Mã Lớp'
	, TENLOP AS N'Tên Lớp'
	, NAMBATDAU AS N'Năm Bắt Đầu'
	, NAMKETTHUC AS N'Năm Kết Thúc'
	, IDKHOAHOC AS N'ID Khóa Học'
	FROM dbo.LOP , dbo.KHOAHOC
	WHERE KHOAHOC.ID = IDKHOAHOC AND (dbo.fuConvertToUnsign1(MALOP) LIKE N'%' + dbo.fuConvertToUnsign1(@maLop) + '%')
ORDER BY [Mã Lớp] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemLopTheoKhoaHoc
@maKhoaHoc NVARCHAR(10)
AS
BEGIN
	SELECT
	LOP.ID AS N'ID Lớp'
	, MALOP AS N'Mã Lớp'
	, TENLOP AS N'Tên Lớp'
	, NAMBATDAU AS N'Năm Bắt Đầu'
	, NAMKETTHUC AS N'Năm Kết Thúc'
	, MAKHOAHOC AS N'Mã Khóa Học'
	, IDKHOAHOC AS N'ID Khóa Học'
	FROM dbo.LOP , dbo.KHOAHOC
	WHERE KHOAHOC.ID = IDKHOAHOC AND (dbo.fuConvertToUnsign1(MAKHOAHOC) LIKE N'%' + dbo.fuConvertToUnsign1(@maKhoaHoc) + '%')
	ORDER BY [Mã Lớp] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_LoadDanhSachHocKi
AS
BEGIN
	SELECT
	HOCKI.ID AS N'ID Học Kì'
	, MAHOCKI AS N'Mã Học Kì'
	, TENHOCKI AS N'Tên Học Kì'
	, TGBATDAU AS N'Thời Gian Bắt Đầu'
	, TGKETTHUC AS N'Thời Gian Kết Thúc'
	, IDKHOAHOC AS N'ID Khóa Học'
	, MAKHOAHOC AS N'Mã Khóa Học'
	FROM dbo.HOCKI , dbo.KHOAHOC
	WHERE IDKHOAHOC = KHOAHOC.ID
	ORDER BY [Mã Học Kì] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[USP_GetCountByMaHocKi]
	@maHocKi NVARCHAR(100) 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT COUNT(*)
	FROM dbo.HOCKI
	WHERE MAHOCKI = @maHocKi
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemCoMaHK
@maHK NVARCHAR(10)
,@idKhoaHoc INT
AS
BEGIN
	SELECT
	HOCKI.ID AS N'ID Học Kì'
	, MAHOCKI AS N'Mã Học Kì'
	, TENHOCKI AS N'Tên Học Kì'
	, TGBATDAU AS N'Thời Gian Bắt Đầu'
	, TGKETTHUC AS N'Thời Gian Kết Thúc'
	, IDKHOAHOC AS N'ID Khóa Học'
	, MAKHOAHOC AS N'Mã Khóa Học'
	FROM dbo.HOCKI , dbo.KHOAHOC
	WHERE KHOAHOC.ID = IDKHOAHOC AND (dbo.fuConvertToUnsign1(MAHOCKI) LIKE N'%' + dbo.fuConvertToUnsign1(@maHK) + '%') AND (dbo.fuConvertToUnsign1(IDKHOAHOC) LIKE N'%' + dbo.fuConvertToUnsign1(@idKhoaHoc) + '%')
	ORDER BY [Mã Học Kì] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemKhongMaHK
@idKhoaHoc INT
AS
BEGIN
	SELECT
	HOCKI.ID AS N'ID Học Kì'
	, MAHOCKI AS N'Mã Học Kì'
	, TENHOCKI AS N'Tên Học Kì'
	, TGBATDAU AS N'Thời Gian Bắt Đầu'
	, TGKETTHUC AS N'Thời Gian Kết Thúc'
	, IDKHOAHOC AS N'ID Khóa Học'
	, MAKHOAHOC AS N'Mã Khóa Học'
	FROM dbo.HOCKI , dbo.KHOAHOC
	WHERE KHOAHOC.ID = IDKHOAHOC AND (dbo.fuConvertToUnsign1(IDKHOAHOC) LIKE N'%' + dbo.fuConvertToUnsign1(@idKhoaHoc) + '%')
	ORDER BY [Mã Học Kì] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_LoadDanhSachHocPhan
AS
BEGIN
	SELECT
	HOCPHAN.ID AS N'ID Học Phần'
	, MAHOCPHAN AS N'Mã Học Phần'
	, TENHOCPHAN AS N'Tên Học Phần'
	, TGBATDAU AS N'Thời Gian Bắt Đầu Học'
	, TGKETTHUC AS N'Thời Gian Kết Thúc'
	, IDHOCKI AS N'ID Học Kì'
	, HOCPHAN.IDKHOAHOC AS N'ID Khóa Học'
	, MAHOCKI AS N'Mã Học Kì'
	, MAKHOAHOC AS N'Mã Khóa Học'
	FROM dbo.HOCPHAN , dbo.HOCKI , dbo.KHOAHOC
	WHERE HOCPHAN.IDKHOAHOC = KHOAHOC.ID AND IDHOCKI =HOCKI.ID
	ORDER BY [Mã Học Phần] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].USP_GetCountByMaHocPhan
	@maHocPhan NVARCHAR(100) 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT COUNT(*)
	FROM dbo.HOCPHAN
	WHERE MAHOCPHAN = @maHocPhan
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].USP_GetCountHocPhanByIdHocKi
	@idHocKi NVARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT COUNT(*)
	FROM dbo.HOCPHAN
	WHERE IDHOCKI = @idHocKi
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemHocPhanCoMa
@maHocPhan NVARCHAR(10)
, @maHocKi NVARCHAR(10)
, @maKhoaHoc NVARCHAR(10)
AS
BEGIN
	SELECT
	HOCPHAN.ID AS N'ID Học Phần'
	, MAHOCPHAN AS N'Mã Học Phần'
	, TENHOCPHAN AS N'Tên Học Phần'
	, TGBATDAU AS N'Thời Gian Bắt Đầu Học'
	, TGKETTHUC AS N'Thời Gian Kết Thúc'
	, IDHOCKI AS N'ID Học Kì'
	, HOCPHAN.IDKHOAHOC AS N'ID Khóa Học'
	, MAHOCKI AS N'Mã Học Kì'
	, MAKHOAHOC AS N'Mã Khóa Học'
	FROM dbo.HOCPHAN , dbo.HOCKI , dbo.KHOAHOC
	WHERE HOCPHAN.IDKHOAHOC = KHOAHOC.ID AND IDHOCKI =HOCKI.ID AND (dbo.fuConvertToUnsign1(MAHOCPHAN) LIKE N'%' + dbo.fuConvertToUnsign1(@maHocPhan) + '%') AND (dbo.fuConvertToUnsign1(MAHOCKI) LIKE N'%' + dbo.fuConvertToUnsign1(@maHocKi) + '%') AND (dbo.fuConvertToUnsign1(MAKHOAHOC) LIKE N'%' + dbo.fuConvertToUnsign1(@maKhoaHoc) + '%')
	ORDER BY [Mã Học Phần] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemHocPhanKhongMa
@maHocKi NVARCHAR(10)
, @maKhoaHoc NVARCHAR(10)
AS
BEGIN
	SELECT
	HOCPHAN.ID AS N'ID Học Phần'
	, MAHOCPHAN AS N'Mã Học Phần'
	, TENHOCPHAN AS N'Tên Học Phần'
	, TGBATDAU AS N'Thời Gian Bắt Đầu Học'
	, TGKETTHUC AS N'Thời Gian Kết Thúc'
	, IDHOCKI AS N'ID Học Kì'
	, HOCPHAN.IDKHOAHOC AS N'ID Khóa Học'
	, MAHOCKI AS N'Mã Học Kì'
	, MAKHOAHOC AS N'Mã Khóa Học'
	FROM dbo.HOCPHAN , dbo.HOCKI , dbo.KHOAHOC
	WHERE HOCPHAN.IDKHOAHOC = KHOAHOC.ID AND IDHOCKI =HOCKI.ID AND (dbo.fuConvertToUnsign1(MAHOCKI) LIKE N'%' + dbo.fuConvertToUnsign1(@maHocKi) + '%') AND (dbo.fuConvertToUnsign1(MAKHOAHOC) LIKE N'%' + dbo.fuConvertToUnsign1(@maKhoaHoc) + '%')
	ORDER BY [Mã Học Phần] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_LoadDanhSachSinhVien
AS
BEGIN
	SELECT
	MALOP AS N'Mã Lớp'
	, SINHVIEN.ID AS N'ID Sinh Viên'
	, SINHVIEN.MSSV AS N'Mã Số Sinh Viên'
	, SINHVIEN.HO AS N'Họ và Tên Lót'
	, SINHVIEN.TEN AS N'Tên'
	, SINHVIEN.GIOITINH AS N'Giới Tính'
	, SINHVIEN.NGAYSINH AS N'Ngày Sinh'
	, SINHVIEN.SODIENTHOAI AS N'Số Điện Thoại'
	, SINHVIEN.EMAIL AS N'Email'
	, SINHVIEN.DIACHI AS N'Địa Chỉ'
	, IDLOP AS N'ID Lớp'
	FROM dbo.SINHVIEN,dbo.LOP
	WHERE IDLOP = LOP.ID
	ORDER BY [Tên] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].USP_GetCountSinhVienByMaSoSinhVien
	@maoSinhVien NVARCHAR(10) 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT COUNT(*)
	FROM dbo.SINHVIEN
	WHERE MSSV = @maoSinhVien
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemMSSV
@mssv NVARCHAR(10)
, @malop NVARCHAR(10)
AS
BEGIN
	SELECT
	MALOP AS N'Mã Lớp'
	, SINHVIEN.ID AS N'ID Sinh Viên'
	, SINHVIEN.MSSV AS N'Mã Số Sinh Viên'
	, SINHVIEN.HO AS N'Họ và Tên Lót'
	, SINHVIEN.TEN AS N'Tên'
	, SINHVIEN.GIOITINH AS N'Giới Tính'
	, SINHVIEN.NGAYSINH AS N'Ngày Sinh'
	, SINHVIEN.SODIENTHOAI AS N'Số Điện Thoại'
	, SINHVIEN.EMAIL AS N'Email'
	, SINHVIEN.DIACHI AS N'Địa Chỉ'
	, IDLOP AS N'ID Lớp'
	FROM dbo.SINHVIEN,dbo.LOP
	WHERE IDLOP = LOP.ID AND (dbo.fuConvertToUnsign1(MSSV) LIKE N'%' + dbo.fuConvertToUnsign1(@mssv) + '%') AND (dbo.fuConvertToUnsign1(MALOP) LIKE N'%' + dbo.fuConvertToUnsign1(@malop) + '%')
	ORDER BY [Tên] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemTenSV
@ten NVARCHAR(30)
, @malop NVARCHAR(10)
AS
BEGIN
	SELECT
	MALOP AS N'Mã Lớp'
	, SINHVIEN.ID AS N'ID Sinh Viên'
	, SINHVIEN.MSSV AS N'Mã Số Sinh Viên'
	, SINHVIEN.HO AS N'Họ và Tên Lót'
	, SINHVIEN.TEN AS N'Tên'
	, SINHVIEN.GIOITINH AS N'Giới Tính'
	, SINHVIEN.NGAYSINH AS N'Ngày Sinh'
	, SINHVIEN.SODIENTHOAI AS N'Số Điện Thoại'
	, SINHVIEN.EMAIL AS N'Email'
	, SINHVIEN.DIACHI AS N'Địa Chỉ'
	, IDLOP AS N'ID Lớp'
	FROM dbo.SINHVIEN,dbo.LOP
	WHERE IDLOP = LOP.ID AND (dbo.fuConvertToUnsign1(TEN) LIKE N'%' + dbo.fuConvertToUnsign1(@ten) + '%') AND (dbo.fuConvertToUnsign1(MALOP) LIKE N'%' + dbo.fuConvertToUnsign1(@malop) + '%')
	ORDER BY [Tên] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemtcSV
@mssv NVARCHAR(10)
, @ten NVARCHAR(30)
, @malop NVARCHAR(10)
AS
BEGIN
	SELECT
	MALOP AS N'Mã Lớp'
	, SINHVIEN.ID AS N'ID Sinh Viên'
	, SINHVIEN.MSSV AS N'Mã Số Sinh Viên'
	, SINHVIEN.HO AS N'Họ và Tên Lót'
	, SINHVIEN.TEN AS N'Tên'
	, SINHVIEN.GIOITINH AS N'Giới Tính'
	, SINHVIEN.NGAYSINH AS N'Ngày Sinh'
	, SINHVIEN.SODIENTHOAI AS N'Số Điện Thoại'
	, SINHVIEN.EMAIL AS N'Email'
	, SINHVIEN.DIACHI AS N'Địa Chỉ'
	, IDLOP AS N'ID Lớp'
	FROM dbo.SINHVIEN,dbo.LOP
	WHERE IDLOP = LOP.ID AND (dbo.fuConvertToUnsign1(MSSV) LIKE N'%' + dbo.fuConvertToUnsign1(@mssv) + '%') AND (dbo.fuConvertToUnsign1(TEN) LIKE N'%' + dbo.fuConvertToUnsign1(@ten) + '%') AND (dbo.fuConvertToUnsign1(MALOP) LIKE N'%' + dbo.fuConvertToUnsign1(@malop) + '%')
	ORDER BY [Tên] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemMaLopSV
@malop NVARCHAR(10)
AS
BEGIN
	SELECT
	MALOP AS N'Mã Lớp'
	, SINHVIEN.ID AS N'ID Sinh Viên'
	, SINHVIEN.MSSV AS N'Mã Số Sinh Viên'
	, SINHVIEN.HO AS N'Họ và Tên Lót'
	, SINHVIEN.TEN AS N'Tên'
	, SINHVIEN.GIOITINH AS N'Giới Tính'
	, SINHVIEN.NGAYSINH AS N'Ngày Sinh'
	, SINHVIEN.SODIENTHOAI AS N'Số Điện Thoại'
	, SINHVIEN.EMAIL AS N'Email'
	, SINHVIEN.DIACHI AS N'Địa Chỉ'
	, IDLOP AS N'ID Lớp'
	FROM dbo.SINHVIEN,dbo.LOP
	WHERE IDLOP = LOP.ID AND (dbo.fuConvertToUnsign1(MALOP) LIKE N'%' + dbo.fuConvertToUnsign1(@malop) + '%')
	ORDER BY [Tên] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_LoadDanhSachSinhVienQLD
@maLop NVARCHAR(10)
AS
BEGIN
	SELECT
	MALOP AS N'Mã Lớp'
	, SINHVIEN.ID AS N'ID Sinh Viên'
	, SINHVIEN.MSSV AS N'Mã Số Sinh Viên'
	, SINHVIEN.HO AS N'Họ và Tên Lót'
	, SINHVIEN.TEN AS N'Tên'
	, SINHVIEN.GIOITINH AS N'Giới Tính'
	, SINHVIEN.NGAYSINH AS N'Ngày Sinh'
	, SINHVIEN.SODIENTHOAI AS N'Số Điện Thoại'
	, SINHVIEN.EMAIL AS N'Email'
	, SINHVIEN.DIACHI AS N'Địa Chỉ'
	, IDLOP AS N'ID Lớp'
	FROM dbo.SINHVIEN,dbo.LOP
	WHERE IDLOP = LOP.ID AND MALOP  = @maLop
	ORDER BY [Tên] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_LoadDanhSachSinhVienReport
@maLop NVARCHAR(10)
AS
BEGIN
	SELECT MSSV ,HO , TEN , GIOITINH , NGAYSINH , SODIENTHOAI , EMAIL, DIACHI ,MALOP
	FROM dbo.SINHVIEN,dbo.LOP
	WHERE IDLOP = LOP.ID AND MALOP  = @maLop
	ORDER BY [TEN] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemTenSVQLD
@ten NVARCHAR(30)
AS
BEGIN
	SELECT
	MALOP AS N'Mã Lớp'
	, SINHVIEN.ID AS N'ID Sinh Viên'
	, SINHVIEN.MSSV AS N'Mã Số Sinh Viên'
	, SINHVIEN.HO AS N'Họ và Tên Lót'
	, SINHVIEN.TEN AS N'Tên'
	, SINHVIEN.GIOITINH AS N'Giới Tính'
	, SINHVIEN.NGAYSINH AS N'Ngày Sinh'
	, SINHVIEN.SODIENTHOAI AS N'Số Điện Thoại'
	, SINHVIEN.EMAIL AS N'Email'
	, SINHVIEN.DIACHI AS N'Địa Chỉ'
	, IDLOP AS N'ID Lớp'
	FROM dbo.SINHVIEN,dbo.LOP
	WHERE IDLOP = LOP.ID AND (dbo.fuConvertToUnsign1(TEN) LIKE N'%' + dbo.fuConvertToUnsign1(@ten) + '%')
	ORDER BY [Tên] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemMaSoSVQLD
@maSo NVARCHAR(30)
AS
BEGIN
	SELECT
	MALOP AS N'Mã Lớp'
	, SINHVIEN.ID AS N'ID Sinh Viên'
	, SINHVIEN.MSSV AS N'Mã Số Sinh Viên'
	, SINHVIEN.HO AS N'Họ và Tên Lót'
	, SINHVIEN.TEN AS N'Tên'
	, SINHVIEN.GIOITINH AS N'Giới Tính'
	, SINHVIEN.NGAYSINH AS N'Ngày Sinh'
	, SINHVIEN.SODIENTHOAI AS N'Số Điện Thoại'
	, SINHVIEN.EMAIL AS N'Email'
	, SINHVIEN.DIACHI AS N'Địa Chỉ'
	, IDLOP AS N'ID Lớp'
	FROM dbo.SINHVIEN,dbo.LOP
	WHERE IDLOP = LOP.ID AND (dbo.fuConvertToUnsign1(MSSV) LIKE N'%' + dbo.fuConvertToUnsign1(@maSo) + '%')
	ORDER BY [Tên] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_TimKiemMaSovsTenSVQLD
@maSo NVARCHAR(30)
,@ten NVARCHAR(30)
AS
BEGIN
	SELECT
	MALOP AS N'Mã Lớp'
	, SINHVIEN.ID AS N'ID Sinh Viên'
	, SINHVIEN.MSSV AS N'Mã Số Sinh Viên'
	, SINHVIEN.HO AS N'Họ và Tên Lót'
	, SINHVIEN.TEN AS N'Tên'
	, SINHVIEN.GIOITINH AS N'Giới Tính'
	, SINHVIEN.NGAYSINH AS N'Ngày Sinh'
	, SINHVIEN.SODIENTHOAI AS N'Số Điện Thoại'
	, SINHVIEN.EMAIL AS N'Email'
	, SINHVIEN.DIACHI AS N'Địa Chỉ'
	, IDLOP AS N'ID Lớp'
	FROM dbo.SINHVIEN,dbo.LOP
	WHERE IDLOP = LOP.ID AND ((dbo.fuConvertToUnsign1(MSSV) LIKE N'%' + dbo.fuConvertToUnsign1(@maSo) + '%') AND (dbo.fuConvertToUnsign1(MSSV) LIKE N'%' + dbo.fuConvertToUnsign1(@maSo) + '%'))
	ORDER BY [Tên] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[USP_LoadDanhSachHocPhanTheoIDKhoa]
@id INT
AS
BEGIN
	SELECT
	HOCPHAN.ID AS N'ID Học Phần'
	, MAHOCPHAN AS N'Mã Học Phần'
	, TENHOCPHAN AS N'Tên Học Phần'
	, TGBATDAU AS N'Thời Gian Bắt Đầu Học'
	, TGKETTHUC AS N'Thời Gian Kết Thúc'
	, IDHOCKI AS N'ID Học Kì'
	, HOCPHAN.IDKHOAHOC AS N'ID Khóa Học'
	, MAHOCKI AS N'Mã Học Kì'
	, MAKHOAHOC AS N'Mã Khóa Học'
	FROM dbo.HOCPHAN , dbo.HOCKI , dbo.KHOAHOC
	WHERE HOCPHAN.IDKHOAHOC = KHOAHOC.ID AND IDHOCKI =HOCKI.ID AND HOCPHAN.IDKHOAHOC = @id
	ORDER BY [Mã Học Phần] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].USP_LoadDanhSachHocPhanTheoIDHocKi
@id INT
AS
BEGIN
	SELECT
	HOCPHAN.ID AS N'ID Học Phần'
	, MAHOCPHAN AS N'Mã Học Phần'
	, TENHOCPHAN AS N'Tên Học Phần'
	, TGBATDAU AS N'Thời Gian Bắt Đầu Học'
	, TGKETTHUC AS N'Thời Gian Kết Thúc'
	, IDHOCKI AS N'ID Học Kì'
	, HOCPHAN.IDKHOAHOC AS N'ID Khóa Học'
	, MAHOCKI AS N'Mã Học Kì'
	, MAKHOAHOC AS N'Mã Khóa Học'
	FROM dbo.HOCPHAN , dbo.HOCKI , dbo.KHOAHOC
	WHERE HOCPHAN.IDKHOAHOC = KHOAHOC.ID AND IDHOCKI =HOCKI.ID AND HOCPHAN.IDHOCKI = @id
	ORDER BY [Mã Học Phần] ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_DanhSachSinhVienDaCoDiemHocPhan
@idLop INT
, @idHocPhan INT
AS
BEGIN
	SELECT
	LOP.ID AS N'ID Lớp'
	, HOCPHAN.ID AS N'ID Học Phần'
	, SINHVIEN.ID AS N'ID Sinh Viên'
	, KQHOCPHAN.ID AS N'ID KQ Học Phần'
	, MALOP AS N'Mã Lớp'
	, MAHOCPHAN AS N'Mã Học Phần'
	, MSSV AS N'Mã Số Sinh Viên'
	, HO AS N'Họ và Tên Lót'
	, TEN AS N'Tên'
	, DIEMCHUYENCAN AS N'Điểm Chuyển Cần'
	, DIEMGIUAKI AS N'Điểm Giữa Kì'
	, DIEMTHICUOIKI AS N'Điểm Thi Cuối Kì'
	, DTBHOCPHANHESO10 AS N'DTB Hệ Số 10'
	, DTBHOCPHANHESO4 AS N'DTBHệ Số 4'
	, DTBHOCPHANCHU AS N'DTB Chữ'
	FROM dbo.LOP
	JOIN dbo.HOCPHAN ON HOCPHAN.IDKHOAHOC = LOP.IDKHOAHOC
	RIGHT JOIN dbo.SINHVIEN ON SINHVIEN.IDLOP = LOP.ID
	RIGHT JOIN dbo.KQHOCPHAN ON KQHOCPHAN.IDHOCPHAN = HOCPHAN.ID AND KQHOCPHAN.IDSINHVIEN = SINHVIEN.ID
	WHERE LOP.ID = @idLop AND HOCPHAN.ID = @idHocPhan
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_DanhSachSinhVienChuaCoDiemHocPhan
@idLop INT
, @idHocPhan INT
AS
BEGIN
	SELECT
	LOP.ID AS N'ID Lớp'
	, HOCPHAN.ID AS N'ID Học Phần'
	, SINHVIEN.ID AS N'ID Sinh Viên'
	, KQHOCPHAN.ID AS N'ID KQ Học Phần'
	, MALOP AS N'Mã Lớp'
	, MAHOCPHAN AS N'Mã Học Phần'
	, MSSV AS N'Mã Số Sinh Viên'
	, HO AS N'Họ và Tên Lót'
	, TEN AS N'Tên'
	, DIEMCHUYENCAN AS N'Điểm Chuyển Cần'
	, DIEMGIUAKI AS N'Điểm Giữa Kì'
	, DIEMTHICUOIKI AS N'Điểm Thi Cuối Kì'
	, DTBHOCPHANHESO10 AS N'DTB Hệ Số 10'
	, DTBHOCPHANHESO4 AS N'DTBHệ Số 4'
	, DTBHOCPHANCHU AS N'DTB Chữ'
	FROM dbo.LOP
	JOIN dbo.HOCPHAN ON HOCPHAN.IDKHOAHOC = LOP.IDKHOAHOC
	RIGHT JOIN dbo.SINHVIEN ON SINHVIEN.IDLOP = LOP.ID
	LEFT JOIN dbo.KQHOCPHAN ON KQHOCPHAN.IDHOCPHAN = HOCPHAN.ID AND KQHOCPHAN.IDSINHVIEN = SINHVIEN.ID
	WHERE LOP.ID = @idLop AND HOCPHAN.ID = @idHocPhan
	EXCEPT
	SELECT
	LOP.ID AS N'ID Lớp'
	, HOCPHAN.ID AS N'ID Học Phần'
	, SINHVIEN.ID AS N'ID Sinh Viên'
	, KQHOCPHAN.ID AS N'ID KQ Học Phần'
	, MALOP AS N'Mã Lớp'
	, MAHOCPHAN AS N'Mã Học Phần'
	, MSSV AS N'Mã Số Sinh Viên'
	, HO AS N'Họ và Tên Lót'
	, TEN AS N'Tên'
	, DIEMCHUYENCAN AS N'Điểm Chuyển Cần'
	, DIEMGIUAKI AS N'Điểm Giữa Kì'
	, DIEMTHICUOIKI AS N'Điểm Thi Cuối Kì'
	, DTBHOCPHANHESO10 AS N'DTB Hệ Số 10'
	, DTBHOCPHANHESO4 AS N'DTBHệ Số 4'
	, DTBHOCPHANCHU AS N'DTB Chữ'
	FROM dbo.LOP
	JOIN dbo.HOCPHAN ON HOCPHAN.IDKHOAHOC = LOP.IDKHOAHOC
	RIGHT JOIN dbo.SINHVIEN ON SINHVIEN.IDLOP = LOP.ID
	RIGHT JOIN dbo.KQHOCPHAN ON KQHOCPHAN.IDHOCPHAN = HOCPHAN.ID AND KQHOCPHAN.IDSINHVIEN = SINHVIEN.ID
	WHERE LOP.ID = @idLop AND HOCPHAN.ID = @idHocPhan
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE USP_DanhSachSinhVienVaDiemHocPhan
@idLop INT
, @idHocPhan INT
AS
BEGIN
	SELECT
	LOP.ID AS N'ID Lớp'
	, HOCPHAN.ID AS N'ID Học Phần'
	, SINHVIEN.ID AS N'ID Sinh Viên'
	, KQHOCPHAN.ID AS N'ID KQ Học Phần'
	, MALOP AS N'Mã Lớp'
	, MAHOCPHAN AS N'Mã Học Phần'
	, MSSV AS N'Mã Số Sinh Viên'
	, HO AS N'Họ và Tên Lót'
	, TEN AS N'Tên'
	, DIEMCHUYENCAN AS N'Điểm Chuyển Cần'
	, DIEMGIUAKI AS N'Điểm Giữa Kì'
	, DIEMTHICUOIKI AS N'Điểm Thi Cuối Kì'
	, DTBHOCPHANHESO10 AS N'DTB Hệ Số 10'
	, DTBHOCPHANHESO4 AS N'DTBHệ Số 4'
	, DTBHOCPHANCHU AS N'DTB Chữ'
	FROM dbo.LOP
	JOIN dbo.HOCPHAN ON HOCPHAN.IDKHOAHOC = LOP.IDKHOAHOC
	RIGHT JOIN dbo.SINHVIEN ON SINHVIEN.IDLOP = LOP.ID
	LEFT JOIN dbo.KQHOCPHAN ON KQHOCPHAN.IDHOCPHAN = HOCPHAN.ID AND KQHOCPHAN.IDSINHVIEN = SINHVIEN.ID
	WHERE LOP.ID = @idLop AND HOCPHAN.ID = @idHocPhan
END
GO
--------------------------------------------------------------------------------
CREATE TRIGGER UTP_InsertUpdateDiemtbHocPhan
ON dbo.KQHOCPHAN
AFTER INSERT , UPDATE
AS
BEGIN
	DECLARE @idKQDiem INT = (SELECT ID FROM Inserted)

	DECLARE @DemChuyenCan FLOAT = (SELECT DIEMCHUYENCAN FROM dbo.KQHOCPHAN WHERE ID = @idKQDiem)
	DECLARE @DemGiuaKi FLOAT = (SELECT DIEMGIUAKI FROM dbo.KQHOCPHAN WHERE ID = @idKQDiem)
	
	DECLARE @DemThiCuoiKi FLOAT = (SELECT DIEMTHICUOIKI FROM dbo.KQHOCPHAN WHERE ID = @idKQDiem)

	DECLARE @IdKQCuoiKi INT = (SELECT dbo.KQCUOIKI.ID FROM KQCUOIKI JOIN dbo.HOCPHAN ON KQCUOIKI.IDHOCKI = dbo.HOCPHAN.IDHOCKI RIGHT JOIN KQHOCPHAN ON KQHOCPHAN.IDHOCPHAN = dbo.HOCPHAN.ID JOIN dbo.SINHVIEN ON SINHVIEN.ID = KQCUOIKI.IDSINHVIEN AND SINHVIEN.ID = KQHOCPHAN.IDSINHVIEN WHERE KQHOCPHAN.ID = @idKQDiem)

	UPDATE dbo.KQHOCPHAN SET IDKQCUOIKI = @IdKQCuoiKi WHERE ID = @idKQDiem

	DECLARE @DTBHeSo10 FLOAT = (@DemChuyenCan + @DemGiuaKi + @DemThiCuoiKi)/3
	DECLARE @DTBHeSo4 FLOAT = ((@DemChuyenCan + @DemGiuaKi + @DemThiCuoiKi)/3)*0.4

	IF @DTBHeSo10 >= 9.00 AND @DTBHeSo10 <= 10.00
		UPDATE dbo.KQHOCPHAN SET DTBHOCPHANHESO10 = @DTBHeSo10 , DTBHOCPHANHESO4 = @DTBHeSo4 , DTBHOCPHANCHU = N'A+' WHERE ID = @idKQDiem
	ELSE IF @DTBHeSo10 >= 8.0 AND @DTBHeSo10 <= 8.99
		UPDATE dbo.KQHOCPHAN SET DTBHOCPHANHESO10 = @DTBHeSo10 , DTBHOCPHANHESO4 = @DTBHeSo4 , DTBHOCPHANCHU = N'A' WHERE ID = @idKQDiem
	ELSE IF @DTBHeSo10 >= 7.00 AND @DTBHeSo10 <= 7.99
		UPDATE dbo.KQHOCPHAN SET DTBHOCPHANHESO10 = @DTBHeSo10 , DTBHOCPHANHESO4 = @DTBHeSo4 , DTBHOCPHANCHU = N'B+' WHERE ID = @idKQDiem
	ELSE IF @DTBHeSo10 >= 6.00 AND @DTBHeSo10 <= 6.99
		UPDATE dbo.KQHOCPHAN SET DTBHOCPHANHESO10 = @DTBHeSo10 , DTBHOCPHANHESO4 = @DTBHeSo4 , DTBHOCPHANCHU = N'B' WHERE ID = @idKQDiem
	ELSE IF @DTBHeSo10 >= 5.00 AND @DTBHeSo10 <= 5.99
		UPDATE dbo.KQHOCPHAN SET DTBHOCPHANHESO10 = @DTBHeSo10 , DTBHOCPHANHESO4 = @DTBHeSo4 , DTBHOCPHANCHU = N'C+' WHERE ID = @idKQDiem
	ELSE IF @DTBHeSo10 >= 4.00 AND @DTBHeSo10 <= 4.99
		UPDATE dbo.KQHOCPHAN SET DTBHOCPHANHESO10 = @DTBHeSo10 , DTBHOCPHANHESO4 = @DTBHeSo4 , DTBHOCPHANCHU = N'D+' WHERE ID = @idKQDiem
	ELSE IF @DTBHeSo10 >= 3.00 AND @DTBHeSo10 <= 3.99
		UPDATE dbo.KQHOCPHAN SET DTBHOCPHANHESO10 = @DTBHeSo10 , DTBHOCPHANHESO4 = @DTBHeSo4 , DTBHOCPHANCHU = N'D' WHERE ID = @idKQDiem
	ELSE IF @DTBHeSo10 >= 0.00 AND @DTBHeSo10 <= 2.99
		UPDATE dbo.KQHOCPHAN SET DTBHOCPHANHESO10 = @DTBHeSo10 , DTBHOCPHANHESO4 = @DTBHeSo4 , DTBHOCPHANCHU = N'F' WHERE ID = @idKQDiem;

	DECLARE @DTBHKHeSo10 FLOAT = (SELECT AVG(DTBHOCPHANHESO10) FROM KQHOCPHAN WHERE KQHOCPHAN.IDKQCUOIKI = @IdKQCuoiKi)
	DECLARE @DTBHKHeSo4 FLOAT = (SELECT AVG(DTBHOCPHANHESO10) FROM KQHOCPHAN WHERE KQHOCPHAN.IDKQCUOIKI = @IdKQCuoiKi)*0.4
	
	IF @DTBHKHeSo10 >= 9.00 AND @DTBHKHeSo10 <= 10.00
		UPDATE dbo.KQCUOIKI SET DTBHESO10 = @DTBHKHeSo10 , DTBHESO4 = @DTBHKHeSo4 , DTBCHU = N'A+' WHERE ID = @IdKQCuoiKi
	ELSE IF @DTBHKHeSo10 >= 8.0 AND @DTBHKHeSo10 <= 8.99
		UPDATE dbo.KQCUOIKI SET DTBHESO10 = @DTBHKHeSo10 , DTBHESO4 = @DTBHKHeSo4 , DTBCHU = N'A' WHERE ID = @IdKQCuoiKi
	ELSE IF @DTBHKHeSo10 >= 7.00 AND @DTBHKHeSo10 <= 7.99
		UPDATE dbo.KQCUOIKI SET DTBHESO10 = @DTBHKHeSo10 , DTBHESO4 = @DTBHKHeSo4 , DTBCHU = N'B+' WHERE ID = @IdKQCuoiKi
	ELSE IF @DTBHKHeSo10 >= 6.00 AND @DTBHKHeSo10 <= 6.99
		UPDATE dbo.KQCUOIKI SET DTBHESO10 = @DTBHKHeSo10 , DTBHESO4 = @DTBHKHeSo4 , DTBCHU = N'B' WHERE ID = @IdKQCuoiKi
	ELSE IF @DTBHKHeSo10 >= 5.00 AND @DTBHKHeSo10 <= 5.99
		UPDATE dbo.KQCUOIKI SET DTBHESO10 = @DTBHKHeSo10 , DTBHESO4 = @DTBHKHeSo4 , DTBCHU = N'C+' WHERE ID = @IdKQCuoiKi
	ELSE IF @DTBHKHeSo10 >= 4.00 AND @DTBHKHeSo10 <= 4.99
		UPDATE dbo.KQCUOIKI SET DTBHESO10 = @DTBHKHeSo10 , DTBHESO4 = @DTBHKHeSo4 , DTBCHU = N'D+' WHERE ID = @IdKQCuoiKi
	ELSE IF @DTBHKHeSo10 >= 3.00 AND @DTBHKHeSo10 <= 3.99
		UPDATE dbo.KQCUOIKI SET DTBHESO10 = @DTBHKHeSo10 , DTBHESO4 = @DTBHKHeSo4 , DTBCHU = N'D' WHERE ID = @IdKQCuoiKi
	ELSE IF @DTBHKHeSo10 >= 0.00 AND @DTBHKHeSo10 <= 2.99
		UPDATE dbo.KQCUOIKI SET DTBHESO10 = @DTBHKHeSo10 , DTBHESO4 = @DTBHKHeSo4 , DTBCHU = N'F' WHERE ID = @IdKQCuoiKi;
END
GO
--------------------------------------------------------------------------------
CREATE TRIGGER UTP_SauKhiSinhVienInssert
ON dbo.SINHVIEN
AFTER	INSERT
AS
BEGIN
	DECLARE @idSinhVien INT = (SELECT ID FROM Inserted)
	INSERT INTO [dbo].[KQCUOIKI] (IDHOCKI , IDSINHVIEN) SELECT HOCKI.ID , SINHVIEN.ID FROM dbo.HOCKI JOIN dbo.LOP ON LOP.IDKHOAHOC = HOCKI.IDKHOAHOC JOIN dbo.SINHVIEN ON SINHVIEN.IDLOP = LOP.ID WHERE SINHVIEN.ID = @idSinhVien
END
GO
--------------------------------------------------------------------------------
CREATE PROC [dbo].[USP_DanhSachTatCacDiemHocPhanCuaSinhVien]
@idSinhVien INT
AS
BEGIN
	SELECT 
	MAHOCKI AS N'Mã Học Kì'
	, MSSV
	, HO AS N'Họ và Tên Lót'
	, TEN AS N'Tên'
	, MAHOCPHAN AS N'Mã Học Phần'
	, TENHOCPHAN AS N'Tên Học Phần'
	, DIEMCHUYENCAN AS N'Điểm Chuyên Cần'
	, DIEMGIUAKI AS N'Điểm Giữa Kì'
	, DIEMTHICUOIKI AS N'Điểm Cuối Kì'
	, DTBHOCPHANHESO10 AS N'DTB Hệ Số 10'
	, DTBHOCPHANHESO4 AS N'DTB Hệ Số 4'
	, DTBHOCPHANCHU AS N'DTB Chữ'
	 FROM dbo.KQHOCPHAN
	 JOIN dbo.SINHVIEN ON SINHVIEN.ID = KQHOCPHAN.IDSINHVIEN
	 LEFT JOIN dbo.HOCPHAN ON HOCPHAN.ID = KQHOCPHAN.IDHOCPHAN
	 LEFT JOIN dbo.HOCKI ON HOCKI.ID = HOCPHAN.IDHOCKI
	 WHERE SINHVIEN.ID = @idSinhVien
	 ORDER BY MAHOCKI ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROC USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLop
@idHocKi INT
, @idLop INT
AS
BEGIN
	SELECT
	MALOP
	, MAHOCKI
	, MSSV
	, HO
	, TEN
	, DTBHESO10
	, DTBHESO4
	, DTBCHU
	FROM dbo.KQCUOIKI
	JOIN dbo.SINHVIEN ON SINHVIEN.ID = KQCUOIKI.IDSINHVIEN
	JOIN dbo.HOCKI ON HOCKI.ID = KQCUOIKI.IDHOCKI
	LEFT JOIN dbo.LOP ON LOP.ID = SINHVIEN.IDLOP
	WHERE LOP.ID = @idLop AND HOCKI.ID = @idHocKi
	ORDER BY TEN ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROC [dbo].[USP_DanhSachTatCacDiemHocPhanCuaSinhVienReport]
@idSinhVien INT
AS
BEGIN
	SELECT 
	MAHOCKI
	, MSSV
	, (SELECT HO + ' ' + TEN AS HOTEN FROM dbo.SINHVIEN WHERE ID = @idSinhVien) AS HOTEN
	, MAHOCPHAN
	, TENHOCPHAN
	, DIEMCHUYENCAN
	, DIEMGIUAKI
	, DIEMTHICUOIKI
	, DTBHOCPHANHESO10
	, DTBHOCPHANHESO4
	, DTBHOCPHANCHU
	 FROM dbo.KQHOCPHAN
	 JOIN dbo.SINHVIEN ON SINHVIEN.ID = KQHOCPHAN.IDSINHVIEN
	 LEFT JOIN dbo.HOCPHAN ON HOCPHAN.ID = KQHOCPHAN.IDHOCPHAN
	 LEFT JOIN dbo.HOCKI ON HOCKI.ID = HOCPHAN.IDHOCKI
	 WHERE SINHVIEN.ID = @idSinhVien
	 ORDER BY MAHOCKI ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROC dbo.USP_DanhSachDiemTrungBinhHocKiCuaSinhVienTrongLopXem
@idHocKi INT
, @idLop INT
AS
BEGIN
	SELECT
	MALOP AS N'Mã Lớp'
	, MAHOCKI AS N'Mã Học Kì'
	, MSSV
	, HO AS N'Họ và Tên Lót'
	, TEN AS N'Tên'
	, DTBHESO10 AS N'DTB Hệ Số 10'
	, DTBHESO4 AS N'DTB Hệ Số 4'
	, DTBCHU AS N'DTB Chữ'
	FROM dbo.KQCUOIKI
	JOIN dbo.SINHVIEN ON SINHVIEN.ID = KQCUOIKI.IDSINHVIEN
	JOIN dbo.HOCKI ON HOCKI.ID = KQCUOIKI.IDHOCKI
	LEFT JOIN dbo.LOP ON LOP.ID = SINHVIEN.IDLOP
	WHERE LOP.ID = @idLop AND HOCKI.ID = @idHocKi
	ORDER BY TEN ASC
END
GO
--------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[USP_DanhSachSinhVienVaDiemHocPhanReport]
@idLop INT
, @idHocPhan INT
AS
BEGIN
	SELECT
	LOP.ID
	, HOCPHAN.ID
	, SINHVIEN.ID
	, KQHOCPHAN.ID
	, MALOP
	, MAHOCPHAN
	, MSSV
	, HO
	, TEN
	, DIEMCHUYENCAN
	, DIEMGIUAKI
	, DIEMTHICUOIKI
	, DTBHOCPHANHESO10
	, DTBHOCPHANHESO4
	, DTBHOCPHANCHU
	FROM dbo.LOP
	JOIN dbo.HOCPHAN ON HOCPHAN.IDKHOAHOC = LOP.IDKHOAHOC
	RIGHT JOIN dbo.SINHVIEN ON SINHVIEN.IDLOP = LOP.ID
	LEFT JOIN dbo.KQHOCPHAN ON KQHOCPHAN.IDHOCPHAN = HOCPHAN.ID AND KQHOCPHAN.IDSINHVIEN = SINHVIEN.ID
	WHERE LOP.ID = @idLop AND HOCPHAN.ID = @idHocPhan
END
GO
--------------------------------------------------------------------------------