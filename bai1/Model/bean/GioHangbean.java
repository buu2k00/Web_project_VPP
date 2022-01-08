package bean;

public class GioHangbean {
	
	private String mavpp;
	private String tenvpp;
	
	private Long gia;
	private long slmua;
	private String anh;
	private long thanhtien;

	public GioHangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public GioHangbean(String mavpp, String tenvpp, Long gia, long slmua, String anh) {
		super();
		this.mavpp = mavpp;
		this.tenvpp = tenvpp;
		this.gia = gia;
		this.slmua = slmua;
		this.anh = anh;
		
	}
	


	public String getMavpp() {
		return mavpp;
	}


	public void setMavpp(String mavpp) {
		this.mavpp = mavpp;
	}


	public String getTenvpp() {
		return tenvpp;
	}


	public void setTenvpp(String tenvpp) {
		this.tenvpp = tenvpp;
	}


	public Long getGia() {
		return gia;
	}
	public void setGia(Long gia) {
		this.gia = gia;
	}
	public long getSlmua() {
		return slmua;
	}
	public void setSlmua(long slmua) {
		this.slmua = slmua;
	}
	public long getThanhtien() {
		return gia*slmua;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	
	
	
}
