package db_projekt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class KontaktpersonDAO {
	public static List<KontaktpersonBean> getAllRecords(){  
	    List<KontaktpersonBean> list=new ArrayList<KontaktpersonBean>();  
	      
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from Kontaktperson_Raumfluggesellschaft");  
	        
	        System.out.println(ps.toString());
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            KontaktpersonBean u=new KontaktpersonBean();  
	            u.setSVId(rs.getString("SVId"));  
	            u.setKundennumer(rs.getInt("Kundennummer"));
	            u.setName(rs.getString("Name"));
	            
	            list.add(u);  
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
	
	public static KontaktpersonBean getRecordById(int id){  
		KontaktpersonBean u=null;  
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from Kontaktperson_Raumfluggesellschaft where SVId=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            u=new KontaktpersonBean();  
	            u.setSVId(rs.getString("SVId"));  
	            u.setKundennumer(rs.getInt("Kundennummer"));  
	            u.setName(rs.getString("Name"));
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	} 
}
