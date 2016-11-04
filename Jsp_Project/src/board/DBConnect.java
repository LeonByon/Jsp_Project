package board;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public DBConnect(){}
	
	public Connection getConnection(){
		String url = "jdbc:mysql://130.211.163.108:3306/member?autoReconnect=true&useSSL=false";
		String id ="root";
		String pass = "bjskgs";
		
		Connection con = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,id,pass);
		}catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}
}
