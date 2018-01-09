package db_projekt;

import java.sql.*;

public class UserDAO {
	static Connection currentCon = null;
	static ResultSet rs = null;
	
	public static UserBean login(UserBean bean) {
		Statement stmt = null;
		String username = bean.getUserName();
		String pw = bean.getPassWord();
		
		String query = "select * from users where username='" + username + "' AND password = '" + pw + "'";
		
		System.out.println("Your user name is " + username);
		System.out.println("Your password is " + pw);
		System.out.println("Query: " + query);
		
		try {
			currentCon = ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			rs = stmt.executeQuery(query);
			boolean more = rs.next();
			
			if (!more) {
				System.out.println("Sorry, you are not registered user! Please sign up first");
				bean.setValid(false);
			} else if (more) {				
				System.out.println("Welcome " + username);
				bean.setUserName(username);
				bean.setValid(true);
			}
		} catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occured! " + ex);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {}
				rs = null;
			}
			
			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e) {
					stmt = null;
				}
			}
			
			if (currentCon != null) {
				try {
					currentCon.close();
				} catch (Exception e) {
					
				}
				currentCon = null;
			}
		}
		
		return bean;
	}

}

	