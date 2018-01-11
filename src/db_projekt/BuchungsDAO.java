package db_projekt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BuchungsDAO {
	public static int save(BuchungsBean u){  
	    int status=0;  
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        		"insert into Kontaktperson_Bucht_Anflugschneisen (SVId, Schneisennummer, Buchungsnummer, Buchungsdatum, Beginnzeit, Endzeit) values (?,?,?,?,?,?);");  
	        ps.setString(1,u.getSVId());  
	        ps.setInt(2,  u.getSchneisennummer());
	        ps.setInt(3,  u.getBuchungsnummer());
	        ps.setString(4,  u.getBuchungsdatum());
	        ps.setString(5,  u.getBeginnzeit());
	        ps.setString(6,  u.getEndzeit());
	        
	        System.out.println(ps.toString());
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}  
	
	public static List<BuchungsBean> getAllRecords(){  
	    List<BuchungsBean> list=new ArrayList<BuchungsBean>();  
	      
	    try{  
	        Connection con=ConnectionManager.getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from Kontaktperson_Bucht_Anflugschneisen");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        		BuchungsBean u=new BuchungsBean();  
	            u.setSVId(rs.getString("SVId"));  
	            u.setSchneisennummer(rs.getInt("Schneisennummer"));
	            u.setBuchungsnummer(rs.getInt("Buchungsnummer"));
	            u.setBuchungsdatum(rs.getString("Buchungsdatum"));
	            u.setBeginnzeit(rs.getString("Beginnzeit"));
	            u.setEndzeit(rs.getString("Endzeit"));

	            list.add(u);  
	        }  
	        
	        System.out.println(list.size());
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
}
