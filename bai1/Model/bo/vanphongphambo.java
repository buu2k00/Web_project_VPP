package bo;

import java.util.ArrayList;


import bean.vanphongphambean;

import dao.vanphongphamdao;

public class vanphongphambo {

	vanphongphamdao vppdao= new vanphongphamdao();
	public ArrayList<vanphongphambean> getvpp() throws Exception
	{
		return vppdao.getvpp();
	}
	public ArrayList<vanphongphambean>  TimLoai(ArrayList<vanphongphambean> ds, String key){
		ArrayList<vanphongphambean> tam= new ArrayList<vanphongphambean>();
		for(vanphongphambean s: ds)
			if(s.getMaloai().equals(key))
				tam.add(s);
		return tam;
		
	}
	public ArrayList<vanphongphambean>  Tim(ArrayList<vanphongphambean> ds, String key) throws Exception{
		ArrayList<vanphongphambean> tam= new ArrayList<vanphongphambean>();
		for(vanphongphambean s: ds)
			if(s.getTenvpp().toLowerCase().contains(key.toLowerCase())||s.getMavpp().equals(key))
				tam.add(s);
		return tam;
		
	}
	public long demLoai(ArrayList<vanphongphambean> ds,String key) throws Exception
	{
		long count=0;
		for(vanphongphambean s: ds)
			if(s.getMaloai().equals(key)) count++;
		return count;
		
	}

}
