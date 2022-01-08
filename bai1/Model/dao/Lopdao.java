package dao;

import java.util.ArrayList;

import bean.Lopbean;

public class Lopdao {
	public ArrayList<Lopbean> getLop()
	{
		ArrayList<Lopbean> ds= new ArrayList<Lopbean>();
		ds.add(new Lopbean("K42A","Công nghệ thông tin K42A"));
		ds.add(new Lopbean("K42B","Công nghệ thông tin K42B"));
		ds.add(new Lopbean("K42C","Công nghệ thông tin K42C"));
		ds.add(new Lopbean("K42D","Công nghệ thông tin K42D"));
		ds.add(new Lopbean("K42E","Công nghệ thông tin K42E"));
		return ds;
	}


}
