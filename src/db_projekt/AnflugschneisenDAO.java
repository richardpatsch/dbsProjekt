package db_projekt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AnflugschneisenDAO {
	public static List<AnflugschneisenBean> getAllRecords(){  
	    List<AnflugschneisenBean> list=new ArrayList<AnflugschneisenBean>();  
	      
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from Anflugschneisen");  
	        
	        System.out.println(ps.toString());
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        		AnflugschneisenBean u=new AnflugschneisenBean();  
	            u.setSchneisennummer(rs.getInt("Schneisennummer"));  
	            
	            System.out.println(rs.getInt("Schneisennummer"));

	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    
	    System.out.println(list.size());
	    return list;  
	}  
	
	public static AnflugschneisenBean getRecordById(String id){  
		AnflugschneisenBean u=null;  
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from Anflugschneisen where Schneisennummer=?");  
	        ps.setString(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new AnflugschneisenBean();  
	            u.setSchneisennummer(rs.getInt("Schneisennummer"));  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	} 
}
