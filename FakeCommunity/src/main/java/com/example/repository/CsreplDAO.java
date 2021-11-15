// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CsreplDAO.java

package com.example.repository;

import com.example.domain.CsreplVO;
import java.sql.*;
import java.util.Vector;

// Referenced classes of package com.example.repository:
//            JdbcUtils

public class CsreplDAO {
	
	private static CsreplDAO instance;

    public static CsreplDAO getInstance() {
        if(instance == null) {
            instance = new CsreplDAO();
        }
        return instance;
    } // end of CsreplDAO

    private CsreplDAO() {} // end of CsreplDAO

    public CsreplVO select(long csnum, long conum) {
        CsreplVO 			csrepl	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select csnum, conum, cusid, cnten, crerf, crelv, cresq, trmid, cdate ");
            query.append(" from Csrepl  ");
            query.append(" where csnum = ? and conum = ?  ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            pstmt.setLong(2, conum);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                csrepl = new CsreplVO();
                csrepl.setCsnum(rs.getInt("csnum"));
                csrepl.setConum(rs.getInt("conum"));
                csrepl.setCusid(rs.getString("cusid"));
                csrepl.setCnten(rs.getString("cnten"));
                csrepl.setCrerf(rs.getInt("crerf"));
                csrepl.setCrelv(rs.getInt("crelv"));
                csrepl.setCresq(rs.getInt("cresq"));
                csrepl.setTrmid(rs.getString("trmid"));
                csrepl.setCdate(rs.getTimestamp("cdate"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return csrepl;
    } // end of select

    public Vector selectAll() {
        Vector 				csreplV = new Vector();
        CsreplVO			csrepl	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select csnum, conum, cusid, cnten, crerf, crelv, cresq, trmid, cdate ");
            query.append(" from Csrepl ");
            pstmt = con.prepareStatement(query.toString());
            rs = pstmt.executeQuery();
            while(rs.next()) {
                csrepl = new CsreplVO();
                csrepl.setCsnum(rs.getInt("csnum"));
                csrepl.setConum(rs.getInt("conum"));
                csrepl.setCusid(rs.getString("cusid"));
                csrepl.setCnten(rs.getString("cnten"));
                csrepl.setCrerf(rs.getInt("crerf"));
                csrepl.setCrelv(rs.getInt("crelv"));
                csrepl.setCresq(rs.getInt("cresq"));
                csrepl.setTrmid(rs.getString("trmid"));
                csrepl.setCdate(rs.getTimestamp("cdate"));
                csreplV.addElement(csrepl);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return csreplV;
    } // end of selectAll

    public Vector selectAll(long csnum) {
    	Vector 				csreplV = new Vector();
        CsreplVO			csrepl	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append("Select csnum, conum, cusid, cnten, crerf, crelv, cresq, trmid, cdate ");
            query.append("  from Csrepl  ");
            query.append("  where csnum = ?  ");
            query.append("  order by crerf desc, cresq");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                csrepl = new CsreplVO();
                csrepl.setCsnum(rs.getInt("csnum"));
                csrepl.setConum(rs.getInt("conum"));
                csrepl.setCusid(rs.getString("cusid"));
                csrepl.setCnten(rs.getString("cnten"));
                csrepl.setCrerf(rs.getInt("crerf"));
                csrepl.setCrelv(rs.getInt("crelv"));
                csrepl.setCresq(rs.getInt("cresq"));
                csrepl.setTrmid(rs.getString("trmid"));
                csrepl.setCdate(rs.getTimestamp("cdate"));
                csreplV.addElement(csrepl);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return csreplV;
    } // end of selectAll

    public Vector selectBetween(long csnum, long f_conum, long t_conum) {
        return selectBetween(csnum, f_conum, t_conum, 0);
    } // end of selectBetween

    public Vector selectBetween(long csnum, long f_conum, long t_conum, int lastKeyOrder) {
    	Vector 				csreplV = new Vector();
        CsreplVO			csrepl	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append("Select csnum, conum, cusid, cnten, crerf, crelv, cresq, trmid, cdate ");
            query.append("  from Csrepl  ");
            query.append("  where csnum = ?  ");
            query.append("  and conum between ? and ?  ");
            if(lastKeyOrder == 1) {
                query.append(" order by DESC conum");
            } else {
                query.append(" order by conum");
            }
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            pstmt.setLong(2, f_conum);
            pstmt.setLong(3, t_conum);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                csrepl = new CsreplVO();
                csrepl.setCsnum(rs.getInt("csnum"));
                csrepl.setConum(rs.getInt("conum"));
                csrepl.setCusid(rs.getString("cusid"));
                csrepl.setCnten(rs.getString("cnten"));
                csrepl.setCrerf(rs.getInt("crerf"));
                csrepl.setCrelv(rs.getInt("crelv"));
                csrepl.setCresq(rs.getInt("cresq"));
                csrepl.setTrmid(rs.getString("trmid"));
                csrepl.setCdate(rs.getTimestamp("cdate"));
                csreplV.addElement(csrepl);
            }

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return csreplV;
    } // end of selectBetween

    public void insert(CsreplVO csrepl) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append(" Insert into Csrepl(");
            query.append("csnum, ctype, conum, cusid, cnten, crerf, crelv, cresq, trmid, cdate");
            query.append(") values (");
            query.append("?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, csrepl.getCsnum());
            pstmt.setString(2, csrepl.getCtype());
            pstmt.setInt(3, csrepl.getConum());
            pstmt.setString(4, csrepl.getCusid());
            pstmt.setString(5, csrepl.getCnten());
            pstmt.setInt(6, csrepl.getCrerf());
            pstmt.setInt(7, csrepl.getCrelv());
            pstmt.setInt(8, csrepl.getCresq());
            pstmt.setString(9, csrepl.getTrmid());
            pstmt.setTimestamp(10, csrepl.getCdate());
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of insert

    public void update(CsreplVO csrepl) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Update Csrepl SET ");
            query.append("csnum = ?, conum = ?, cusid = ?, cnten = ?, crerf = ?, crelv = ?, cresq = ?, trmid = ?, cdate = ?");
            query.append(" where csnum = ? and conum = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, csrepl.getCsnum());
            pstmt.setInt(2, csrepl.getConum());
            pstmt.setString(3, csrepl.getCusid());
            pstmt.setString(4, csrepl.getCnten());
            pstmt.setInt(5, csrepl.getCrerf());
            pstmt.setInt(6, csrepl.getCrelv());
            pstmt.setInt(7, csrepl.getCresq());
            pstmt.setString(8, csrepl.getTrmid());
            pstmt.setTimestamp(9, csrepl.getCdate());
            pstmt.setLong(10, csrepl.getCsnum());
            pstmt.setLong(11, csrepl.getConum());
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of update

    public void updateBoardReseqAndAddReply(CsreplVO csrepl) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append(" Update csrepl SET ");
            query.append(" cresq = cresq + 1");
            query.append(" where crerf = ? ");
            query.append(" and cresq > ? ");
            
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, csrepl.getCrerf());
            pstmt.setInt(2, csrepl.getCresq());
            pstmt.executeUpdate();
            pstmt.close();
            query.setLength(0);
            
            query.append(" Insert into Csrepl(");
            query.append("csnum, ctype, conum, cusid, cnten, crerf, crelv, cresq, trmid, cdate");
            query.append(") values (");
            query.append("?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, csrepl.getCsnum());
            pstmt.setString(2, csrepl.getCtype());
            pstmt.setInt(3, csrepl.getConum());
            pstmt.setString(4, csrepl.getCusid());
            pstmt.setString(5, csrepl.getCnten());
            pstmt.setInt(6, csrepl.getCrerf());
            pstmt.setInt(7, csrepl.getCrelv() + 1);
            pstmt.setInt(8, csrepl.getCresq() + 1);
            pstmt.setString(9, csrepl.getTrmid());
            pstmt.setTimestamp(10, csrepl.getCdate());
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of updateBoardReseqAndAddReply

    public void delete(long csnum, long conum) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Delete From Csrepl ");
            query.append("where csnum = ? and conum = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            pstmt.setLong(2, conum);
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
            query.append("Delete From Csrepl ");
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

    public void delete(String cusid) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Delete From Csrepl ");
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

    public void delete(CsreplVO csrepl) throws Exception {
        delete(csrepl.getCsnum(), csrepl.getConum());
    } // end of delete

    public int count(long csnum, long conum) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Csrepl ");
            query.append(" where csnum = ? and conum = ?   ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            pstmt.setLong(2, conum);
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
            query.append(" SELECT COUNT(*) from Csrepl ");
            query.append(" where cusid = ? ");
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

    public int count(long csnum) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Csrepl ");
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
    } // end of count

    public int getMaxConum(long csnum) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT IFNULL(MAX(conum), 0) + 1 as nextnum from Csrepl ");
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

    public int count() {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Csrepl  ");
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
} // end of CsreplDAO