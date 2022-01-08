package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DungChung {
	public Connection cn;
	public void KetNoi() throws Exception{
		//;B1: Xac dinh hqtcsdl
		
		
		
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");		   	 
		   	cn= DriverManager.getConnection("jdbc:sqlserver://ADMINISTRATOR:1433;databaseName=QlVPP2;user=sa;password=123");

		   	
		    System.out.println("Da ket noi");
		
		//;intergratedSecurity=true;
   	 
	}

}
