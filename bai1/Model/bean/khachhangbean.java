package bean;

public class khachhangbean {
	private String makh;
    private String hoten;
    private String diachi;
    private String sodt;
    private String email;
    private String matkhau;
    private String tendn;


	public khachhangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public khachhangbean(String makh, String hoten, String diachi,String sodt,String email,String tendn, String matkhau) {
		super();
		this.makh = makh;
		this.hoten = hoten;
		this.diachi = diachi;
		this.matkhau = matkhau;
		this.tendn = tendn;
		this.sodt=sodt;
		this.email=email;
	}
	public String getMakh() {
		return makh;
	}
	public void setMakh(String makh) {
		this.makh = makh;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getMatkhau() {
		return matkhau;
	}
	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	public String getTendn() {
		return tendn;
	}
	public void setTendn(String tendn) {
		this.tendn = tendn;
	}
	public String getSodt() {
		return sodt;
	}
	public void setSodt(String sodt) {
		this.sodt = sodt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
    

}
