package bo;

import java.util.ArrayList;

import bean.ChiTietHoaDonbean;
import dao.ChiTietHoaDondao;

public class ChiTietHoaDonbo {
	ChiTietHoaDondao hddao= new ChiTietHoaDondao();
	public ArrayList<ChiTietHoaDonbean> gethd(String makh)
	{
		try {
			return hddao.gethd(makh);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return null;
		}
	}
		
}
