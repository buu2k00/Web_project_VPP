package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {

		public ArrayList<loaibean> getloai() throws Exception{
		    	ArrayList<loaibean> ds= new ArrayList<loaibean>();
		    	//b1: ket noi
		    	DungChung dc= new DungChung();
		    	dc.KetNoi();
		    	//B2: Lay du lieu ve
		    	String sql="Select * from Loai";
		    	PreparedStatement cmd= dc.cn.prepareStatement(sql);
		    	ResultSet rs= cmd.executeQuery();
		//b3: Duyet qua cac du lieu lay ve de luu vao 1 mang
		    	while(rs.next()) {
		    		String maloai=rs.getString("maloai");
		    		String tenloai=rs.getString("tenloai");
		    		ds.add(new loaibean(maloai, tenloai));
		    	}
		    	//Dong ket noi
		    	rs.close();
		    	dc.cn.close();
		    	return ds;
		}

}
