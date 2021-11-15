// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CrecomDAO.java

package com.example.repository;

import com.example.domain.CrecomVO;
import java.sql.*;
import java.util.Vector;

// Referenced classes of package com.example.repository:
//            JdbcUtils

public class CrecomDAO {
	private static CrecomDAO instance;
	
    public static CrecomDAO getInstance() {
        if(instance == null) {
            instance = new CrecomDAO();
        }
        return instance;
    } // end of getInstance

    private CrecomDAO() {} // end of CrecomDAO

    public CrecomVO select(long csnum, String cusid) {
        CrecomVO 			crecom	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select csnum, cusid, recom ");
            query.append(" from Crecom  ");
            query.append(" where csnum = ? and cusid = ?  ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            pstmt.setString(2, cusid);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                crecom = new CrecomVO();
                crecom.setCsnum(rs.getInt("csnum"));
                crecom.setCusid(rs.getString("cusid"));
                crecom.setRecom(rs.getInt("recom"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return crecom;
    }

    public CrecomVO select(long csnum) {
    	CrecomVO 			crecom	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select sum(recom) as recom ");
            query.append(" from Crecom  ");
            query.append(" where csnum = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                crecom = new CrecomVO();
                crecom.setRecom(rs.getInt("recom"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return crecom;
    } // end of select

    public Vector selectAll() {
        Vector 				crecomV = new Vector();
        CrecomVO 			crecom	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select csnum, cusid, recom ");
            query.append(" from Crecom ");
            pstmt = con.prepareStatement(query.toString());
            rs = pstmt.executeQuery();
            while(rs.next()) {
                crecom = new CrecomVO();
                crecom.setCsnum(rs.getInt("csnum"));
                crecom.setCusid(rs.getString("cusid"));
                crecom.setRecom(rs.getInt("recom"));
                crecomV.addElement(crecom);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return crecomV;
    } // end of selectAll

    public Vector selectAll(long csnum) {
    	Vector 				crecomV = new Vector();
        CrecomVO 			crecom	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append("Select csnum, cusid, recom ");
            query.append("  from Crecom  ");
            query.append("  where csnum = ?  ");
            query.append("  order by cusid");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                crecom = new CrecomVO();
                crecom.setCsnum(rs.getInt("csnum"));
                crecom.setCusid(rs.getString("cusid"));
                crecom.setRecom(rs.getInt("recom"));
                crecomV.addElement(crecom);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return crecomV;
    } // end of selectAll

    public Vector selectBetween(long csnum, String f_cusid, String t_cusid) {
        return selectBetween(csnum, f_cusid, t_cusid, 0);
    } // end of selectBetween

    public Vector selectBetween(long csnum, String f_cusid, String t_cusid, int lastKeyOrder) {
    	Vector 				crecomV = new Vector();
        CrecomVO 			crecom	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append("Select csnum, cusid, recom ");
            query.append("  from Crecom  ");
            query.append("  where csnum = ?  ");
            query.append("  and cusid between ? and ?  ");
            if(lastKeyOrder == 1) {
                query.append(" order by DESC cusid");
            } else {
                query.append(" order by cusid");
            }
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            pstmt.setString(2, f_cusid);
            pstmt.setString(3, t_cusid);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                crecom = new CrecomVO();
                crecom.setCsnum(rs.getInt("csnum"));
                crecom.setCusid(rs.getString("cusid"));
                crecom.setRecom(rs.getInt("recom"));
                crecomV.addElement(crecom);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return crecomV;
    } // end of selectBetween

    public void insert(CrecomVO crecom) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append(" Insert into Crecom(");
            query.append("csnum, ctype, cusid, recom");
            query.append(") values (");
            query.append("?, ?, ?, ?)");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, crecom.getCsnum());
            pstmt.setString(2, crecom.getCtype());
            pstmt.setString(3, crecom.getCusid());
            pstmt.setInt(4, crecom.getRecom() + 1);
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of insert

    public void update(CrecomVO crecom) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Update Crecom SET ");
            query.append("csnum = ?, cusid = ?, recom = ?");
            query.append(" where csnum = ? and cusid = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, crecom.getCsnum());
            pstmt.setString(2, crecom.getCusid());
            if(crecom.getRecom() <= 0) {
                pstmt.setInt(3, crecom.getRecom() + 1);
            } else {
                pstmt.setInt(3, crecom.getRecom() - 1);
            }
            pstmt.setLong(4, crecom.getCsnum());
            pstmt.setString(5, crecom.getCusid());
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of update

    public void delete(long csnum, String cusid) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Delete From Crecom ");
            query.append("where csnum = ? and cusid = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            pstmt.setString(2, cusid);
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of delete

    public void delete(String cusid) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Delete From Crecom ");
            query.append("where cusid = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, cusid);
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of delete

    public void delete() {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Delete From Crecom ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of delete

    public void delete(long csnum) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Delete From Crecom ");
            query.append("where csnum = ?");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of delete

    public void delete(CrecomVO crecom) throws Exception {
        delete(crecom.getCsnum(), crecom.getCusid());
    } // end of delete

    public int count(long csnum, String cusid) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Crecom ");
            query.append(" where csnum = ? and cusid = ?   ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            pstmt.setString(2, cusid);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                count = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return count;
    } // end of count

    public int count(String cusid) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Crecom ");
            query.append(" where  cusid = ?   ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, cusid);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                count = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return count;
    } // end of count

    public int countAll(long csnum) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Crecom ");
            query.append(" where csnum = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                count = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return count;
    } // end of countAll

    public int count(long csnum) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT sum(recom) as recom from Crecom ");
            query.append(" where csnum = ?   ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                count = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return count;
    } // end of count

    public int countRecom(String csnum) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT sum(recom) from Crecom ");
            query.append(" where (csnum|cusid) = ?   ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, csnum);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                count = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return count;
    } // end of countRecom

    public int count() {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Crecom  ");
            pstmt = con.prepareStatement(query.toString());
            rs = pstmt.executeQuery();
            if(rs.next()) {
                count = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return count;
    } // end of count
} // end of CrecomDAO