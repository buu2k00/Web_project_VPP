package bean;

public class Lopbean {
private String malop;
private String tenlop;
public Lopbean() {
	super();
	// TODO Auto-generated constructor stub
}
public Lopbean(String malop, String tenlop) {
	super();
	this.malop = malop;
	this.tenlop = tenlop;
}
public String getMalop() {
	return malop;
}
public void setMalop(String malop) {
	this.malop = malop;
}
public String getTenlop() {
	return tenlop;
}
public void setTenlop(String tenlop) {
	this.tenlop = tenlop;
}
@Override
public String toString() {
	return "Lopbean [malop=" + malop + ", tenlop=" + tenlop + "]";
}

}
