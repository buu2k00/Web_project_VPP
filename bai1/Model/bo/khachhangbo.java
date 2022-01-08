package bo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.GioHangbean;
import bean.khachhangbean;
import dao.DungChung;
import dao.khachhangdao;

public class khachhangbo {
	khachhangdao khdao = new khachhangdao();
//	public ArrayList<khachhangbean> getkh(){
//		return ldao.getkh();
//	}
//	
public khachhangbean ktdn(String makh,String matkhau) throws Exception {
		
		return khdao.getkh(makh, matkhau);
		
	}
public khachhangbean ktdn2(String makh,String matkhau) throws Exception {
	
	return khdao.getkh2(makh, matkhau);
	
}
public int dangky(String un,String pass,String name, String diachi, String sodt,String email)  {
	 //b1: ket noi
	return khdao.dangky(un, pass, name, diachi, sodt, email);

}
public int xacNhan(String un,String pass,String name, String dc, String sodt,String email,String makh,ArrayList<GioHangbean> gh1)
{
	return khdao.xacNhan(un, pass, name, dc, sodt, email,makh,gh1);
}

	
}

