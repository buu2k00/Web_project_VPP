package bean;

import java.util.Date;
import java.sql.Timestamp;

public class ChiTietHoaDonbean {
	private long stt;
    
    private String tenvpp;
    private long soluongmua;
    private String NgayMua;
    private String mua;
    private String makh;
    private String mavpp;
    private String mahd;
    private String macthd;
   
    
	public ChiTietHoaDonbean() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ChiTietHoaDonbean(long stt, String tenvpp, long soluongmua, String ngayMua, String mua, String makh,
			String mavpp, String mahd, String macthd) {
		super();
		this.stt = stt;
		this.tenvpp = tenvpp;
		this.soluongmua = soluongmua;
		NgayMua = ngayMua;
		this.mua = mua;
		this.makh = makh;
		this.mavpp = mavpp;
		this.mahd = mahd;
		this.macthd = macthd;
	}


	public long getStt() {
		return stt;
	}


	public void setStt(long stt) {
		this.stt = stt;
	}


	public String getTenvpp() {
		return tenvpp;
	}


	public void setTenvpp(String tenvpp) {
		this.tenvpp = tenvpp;
	}


	public long getSoluongmua() {
		return soluongmua;
	}


	public void setSoluongmua(long soluongmua) {
		this.soluongmua = soluongmua;
	}


	public String getNgayMua() {
		return NgayMua;
	}


	public void setNgayMua(String ngayMua) {
		NgayMua = ngayMua;
	}


	public String getMua() {
		return mua;
	}


	public void setMua(String mua) {
		this.mua = mua;
	}


	public String getMakh() {
		return makh;
	}


	public void setMakh(String makh) {
		this.makh = makh;
	}


	public String getMavpp() {
		return mavpp;
	}


	public void setMavpp(String mavpp) {
		this.mavpp = mavpp;
	}


	public String getMahd() {
		return mahd;
	}


	public void setMahd(String mahd) {
		this.mahd = mahd;
	}


	public String getMacthd() {
		return macthd;
	}


	public void setMacthd(String macthd) {
		this.macthd = macthd;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
    
}
