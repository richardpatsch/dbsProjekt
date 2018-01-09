package db_projekt;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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

	
	public static int save(UserBean u){  
	    int status=0;  
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"insert into users(username,password) values(?,?);");  
	        ps.setString(1,u.getUserName());  
	        ps.setString(2,u.getPassWord());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	public static int update(UserBean u){  
	    int status=0;  
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	"update users set username=?,password=? where id=?");  
	        ps.setString(1,u.getUserName());  
	        ps.setString(2,u.getPassWord());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	public static int delete(UserBean u){  
	    int status=0;  
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from users where id=?");  
	        ps.setInt(1,u.getID());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  
	public static List<UserBean> getAllRecords(){  
	    List<UserBean> list=new ArrayList<UserBean>();  
	      
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from users");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            UserBean u=new UserBean();  
	            u.setID(rs.getInt("ID"));  
	            u.setUserName(rs.getString("username"));  
	            u.setPassWord(rs.getString("password"));  

	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
	public static UserBean getRecordById(int id){  
	    UserBean u=null;  
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from users where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new UserBean();  
	            u.setID(rs.getInt("ID"));  
	            u.setUserName(rs.getString("username"));  
	            u.setPassWord(rs.getString("password"));  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}  
}

	