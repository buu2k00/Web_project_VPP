package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.ChiTietHoaDonbean;


public class ChiTietHoaDondao {
	public ArrayList<ChiTietHoaDonbean> ds= new ArrayList<ChiTietHoaDonbean>();
	public ArrayList<ChiTietHoaDonbean> gethd(String makh) throws Exception{
		String strDate="";
			ArrayList<ChiTietHoaDonbean> ds= new ArrayList<ChiTietHoaDonbean>();
	    	//b1: ket noi
	    	DungChung dc= new DungChung();
	    	dc.KetNoi();
	    	//B2: Lay du lieu ve
	    	String sql="SELECT ROW_NUMBER() OVER (ORDER BY hoadon.MaHoaDon) AS [stt],hoadon.NgayMua,vanphongpham.tenvpp,ChiTietHoaDon.SoLuongMua,case hoadon.damua when 1 then   N'Đã mua' else N'Chưa mua' end as N'Mua',ChiTietHoaDon.mavpp,hoadon.MaHoaDon,ChiTietHoaDon.MaChiTietHD from (hoadon join ChiTietHoaDon on hoadon.MaHoaDon=ChiTietHoaDon.MaHoaDon join vanphongpham on vanphongpham.mavpp=ChiTietHoaDon.mavpp) where hoadon.makh=?";
	    	PreparedStatement cmd= dc.cn.prepareStatement(sql);
	    	cmd.setString(1, makh);
	    	ResultSet rs= cmd.executeQuery();
	//b3: Duyet qua cac du lieu lay ve de luu vao 1 mang
	    	while(rs.next()) {
	    		 
	    		  long stt=rs.getLong(1);	
	    		  SimpleDateFormat sdf= new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	    		  
	    		  
	    		  Timestamp NgayMua=rs.getTimestamp(2);
	    		  strDate=sdf.format(NgayMua);
	    		  
	    		  String tensach=rs.getString(3);
	    		     long soluongmua=rs.getLong(4);
	    		   
	    		    String mua=rs.getString(5);
	    		    String mavpp=rs.getString(6);
	    		    String mahd=rs.getString(7);
	    		    String macthd=rs.getString(8);
	    		
	    		
	    		    ds.add(new ChiTietHoaDonbean(stt,tensach,soluongmua,strDate,mua,makh,mavpp,mahd,macthd));
	    		   
	    	}
	    	//Dong ket noi
	    	rs.close();
	    	dc.cn.close();
	    	return ds;
		
		
	

}
	public int update(String makh,String soluong,long damua,String masach,String mahd,String macthd)
	{
		
		long sl= Long.parseLong(soluong);
		try {
			DungChung dc= new DungChung();
			dc.KetNoi();
			//B2: Lay du lieu ve
			//update hoadon set damua=? where damua=? and makh=?;
			//update ChiTietHoaDon set SoLuongMua=? where MaHoaDon=(select MaHoaDon from hoadon where makh=?);
			
			String sql="update hoadon set damua=? where MaHoaDon=?;update ChiTietHoaDon set SoLuongMua=? where MaChiTietHD=? and mavpp=?;";								
			PreparedStatement cmd= dc.cn.prepareStatement(sql);			
			cmd.setLong(1, damua);			
			//cmd.setString(2, makh);
			cmd.setString(2, mahd);
			cmd.setLong(3, sl);
			cmd.setString(4, macthd);
			cmd.setString(5, masach);
		 cmd.executeUpdate();		 
		 
		} catch (Exception e) {
			 return 0;
		}	
		
		return 1;
	}
	
}


