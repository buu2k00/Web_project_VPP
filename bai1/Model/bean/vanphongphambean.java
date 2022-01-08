package bean;

public class vanphongphambean {
	private String mavpp;
	private String tenvpp;
	private Long gia;
	private String anh;
	private String maloai;
	public vanphongphambean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public vanphongphambean(String mavpp, String tenvpp, Long gia, String anh, String maloai) {
		super();
		this.mavpp = mavpp;
		this.tenvpp = tenvpp;
		this.gia = gia;
		this.anh = anh;
		this.maloai = maloai;
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
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	

}
