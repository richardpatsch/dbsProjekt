package db_projekt;

import java.sql.*;

public class ConnectionManager {
	static Connection con;
	static String url;
	
	public static Connection getConnection() {
		try {
			String url = "jdbc:mysql://localhost/dbs_weine?useSSL=false";
			Class.forName("com.mysql.jdbc.Driver");
			
			try {
				con = DriverManager.getConnection(url, "root", "k2<1R%of<pmE");
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
		
		return con;
	}

}
