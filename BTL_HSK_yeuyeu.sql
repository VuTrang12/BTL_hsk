CREATE  DATABASE BTL_HSK_yeuyeu 
GO
	use BTL_HSK_yeuyeu
	GO
	CREATE TABLE tblNhanVien(
			sMaNV NVARCHAR (50)NOT NULL,
			STenNV nvarchar(30),
			bGioiTinh bit,
			sDiaChi nvarchar(100),
			sDienThoai varchar(10),
			--dNgayvaolam Datetime,
			--fLuongcoban float default 0
			CONSTRAINT PK_tblNhanVien PRIMARY KEY(sMaNV)
		)
		go
		drop table tblNhanVien
	CREATE TABLE tblKhachHang
		(
		sMaKH Nvarchar(50),
		sTenKH nvarchar(30),
		bGioiTinh bit,
		sDienThoai varchar(10),
		sDiaChi nvarchar(100)
		CONSTRAINT PK_tblKhachHang PRIMARY KEY(sMaKH)
		)
		go
	CREATE TABLE tblNhacungcap
		(sMaNCC nvarchar(50) primary key,
		sTenNCC NVARCHAR(30),
		sDienThoai varchar(10),
		sDiaChi nvarchar( 100)
	)
	go
	
		drop table tblChiTietSanPham
	CREATE TABLE tblChiTietSanPham (
		sMaCTSP NVARCHAR(50) NOT NULL,
		sMaNCC nvarchar(50) foreign key (sMaNCC) REFERENCES tblNhacungcap,
		sTenSP NVARCHAR(15) NULL,
		sChatLieu NVARCHAR(50),
		sMau NVARCHAR(20),
		sSize NVARCHAR(10),
		iSoluongSP INT NULL
		CONSTRAINT PK_ChiTietSanPham PRIMARY KEY (sMaCTSP)
		
		)
		GO


	CREATE TABLE tblDonDatHang
	(
		sMaHDDH NVARCHAR(50) NOT NULL,
		sMaNV NVARCHAR(50) NOT NULL,
		sMaKH NVARCHAR(50) NOT NULL,
		dNgaymuahang DATEtime,
		
		CONSTRAINT PK_SoHD_DonDatHang PRIMARY KEY (sMaHDDH),
		CONSTRAINT FK_MaNV_DonDatHang FOREIGN KEY (sMaNV) REFERENCES tblNhanVien(sMaNV),
		CONSTRAINT FK_MaKH_DonDatHang FOREIGN KEY (sMaKH) REFERENCES tblKhachHang(sMaKH)
	)
	GO
	--ALTER TABLE tblDonDatHang
 --   ADD dNgaymuahang Datetime;

	create TABLE tblChiTietDatHang
	(
	 sMaHDDH nvarchar(50)not null,
	 sMaCTSP nvarchar(50)not null,
	 iSoluong int default 0,
	 fGiamGia float null,
	 fGiaban float null,
	 fThanhtien FLoat DEFAULT 0,
	 CONSTRAINT PK_ChiTietDatHang Primary key (sMaHDDH,sMaCTSP),
	 CONSTRAINT FK_soHD_tblChiTietDatHang FOREIGN KEY (sMaHDDH)
		REFERENCES tblDonDatHang(sMaHDDH),
		CONSTRAINT FK_sMahang_tblChiTietDatHang FOREIGN KEY (sMaCTSP)
		REFERENCES tblChiTietSanPham(sMaCTSP)

	)
	drop table tblChiTietDatHang
	drop table tblDonDatHang

INSERT tblNhaCungCap(sMaNCC, sTenNCC, sDienThoai, sDiaChi)
	VALUES (N'NCC001', N'Nam Thăng Long ', '0111111111', N'Đà Nẵng')
	INSERT tblNhaCungCap(sMaNCC, sTenNCC, sDienThoai, sDiaChi)
	VALUES (N'NCC002', N'Shop Bé Mèo', '0111111112', N'Qảng Ninh')
	INSERT tblNhaCungCap(sMaNCC, sTenNCC, sDienThoai, sDiaChi)
	VALUES (N'NCC003', N'Xưởng Thu Hương ', '0111111113', N'hà Nội ')
	INSERT tblNhaCungCap(sMaNCC, sTenNCC, sDienThoai, sDiaChi)
	VALUES (N'NCC004', N'Xưởng mẹ Lan', '0111111114', N'Hà Nội')
	INSERT tblNhaCungCap(sMaNCC, sTenNCC, sDienThoai, sDiaChi)
	VALUES (N'NCC005', N'Shop của Mía', '0111111115', N'Phú Thọ')
	INSERT tblNhaCungCap(sMaNCC, sTenNCC, sDienThoai, sDiaChi)
	VALUES (N'NCC006', N'Xưởng Hà', '0111111116', N'Bắc Giang')
	
	GO
	SELECT*FROM tblNhacungcap

	delete  tblNhacungcap
	
	delete tblNhanVien
	-- Bảng Chi Tiết Sản Phẩm
	INSERT tblChiTietSanPham(sMaCTSP,sMaNCC, sTenSP, sChatLieu, sMau, sSize, iSoluongSP)
	VALUES(N'MCTSP001',N'NCC001',N'Áo Phông', N'Vải Kate', N'Đen', 'S,XL', 100)
	INSERT tblChiTietSanPham(sMaCTSP, sMaNCC, sTenSP, sChatLieu , sMau, sSize, iSoluongSP)
	VALUES(N'MCTSP002',N'NCC003',N'Áo trễ vai', N'Vải cotton ', N'Trắng', 'S,M,XXL', 100)
	INSERT tblChiTietSanPham(sMaCTSP, sMaNCC, sTenSP, sChatLieu,  sMau, sSize, iSoluongSP)
	VALUES(N'MCTSP003', N'NCC002',N'Áo trễ vai', N'Vải cotton ', N'Trắng', 'M,L', 100)
	INSERT tblChiTietSanPham(sMaCTSP,sMaNCC,  sTenSP, sChatLieu, sMau, sSize, iSoluongSP)
	VALUES(N'MCTSP004', N'NCC001', N'Quần Âu', N'Vải kaki ', N'Xanh Dương', 'S,M,XL', 100)
	INSERT tblChiTietSanPham(sMaCTSP, sMaNCC, sTenSP, sChatLieu,  sMau, sSize, iSoluongSP)
	VALUES(N'MCTSP005',  N'NCC004',  N'Quần ông rộng ', N'Vải lanh',N'Tím', 'M,XXL', 100)
	INSERT tblChiTietSanPham(sMaCTSP, sMaNCC, sTenSP, sChatLieu,  sMau, sSize, iSoluongSP)
	VALUES(N'MCTSP006', N'NCC003', N'Quần Âu', N'Vải kaki ', N'Đen', 'L,XL', 100)
	GO
SELECT*FROM tblChiTietSanPham
delete tblChiTietSanPham
-- Bảng Nhân Viên
	INSERT tblNhanVien(sMaNV, sTenNV, bGioiTinh,  sDiachi, sDienthoai)
	VALUES(N'MNV001', N'Nguyễn Văn Hà ', 1,   N'Định Công','0211111111')
	INSERT tblNhanVien(sMaNV, sTenNV, bGioiTinh, sDiachi, sDienthoai)
	VALUES(N'MNV002', N'Nguyễn Huy Chung ', 1,  N'Kim Đồng','0211111112')
	INSERT tblNhanVien(sMaNV, sTenNV, bGioiTinh,  sDiachi, sDienthoai)
	VALUES(N'MNV003', N'Trần Thị Thùy ', 0,   N'Định Công','0211111113')
	INSERT tblNhanVien(sMaNV, sTenNV, bGioiTinh, sDiachi, sDienthoai)
	VALUES(N'MNV004', N'Trần Thúy Đoàn  ', 0,  N'Định Công','0211118973')
	GO
	
SELECT*FROM tblNhanVien

	-- Khách hàng
	INSERT tblKhachHang(sMaKH, sTenKH, bGioiTinh, sDienthoai, sDiachi)
	VALUES(N'MKH001', N'Nguyễn Văn Hưng ', 1, '0311111111', N'Định Công')
	INSERT tblKhachHang(sMaKH, sTenKH, bGioiTinh, sDienthoai, sDiachi)
	VALUES(N'MKH002', N'Nguyễn Văn Bính', 1, '0322222222', N'Hoàng Mai')
	INSERT tblKhachHang(sMaKH, sTenKH, bGioiTinh, sDienthoai, sDiachi)
	VALUES(N'MKH003', N'Hoàng Thu Hà', 0, '0333333333', N'Định Công')
	INSERT tblKhachHang(sMaKH, sTenKH, bGioiTinh, sDienthoai, sDiachi)
	VALUES(N'MKH004', N'Nguyễn Thị Diệu', 0, '0344444444', N'Cầu Giấy')
	GO

SELECT *FROM tblKhachHang

	-- Bảng Đơn Đặt Hàng
	INSERT tblDonDatHang(sMaHDDH, sMaNV, sMaKH, dNgaymuahang) 
	VALUES(N'MHDB001', N'MNV001', N'MKH001','20231002')
	INSERT tblDonDatHang(sMaHDDH, sMaNV, sMaKH, dNgaymuahang) 
	VALUES(N'MHDB002', N'MNV001', N'MKH002','20230922')
	INSERT tblDonDatHang(sMaHDDH, sMaNV, sMaKH, dNgaymuahang)  
	VALUES(N'MHDB003', N'MNV002', N'MKH001','20231020')
	INSERT tblDonDatHang(sMaHDDH, sMaNV, sMaKH, dNgaymuahang) 
	VALUES(N'MHDB004', N'MNV002', N'MKH002','20230920')
	GO

	SELECT *FROM tblDonDatHang

	-- Bảng Chi Tiết Đặt Hàng
	INSERT tblChiTietDatHang(sMaHDDH, sMaCTSP, iSoLuong, fGiamGia, fGiaBan) 
	VALUES(N'MHDB001', N'MCTSP001', 2, 10000, 100000)
	INSERT tblChiTietDatHang(sMaHDDH, sMaCTSP, iSoLuong, fGiamGia, fGiaBan) 
	VALUES(N'MHDB001', N'MCTSP002', 2, 10000, 200000)
	INSERT tblChiTietDatHang(sMaHDDH, sMaCTSP, iSoLuong, fGiamGia, fGiaBan) 
	VALUES(N'MHDB002', N'MCTSP003', 3, 10000, 150000)
	INSERT tblChiTietDatHang(sMaHDDH, sMaCTSP, iSoLuong, fGiamGia, fGiaBan) 
	VALUES(N'MHDB002', N'MCTSP002', 5, 10000, 320000)
	INSERT tblChiTietDatHang(sMaHDDH, sMaCTSP, iSoLuong, fGiamGia, fGiaBan) 
	VALUES(N'MHDB003', N'MCTSP001', 1, 10000, 130000)
	INSERT tblChiTietDatHang(sMaHDDH, sMaCTSP, iSoLuong, fGiamGia, fGiaBan)  
	VALUES(N'MHDB003', N'MCTSP003', 1, 10000, 90000)
	INSERT tblChiTietDatHang(sMaHDDH, sMaCTSP, iSoLuong, fGiamGia, fGiaBan) 
	VALUES(N'MHDB004', N'MCTSP001', 3, 20000, 180000)
	INSERT tblChiTietDatHang(sMaHDDH, sMaCTSP, iSoLuong, fGiamGia, fGiaBan)   
	VALUES(N'MHDB004', N'MCTSP002', 1, 10000, 150000)
	INSERT tblChiTietDatHang(sMaHDDH, sMaCTSP, iSoLuong, fGiamGia, fGiaBan)  
	VALUES(N'MHDB004', N'MCTSP003', 5, 10000, 90000)
	GO
	
	SELECT *FROM tblChiTietDatHang

	create table tblTaiKhoan (
		sTaiKhoan NVARCHAR(30),
		sMatKhau nvarchar(30)
	)
	go

	insert tblTaiKhoan(sTaiKhoan, sMatKhau)
	values('Trang', '1');
	--select sTaiKhoan from tblTaiKhoan where sTaiKhoan = 'sa' and sMatKhau = '1';
	-- select sTaiKhoan from tblTaiKhoan
	--select *from tblNhaCungCap
	--select *from tblKhachHang
	--select *from tblNhanVien
	--select *from tblMatHang
	--select *from tblChiTietSanPham
	--select *from tblDonNhapHang
	--select *from tblChiTietNhapHang
	--select *from tblDonDatHang
	--select *from tblChiTietDatHang
---===========TRIGGER, STORE PROCEDUECE==========
--As ten nhan vien, gioi tinh
---===============================NHÂN VIÊN-===================
CREATE PROC Select_tblNV
As
    select sMaNV as [Mã nhân viên],sTenNV as [Tên nhân viên], CASE bGioiTinh When 0 Then N'Nữ' When 1 Then 'Nam' else 'Chưa rõ' end as [Giới tính],
	sDiachi as [Địa chỉ], sDienthoai as [Điện thoại]
	from tblNhanVien
go
exec Select_tblNV

--- Tim kiem theo các thuộc tính của  nhan vien
create  PROCEDURE TK_NV
    @Manv nVARCHAR(50) = NULL,
    @Tennv NVARCHAR(30) = NULL,
    @Gioitinh bit = NULL,
    @Diachi NVARCHAR(100) = NULL,
  
    @Dienthoai VARCHAR(10) = NULL
AS
BEGIN
    SELECT *
    FROM tblNhanVien
    WHERE (@Manv IS NULL OR sMaNV = @Manv)
        AND (@Tennv IS NULL OR STenNV LIKE '%' + @Tennv + '%')
        AND (@Gioitinh IS NULL OR CAST(bGioiTinh AS INT) = @Gioitinh)
        AND (@Diachi IS NULL OR sDiaChi LIKE '%' + @Diachi + '%')
       
        AND (@Dienthoai IS NULL OR sDienThoai LIKE '%' + @Dienthoai+ '%');
END
 exec TK_NV @Gioitinh ='0'



---===============================KHÁCH HÀNG -===================
-- AS bang khach hang
CREATE PROC Select_KH
 AS
 select sMaKH as [Mã khách hàng], sTenKH as [Tên khách hàng], CASE bGioiTinh When 0 Then N'Nữ' When 1 Then 'Nam' else 'Chưa rõ' end as [Giới tính],
	sDiachi as [Địa chỉ], sDienthoai as [Điện thoại]
	from tblKhachHang
GO
EXEC Select_KH




---===============================HÓA ĐƠN -===================
	-- Doi thuoc tinh bang chi tiet dat hang
ALTER PROCEDURE Select_CTDH
AS
BEGIN
    SELECT 
        sMaHDDH AS [Mã hóa đơn], 
        sMaCTSP AS [Mã chi tiết sản phẩm], 
        iSoLuong AS [Số lượng mua],
        fGiamGia AS [Giảm giá], 
        fGiaBan AS [Giá bán]
       
    FROM 
        tblChiTietDatHang
    GROUP BY 
        sMaHDDH, sMaCTSP, iSoLuong, fGiamGia, fGiaBan;
END

exec Select_CTDH
 update tblChiTietDatHang set fThanhtien=((fGiaban*iSoluong)-(fGiamGia*iSoluong))

	---- chi tieets hoas don
	 ALTER  PROC Select_Hoadon
	  as
	  begin
	  select  tblChiTietDatHang.sMaHDDH as[Mã hóa đơn],tblNhanVien.sMaNV as[Mã nhân viên],tblKhachHang.sTenKH as[Tên khách hàng],
	   sTenSP as[Tên sản phẩm ], tblDonDatHang.dNgaymuahang as[ Ngày đặt],
	  tblChiTietDatHang.iSoluong as[Số lượng],
		fGiamGia as[ Giảm giá],fGiaban as[ Giá bán],tblChiTietDatHang.fThanhtien as[ Thành tiền]
	  from tblChiTietDatHang,tblDonDatHang, tblChiTietSanPham,tblNhanVien,tblKhachHang
	  where tblChiTietDatHang.sMaHDDH=tblDonDatHang.sMaHDDH and tblDonDatHang.sMaNV=tblNhanVien.sMaNV
	  and tblDonDatHang.sMaKH=tblKhachHang.sMaKH  and 
	  tblChiTietSanPham.sMaCTSP=tblChiTietDatHang.sMaCTSP
	  end

	  exec Select_Hoadon
----================= tìm kiêm hóa đơn theo tất cả các trường dữ liệu
ALTER PROCEDURE TKHD
    @Mahdhd NVARCHAR(50) = NULL,
    @Mactsp NVARCHAR(50) = NULL,
    @tensp NVARCHAR(15) = NULL,
    @Manv NVARCHAR(50) = NULL,
    @tennv NVARCHAR(30) = NULL,
    @Makh NVARCHAR(50) = NULL,
    @tenkh NVARCHAR(30) = NULL,
    @ngaydat DATETIME = NULL,
    @giamgia FLOAT = NULL,
    @slg INT = NULL,
    @giamban FLOAT = NULL,
    @thanhtien FLOAT = NULL
AS
BEGIN
    SELECT hddh.sMaHDDH, sp.sMaCTSP, sp.sTenSP, nv.sMaNV, nv.sTenNV, kh.sTenKH, kh.sMaKH,
           ddh.dNgaymuahang, hddh.iSoLuong,
           hddh.fGiamGia, hddh.fGiaBan, hddh.fThanhtien
    FROM tblChiTietDatHang hddh
    INNER JOIN tblDonDatHang ddh ON hddh.sMaHDDH = ddh.sMaHDDH
    INNER JOIN tblChiTietSanPham sp ON hddh.sMaCTSP = sp.sMaCTSP
    INNER JOIN tblNhanVien nv ON ddh.sMaNV = nv.sMaNV
    INNER JOIN tblKhachHang kh ON ddh.sMaKH = kh.sMaKH
    WHERE 
        (@Mactsp IS NULL OR sp.sMaCTSP = @Mactsp) AND
        (@Mahdhd IS NULL OR hddh.sMaHDDH = @Mahdhd) AND
        (@tensp IS NULL OR sp.sTenSP LIKE '%' + @tensp + '%') AND
        (@Makh IS NULL OR kh.sMaKH LIKE '%' + @Makh + '%') AND
        (@tenkh IS NULL OR kh.sTenKH LIKE '%' + @tenkh + '%') AND
        (@Manv IS NULL OR nv.sMaNV LIKE '%' + @Manv + '%') AND
        (@tennv IS NULL OR nv.sTenNV LIKE '%' + @tennv + '%') AND
        (@ngaydat IS NULL OR CONVERT(DATE, ddh.dNgaymuahang) = CONVERT(DATE, @ngaydat)) AND
        (@giamban IS NULL OR hddh.fGiaBan = @giamban) AND
        (@giamgia IS NULL OR hddh.fGiamGia = @giamgia) AND
        (@thanhtien IS NULL OR hddh.fThanhtien = @thanhtien) AND
        (@slg IS NULL OR hddh.iSoLuong = @slg)
END
 exec TKHD @tennv='h'

---===============================SẢN PHẦM -===================
		alter  PROC select_sanpham
		as

		select sMaCTSP  as[Mã CT sản phẩm], tblNhacungcap.sMaNCC as[Ma NCC],tblNhacungcap.sTenNCC as[Tên nhà CC],sTenSP as[Tên sản phẩm],
		sChatLieu as[Chất liệu ],
		sMau as[Màu], sSize as[Size],iSoluongSP as[Số lượng tồn]
		from tblChiTietSanPham,tblNhacungcap
		where 
		tblNhacungcap.sMaNCC=tblChiTietSanPham.sMaNCC
		ORDER BY sMaCTSP asc
		exec select_sanpham
---- Tim kiếm theo all trường dữ liệu 
alter  PROCEDURE TK_SP
    @Mactsp NVARCHAR(50) = NULL, @MaNCC NVARCHAR(50) = NULL, @tenncc NVARCHAR(30) = NULL,@tensp NVARCHAR(15) = NULL,
    @chatlieu NVARCHAR(20) = NULL, @mau NVARCHAR(20) = NULL,@size NVARCHAR(10) = NULL,@slg INT = NULL
AS
BEGIN
    SELECT 
        c.sMaCTSP AS [Mã CT sản phẩm], n.sMaNCC AS [Ma NCC], n.sTenNCC AS [Tên nhà CC], c.sTenSP AS [Tên sản phẩm],
        c.sChatLieu AS [Chất liệu],c.sMau AS [Màu], c.sSize AS [Size], c.iSoluongSP AS [Số lượng tồn]
    FROM 
        tblChiTietSanPham c
    INNER JOIN 
        tblNhacungcap n ON c.sMaNCC = n.sMaNCC
    WHERE 
        (@Mactsp IS NULL OR c.sMaCTSP = @Mactsp) AND
        (@MaNCC IS NULL OR n.sMaNCC = @MaNCC) AND
        (@tenncc IS NULL OR n.sTenNCC LIKE '%' + @tenncc + '%') AND
        (@tensp IS NULL OR c.sTenSP LIKE '%' + @tensp + '%') AND
        (@chatlieu IS NULL OR c.sChatLieu LIKE '%' + @chatlieu + '%') AND
        (@mau IS NULL OR c.sMau LIKE '%' + @mau + '%') AND
        (@size IS NULL OR c.sSize LIKE '%' + @size + '%') AND
        (@slg IS NULL OR c.iSoluongSP = @slg)
END
 exec TK_SP  @MaNCC='NCC001'
	--Đổi thuộc tính của bảng dơn nhâp hàng 

--=============Tìm kiếm hóa đơn nhập hàng theo mã hóa đơn =========


/*select *from tblDonDatHang where tblDonDatHang.sMaHDDH = 'MHDB002' go
	
	select *from tblKhachHang where tblKhachHang.sMaKH = 'a';go
select sMaNV from tblNhanVien where tblNhanVien.sTenNV = N'Nguyễn Văn A';

	update tblNhanVien set sTenNV = N'c', bGioiTinh = 1, sDiachi = 'b' from tblNhanVien
	where tblNhanVien.sMaNV = 'a'
	go

	update tblNhanVien
	set sDienthoai = '1111111', dNgayvaolam = '20231002', fLuongcoban = 2
	from tblNhanVien
	where tblNhanVien.sMaNV = 'a'
	go
	*/

--============== Tìm kiếm sản phẩm theo mã 
CREATE PROC TKSP_ma
@Masp nvarchar(50)
as
	select tblChiTietSanPham.sMaSP, tblSanPham.sTenSP, tblSanPham.sChatLieu, tblChiTietSanPham.sMau, tblChiTietSanPham.sSize,
	tblChiTietSanPham.iSoluongSP
	from tblChiTietSanPham
	inner join tblSanPham on tblSanPham.sMaSP = tblChiTietSanPham.sMaSP 
	where tblChiTietSanPham.sMaSP = @Masp
	go

EXEC TKSP_ma @Masp="MSP001"



-- Trigger cập nhật đơn đặt hàng
	-- Mua thêm thì tự động tăng tiền hàng lên
	--alter view TG_DDH 
	--AS
	--select tblDonDatHang.sMaHDDH AS [Số HD], 
	--sum(tblChiTietDatHang.iSoLuong*tblChiTietDatHang.fGiaBan - tblChiTietDatHang.fGiamGia)  AS [Thành tiền ] 
	--from tblDonDatHang
	--inner join tblChiTietDatHang on tblChiTietDatHang.sMaHDDH = tblDonDatHang.sMaHDDH
	--where tblChiTietDatHang.sMaHDDH = tblDonDatHang.sMaHDDH
	--group by tblDonDatHang.sMaHDDH
	--go
	--drop  view TG_DDH


   

	
	-- Tạo Trigger để cập nhật dữ liệu vào bảng Đơn Đặt Hàng
	--create trigger TG_TDCN_TongSoTienMua
	--ON tblChiTietDatHang
	--AFTER INSERT
	--AS
	--begin
	--	update tblDonDatHang
	--	set fThanhtien += inserted.iSoLuong*inserted.fGiaBan - inserted.fGiamGia
	--	from inserted
	--	inner join tblDonDatHang on tblDonDatHang.sMaHDDH = inserted.sMaHDDH
	--end
	--go
	--DROP TRIGGER  TG_TDCN_TongSoTienMua 
	select*from TG_TDCN_TongSoTienMua

	-- Trigger cập nhật đơn nhập hàng
	
	-- Trigger cập nhật số lượng sản phẩm
	-- View số lượng sản phẩm đã bán
	create view TG_SLSPB AS
	select tblChiTietSanPham.sMaCTSP AS [Số HD], sum(tblChiTietDatHang.iSoLuong)  AS [Tổng Số Đã Bán] 
	from tblChiTietSanPham
	inner join tblChiTietDatHang on tblChiTietDatHang.sMaCTSP = tblChiTietSanPham.sMaCTSP 
	where tblChiTietDatHang.sMaCTSP = tblChiTietSanPham.sMaCTSP
	group by tblChiTietSanPham.sMaCTSP 
	go

	-- Cập nhật số lượng sản phẩm sau khi bán
	update tblChiTietSanPham
	set iSoluongSP -= TG_SLSPB.[Tổng Số Đã Bán]
	from TG_SLSPB
	where tblChiTietSanPham.sMaCTSP = TG_SLSPB.[Số HD]
	go

	-- Trigger cập nhật
	create trigger TG_SoLuongSPBan
	ON tblChiTietDatHang
	AFTER INSERT
	AS
	begin
		update tblChiTietSanPham
		set iSoluongSP -= inserted.iSoLuong
		from inserted
		inner join tblChiTietSanPham on inserted.sMaCTSP = tblChiTietSanPham.sMaCTSP
	end
	go
	----====  lay thong tin hoa don
	


	select*from tblNhacungcap
	select*from tblNhanVien
	select*from tblKhachHang
	select*from tblChiTietSanPham
	select*from tblDonDatHang
	select*from tblChiTietDatHang

	

