package bo;

import java.util.ArrayList;

import bean.GioHangbean;


public class GioHangbo {
	public ArrayList<GioHangbean> ds= new ArrayList<GioHangbean>();
	public void Them(String masach, String tensach, String tacgia, Long gia, Long slmua,String anh) {
		//Kiem tra xem sach nay da co chua, neu co thi tang soluong
		for(GioHangbean g: ds)
			  if(g.getMavpp().equals(masach)) {
				  g.setSlmua(g.getSlmua()+slmua);
				  return;
			  }
		ds.add(new GioHangbean(masach, tensach, gia, slmua,anh));
	}
	public void xoa(String masach) {
		for(GioHangbean g: ds)
			  if(g.getMavpp().equals(masach)) {
				  ds.remove(g);break;
			  }
	}
	public Long TongTien() {
		long s=(long)0;
		for(GioHangbean g: ds)
			s+=g.getThanhtien();
		return s;
	}
	public void update(String masach,String soluong)
	{
		for(GioHangbean g: ds)
			  if(g.getMavpp().equals(masach)) {
				  g.setSlmua(Integer.parseInt(soluong));;
				  break;
			  }
	}
	public void xoahet()
	{
		ds.clear();
	}
}

	
