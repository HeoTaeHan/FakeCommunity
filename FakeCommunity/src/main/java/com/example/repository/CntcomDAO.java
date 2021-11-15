// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CntcomDAO.java

package com.example.repository;

import com.example.domain.CntcomVO;
import java.sql.*;
import java.util.Vector;

// Referenced classes of package com.example.repository:
//            JdbcUtils

public class CntcomDAO {
	private static CntcomDAO instance;
	
    public static CntcomDAO getInstance() {
        if(instance == null) {
            instance = new CntcomDAO();
        }
        return instance;
    } // end of getInstance

    private CntcomDAO() {} // end of CntcomDAO

    public CntcomVO select(long csnum, String cusid) {
        CntcomVO 			cntcom	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select csnum, cusid, cntcm ");
            query.append(" from Cntcom  ");
            query.append(" where csnum = ? and cusid = ?  ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            pstmt.setString(2, cusid);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                cntcom = new CntcomVO();
                cntcom.setCsnum(rs.getInt("csnum"));
                cntcom.setCusid(rs.getString("cusid"));
                cntcom.setCntcm(rs.getInt("cntcm"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cntcom;
    } // end of select

    public CntcomVO select(long csnum) {
    	CntcomVO 			cntcom	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select sum(cntcm) as cntcm ");
            query.append(" from Cntcom  ");
            query.append(" where csnum = ?");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                cntcom = new CntcomVO();
                cntcom.setCntcm(rs.getInt("cntcm"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cntcom;
    } // end of select

    public Vector selectAll() {
        Vector 				cntcomV	= new Vector();
        CntcomVO 			cntcom	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select csnum, cusid, cntcm ");
            query.append(" from Cntcom ");
            pstmt = con.prepareStatement(query.toString());
            rs = pstmt.executeQuery();
            while(rs.next()) {
                cntcom = new CntcomVO();
                cntcom.setCsnum(rs.getInt("csnum"));
                cntcom.setCusid(rs.getString("cusid"));
                cntcom.setCntcm(rs.getInt("cntcm"));
                cntcomV.addElement(cntcom);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cntcomV;
    } // end of selectAll

    public Vector selectAll(long csnum) {
    	Vector 				cntcomV	= new Vector();
        CntcomVO 			cntcom	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append("Select csnum, cusid, cntcm ");
            query.append("  from Cntcom  ");
            query.append("  where csnum = ?  ");
            query.append("  order by cusid");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                cntcom = new CntcomVO();
                cntcom.setCsnum(rs.getInt("csnum"));
                cntcom.setCusid(rs.getString("cusid"));
                cntcom.setCntcm(rs.getInt("cntcm"));
                cntcomV.addElement(cntcom);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cntcomV;
    } // end of selectAll

    public Vector selectBetween(long csnum, String f_cusid, String t_cusid) {
        return selectBetween(csnum, f_cusid, t_cusid, 0);
    } // end of selectBetween

    public Vector selectBetween(long csnum, String f_cusid, String t_cusid, int lastKeyOrder) {
    	Vector 				cntcomV	= new Vector();
        CntcomVO 			cntcom	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append("Select csnum, cusid, cntcm ");
            query.append("  from Cntcom  ");
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
                cntcom = new CntcomVO();
                cntcom.setCsnum(rs.getInt("csnum"));
                cntcom.setCusid(rs.getString("cusid"));
                cntcom.setCntcm(rs.getInt("cntcm"));
                cntcomV.addElement(cntcom);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cntcomV;
    } // end of selectBetween

    public void insert(CntcomVO cntcom) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append(" Insert into Cntcom(");
            query.append("csnum, cusid, cntcm");
            query.append(") values (");
            query.append("?, ?, ?)");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, cntcom.getCsnum());
            pstmt.setString(2, cntcom.getCusid());
            pstmt.setInt(3, cntcom.getCntcm() + 1);
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of insert

    public void update(CntcomVO cntcom) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Update Cntcom SET ");
            query.append("csnum = ?, cusid = ?, cntcm = ?");
            query.append(" where csnum = ? and cusid = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, cntcom.getCsnum());
            pstmt.setString(2, cntcom.getCusid());
            if(cntcom.getCntcm() <= 0) {
                pstmt.setInt(3, cntcom.getCntcm() + 1);
            } else {
                pstmt.setInt(3, cntcom.getCntcm() - 1);
            }
            pstmt.setLong(4, cntcom.getCsnum());
            pstmt.setString(5, cntcom.getCusid());
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
            query.append("Delete From Cntcom ");
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
            query.append("Delete From Cntcom ");
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

    public void delete(long csnum) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Delete From Cntcom ");
            query.append("where csnum = ? ");
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

    public void delete(CntcomVO cntcom) throws Exception {
        delete(cntcom.getCsnum(), cntcom.getCusid());
    } // end of delete

    public int count(long csnum, String cusid) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Cntcom ");
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
            query.append(" SELECT COUNT(*) from Cntcom ");
            query.append(" where cusid = ?   ");
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
            query.append(" SELECT COUNT(*) from Cntcom ");
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
            query.append(" SELECT sum(cntcm) from Cntcom ");
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
    }

    public int countCntcm(long csnum) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT sum(cntcm) from Cntcom ");
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
    } // end of countCntcm

    public int count() {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Cntcom  ");
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
} // end of CntcomDAO