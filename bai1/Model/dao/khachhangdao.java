package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.GioHangbean;
import bean.khachhangbean;
import bo.GioHangbo;

public class khachhangdao {
	public khachhangbean getkh2(String un, String pass) throws Exception{
		 //b1: ket noi
   	DungChung dc= new DungChung();
   	dc.KetNoi();
   	//B2: Lay du lieu ve
   	String sql="select KhachHang.makh,KhachHang.hoten,KhachHang.diachi,KhachHang.sodt,KhachHang.email,KhachHang.tendn,KhachHang.pass from (KhachHang join DangNhap on KhachHang.tendn=DangNhap.TenDangNhap and KhachHang.pass=DangNhap.MatKhau)  where tendn=? and pass=? and Quyen=0";
   	PreparedStatement cmd= dc.cn.prepareStatement(sql);
   	cmd.setString(1, un);
   	cmd.setString(2, pass);
ResultSet rs= cmd.executeQuery();
   	if(rs.next()==false)
   	{
   		dc.cn.close();
   		return null;
   	}
   	else {
   		String makh=rs.getString("makh");
   		String hoten=rs.getString("hoten");
   		String diachi=rs.getString("diachi");
   		String sodt=rs.getString("sodt");
   		String email=rs.getString("email");
   		String tendn=rs.getString("tendn");
   		String matkhau=rs.getString("pass");
   		khachhangbean kh= new khachhangbean(makh, hoten, diachi,sodt,email,tendn, matkhau);
   		dc.cn.close();
   		return kh;
   	}
	}
	public ArrayList<khachhangbean> gethdkh() throws Exception{
		 ArrayList<khachhangbean> ds= new ArrayList<khachhangbean>();
		//b1: ket noi
  	DungChung dc= new DungChung();
  	dc.KetNoi();
  	//B2: Lay du lieu ve
  	String sql="select KhachHang.makh,KhachHang.hoten,KhachHang.diachi,KhachHang.sodt,KhachHang.email,KhachHang.tendn,KhachHang.pass from (KhachHang join DangNhap on KhachHang.tendn=DangNhap.TenDangNhap and KhachHang.pass=DangNhap.MatKhau)  where Quyen=1";
  	PreparedStatement cmd= dc.cn.prepareStatement(sql);
  	
ResultSet rs= cmd.executeQuery();
while(rs.next()) {
  		String makh=rs.getString("makh");
  		String hoten=rs.getString("hoten");
  		String diachi=rs.getString("diachi");
  		String sodt=rs.getString("sodt");
  		String email=rs.getString("email");
  		String tendn=rs.getString("tendn");
  		String matkhau=rs.getString("pass");
  		ds.add(new khachhangbean(makh, hoten, diachi,sodt,email,tendn, matkhau)) ; 		
  	}
  	dc.cn.close();
  	return ds;
  	
	}
	
	public khachhangbean getkh(String un, String pass) throws Exception{
		 //b1: ket noi
    	DungChung dc= new DungChung();
    	dc.KetNoi();
    	//B2: Lay du lieu ve
    	String sql="select * from KhachHang where tendn=? and pass=?";
    	PreparedStatement cmd= dc.cn.prepareStatement(sql);
    	cmd.setString(1, un);
    	cmd.setString(2, pass);
ResultSet rs= cmd.executeQuery();
    	if(rs.next()==false)
    	{
    		dc.cn.close();
    		return null;
    	}
    	else {
    		String makh=rs.getString("makh");
    		String hoten=rs.getString("hoten");
    		String diachi=rs.getString("diachi");
    		String sodt=rs.getString("sodt");
    		String email=rs.getString("email");
    		String tendn=rs.getString("tendn");
    		String matkhau=rs.getString("pass");
    		khachhangbean kh= new khachhangbean(makh, hoten, diachi,sodt,email,tendn, matkhau);
    		dc.cn.close();
    		return kh;
    	}
	}
	public int dangky(String un,String pass,String name, String diachi, String sodt,String email)  {
		 //b1: ket noi
		try {
			DungChung dc= new DungChung();
			dc.KetNoi();
			//B2: Lay du lieu ve
			//String sql="select * from KhachHang where tendn=? and pass=?";
			String sql="insert into DangNhap(TenDangNhap,MatKhau,Quyen) values(?,?,1);"
					+ "insert into KhachHang(makh,hoten,diachi,sodt,email,tendn,pass) "
					+ "values((select max(makh)+1 from KhachHang),?,?,?,?,?,?);";
					
			
			PreparedStatement cmd= dc.cn.prepareStatement(sql);
			cmd.setString(1, un);
			cmd.setString(2, pass);
			cmd.setString(3, name);
			cmd.setString(4, diachi);
			cmd.setString(5, sodt);
			cmd.setString(6, email);
			cmd.setString(7, un);
			cmd.setString(8, pass);
		 cmd.executeUpdate();
		} catch (Exception e) {
			 return 0;
		}	
	//dc.cn.close();
	return 1;

	}
	public int dangkyad(String un,String pass,String name, String diachi, String sodt,String email)  {
		 //b1: ket noi
		try {
			DungChung dc= new DungChung();
			dc.KetNoi();
			//B2: Lay du lieu ve
			//String sql="select * from KhachHang where tendn=? and pass=?";
			String sql="insert into DangNhap(TenDangNhap,MatKhau,Quyen) values(?,?,0);"
					+ "insert into KhachHang(makh,hoten,diachi,sodt,email,tendn,pass) "
					+ "values((select max(makh)+1 from KhachHang),?,?,?,?,?,?);";
					
			
			PreparedStatement cmd= dc.cn.prepareStatement(sql);
			cmd.setString(1, un);
			cmd.setString(2, pass);
			cmd.setString(3, name);
			cmd.setString(4, diachi);
			cmd.setString(5, sodt);
			cmd.setString(6, email);
			cmd.setString(7, un);
			cmd.setString(8, pass);
		 cmd.executeUpdate();
		} catch (Exception e) {
			 return 0;
		}	
	//dc.cn.close();
	return 1;

	}
	public int xacNhan(String un,String pass,String name, String diachi, String sodt,String email,String makh,ArrayList<GioHangbean> gh1)
	{
		try {
			DungChung dc= new DungChung();
			dc.KetNoi();
			//B2: Lay du lieu ve
			//String sql="select * from KhachHang where tendn=? and pass=?";
			
			String sql="update KhachHang set hoten=?,diachi=?,sodt=?,email=? where tendn=? and pass=?;insert into hoadon(MaHoaDon,makh,NgayMua,damua) values((select max(MaHoaDon) from hoadon)+1,?,GETDATE(),0);";								
			PreparedStatement cmd= dc.cn.prepareStatement(sql);			
			cmd.setString(1, name);
			cmd.setString(2, diachi);
			cmd.setString(3, sodt);
			cmd.setString(4, email);
			cmd.setString(5, un);
			cmd.setString(6, pass);	
			cmd.setString(7, makh);	
		 cmd.executeUpdate();		 
		 for(GioHangbean g1:gh1)
		 {
			 sql="insert into ChiTietHoaDon(MaChiTietHD,mavpp,SoLuongMua,MaHoaDon) values((select max(MaChiTietHD) from ChiTietHoaDon)+1,?,?,(select max(MaHoaDon) from hoadon));";
			 cmd= dc.cn.prepareStatement(sql);
			 cmd.setString(1, g1.getMavpp());
				cmd.setLong(2, g1.getSlmua());
				cmd.executeUpdate();		 
		 }
		} catch (Exception e) {
			 return 0;
		}	
	//dc.cn.close();
	return 1;
	}
}
