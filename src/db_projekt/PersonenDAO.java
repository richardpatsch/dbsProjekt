package db_projekt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PersonenDAO {
	static Connection currentCon = null;
	static ResultSet rs = null;
	
	public static PersonenBean login(PersonenBean bean) {
		Statement stmt = null;
		String svid = bean.getSVId();
		String pw = bean.getPassword();
		
		String query = "select * from Personen where SVId='" + svid + "' AND password = '" + pw + "'";
		
		System.out.println("Your svid is " + svid);
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
				System.out.println("Welcome " + svid);
				bean.setSVId(svid);
				bean.setVorname(rs.getString("Vorname"));
				bean.setNachname(rs.getString("Nachname"));
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

	public static int save(PersonenBean u){  
	    int status=0;  
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        		"insert into Personen (SVId, Vorname, Nachname, PLZ, Ort, Strasse, HNr, Telefonnummer_a, Telefonnummer_b, Password) values (?,?,?,?,?,?,?,?,?,?);");  
	        ps.setString(1,u.getSVId());  
	        ps.setString(2,u.getVorname());  
	        ps.setString(3,  u.getNachname());
	        ps.setInt(4,  u.getPLZ());
	        ps.setString(5,  u.getOrt());
	        ps.setString(6,  u.getStrasse());
	        ps.setInt(7, u.getHNr());
	        ps.setString(8,  u.getTelefonnummer_a());
	        ps.setString(9,  u.getTelefonnummer_b());
	        ps.setString(10,  u.getPassword());
	        
	        System.out.println(ps.toString());
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	
	public static int update(PersonenBean u){  
	    int status=0;  
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        		"update Personen set SVId=?, Vorname=?, Nachname=?, PLZ=?, Ort=?, Strasse=?, HNr=?, Telefonnummer_a=?, Telefonnummer_b=?, Password=?");  
	        ps.setString(1,u.getSVId());  
	        ps.setString(2,u.getVorname());  
	        ps.setString(3,  u.getNachname());
	        ps.setInt(4,  u.getPLZ());
	        ps.setString(5,  u.getOrt());
	        ps.setString(6,  u.getStrasse());
	        ps.setInt(7, u.getHNr());
	        ps.setString(8,  u.getTelefonnummer_a());
	        ps.setString(9,  u.getTelefonnummer_b());
	        ps.setString(10,  u.getPassword());

	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	
	public static int delete(PersonenBean u){  
	    int status=0;  
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from Personen where SVId=?");  
	        ps.setString(1,u.getSVId());  
	        
	        System.out.println(ps.toString());
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  
	
	public static List<PersonenBean> getAllRecords(){  
	    List<PersonenBean> list=new ArrayList<PersonenBean>();  
	      
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from Personen");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            PersonenBean u=new PersonenBean();  
	            u.setSVId(rs.getString("SVId"));  
	            u.setVorname(rs.getString("Vorname"));  
	            u.setNachname(rs.getString("Nachname"));
	            u.setPLZ(rs.getInt("PLZ"));
	            u.setOrt(rs.getString("Ort"));
	            u.setStrasse(rs.getString("Strasse"));
	            u.setHNr(rs.getInt("HNr"));
	            u.setTelefonnummer_a(rs.getString("Telefonnummer_a"));
	            u.setTelefonnummer_b(rs.getString("Telefonnummer_b"));
	            u.setPassword(rs.getString("password")); 

	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
	
	public static PersonenBean getRecordById(int id){  
	    PersonenBean u=null;  
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from Personen where SVId=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new PersonenBean();  
	            u.setSVId(rs.getString("SVId"));  
	            u.setVorname(rs.getString("Vorname"));  
	            u.setNachname(rs.getString("Nachname"));
	            u.setPLZ(rs.getInt("PLZ"));
	            u.setOrt(rs.getString("Ort"));
	            u.setStrasse(rs.getString("Strasse"));
	            u.setHNr(rs.getInt("HNr"));
	            u.setTelefonnummer_a(rs.getString("Telefonnummer_a"));
	            u.setTelefonnummer_b(rs.getString("Telefonnummer_b"));
	            u.setPassword(rs.getString("password")); 
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}  
	
}
