package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import bean.vanphongphambean;

public class vanphongphamdao {
	public ArrayList<vanphongphambean> getvpp() throws Exception{
		ArrayList<vanphongphambean> ds= new ArrayList<vanphongphambean>();
    	//b1: ket noi
    	DungChung dc= new DungChung();
    	dc.KetNoi();
    	//B2: Lay du lieu ve
    	String sql="Select * from vanphongpham";
    	PreparedStatement cmd= dc.cn.prepareStatement(sql);
    	ResultSet rs= cmd.executeQuery();
//b3: Duyet qua cac du lieu lay ve de luu vao 1 mang
    	while(rs.next()) {
    		  String mavpp=rs.getString("mavpp");
    		  String tenvpp=rs.getString("tenvpp");
    		  
    		  Long gia=rs.getLong("gia");
    		  String anh=rs.getString("anh");
    		  String maloai=rs.getString("maloai");
    		
    		
    		ds.add(new vanphongphambean(mavpp, tenvpp,gia,anh,maloai));
    	}
    	//Dong ket noi
    	rs.close();
    	dc.cn.close();
    	return ds;
	

}
	public int them(String mavpp,String anh)  {
		 //b1: ket noi
		try {
			DungChung dc= new DungChung();
			dc.KetNoi();
			//B2: Lay du lieu ve
			
			String sql="insert into vanphongpham(mavpp,anh,NgayNhap) values(?,?,GETDATE())";
					
			
			PreparedStatement cmd= dc.cn.prepareStatement(sql);
			cmd.setString(1, mavpp);			
			cmd.setString(2	, anh);
		 cmd.executeUpdate();
		 dc.cn.close();
		} catch (Exception e) {
			 return 0;
		}	
	//
	return 1;

	}
	
	public int themVpp(String mavpp, String tenvpp,String soluong,String gia, String tenloai,String anh)  {
		 //b1: ket noi
		try {
			DungChung dc= new DungChung();
			dc.KetNoi();
			//B2: Lay du lieu ve
			
			String sql="update vanphongpham set tenvpp=?,soluong=?,gia=?,maloai=(select maloai from loai where tenloai=?) where mavpp=?";
			//update sach set tensach=?,soluong=?,gia=?,maloai=(select maloai from loai where tenloai=?),sotap=?,tacgia=? where masach=?	
			
			PreparedStatement cmd= dc.cn.prepareStatement(sql);
			
			cmd.setString(1, tenvpp);
			long sl= Long.parseLong(soluong);
			long g= Long.parseLong(gia);
			
			cmd.setLong(2,sl );
			cmd.setLong(3,g);
			cmd.setString(4, tenloai);
			
			
			cmd.setString(5, mavpp);
		 cmd.executeUpdate();
		 dc.cn.close();
		
		} catch (Exception e) {
			 return 0;
		}	
	
	return 1;

	}
	
	public int xoaVpp(String mavpp)  {
		 //b1: ket noi
		try {
			DungChung dc= new DungChung();
			dc.KetNoi();
			//B2: Lay du lieu ve
			
			String sql="delete from vanphongpham where mavpp=?";
					
			
			PreparedStatement cmd= dc.cn.prepareStatement(sql);
			cmd.setString(1, mavpp);			
			
		 cmd.executeUpdate();
		 dc.cn.close();
		} catch (Exception e) {
			 return 0;
		}	
	
	return 1;

	}
	public int suaVpp(String mavpp,String tenvpp,String gia,String tenloai)  {
		 //b1: ket noi
		try {
			DungChung dc= new DungChung();
			dc.KetNoi();
			//B2: Lay du lieu ve
			
			String sql="update vanphongpham set tenvpp=?, gia=?, maloai=(select maloai from loai where tenloai=?) where mavpp=?";
					
			
			PreparedStatement cmd= dc.cn.prepareStatement(sql);
			cmd.setString(1, tenvpp);	
			long g= Long.parseLong(gia);
			
			cmd.setLong(2, g);	
			
			cmd.setString(3, tenloai);
			cmd.setString(4, mavpp);	
			
		 cmd.executeUpdate();
		 dc.cn.close();
		} catch (Exception e) {
			 return 0;
		}	
	
	return 1;

	}
	public int suaAnh(String mavpp,String anh)  {
		 //b1: ket noi
		try {
			DungChung dc= new DungChung();
			dc.KetNoi();
			//B2: Lay du lieu ve
			
			String sql="update vanphongpham set anh=? where mavpp=?";
					
			
			PreparedStatement cmd= dc.cn.prepareStatement(sql);
			cmd.setString(1, anh);	
			
			cmd.setString(2, mavpp);	
			
		 cmd.executeUpdate();
		 dc.cn.close();
		} catch (Exception e) {
			 return 0;
		}	
	
	return 1;

	}

}
