// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CususrDAO.java

package com.example.repository;

import com.example.domain.Criteria;
import com.example.domain.CususrVO;
import java.sql.*;
import java.util.Vector;

// Referenced classes of package com.example.repository:
//            JdbcUtils

public class CususrDAO {
	private static CususrDAO instance;

    public static CususrDAO getInstance() {
        if(instance == null) {
            instance = new CususrDAO();
        }
        return instance;
    } // end of getInstance

    private CususrDAO() {} // end of CususrDAO

    public CususrVO select(String cusid) {
        CususrVO 			cususr	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select cusid, paswd, cname, phone, birth, email, zcode, adres, adr02, ");
            query.append(" chint, reslt, cdate, adate, fdate ");
            query.append(" from Cususr  ");
            query.append(" where cusid = ?  ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, cusid);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                cususr = new CususrVO();
                cususr.setCusid(rs.getString("cusid"));
                cususr.setPaswd(rs.getString("paswd"));
                cususr.setCname(rs.getString("cname"));
                cususr.setPhone(rs.getString("phone"));
                cususr.setBirth(rs.getString("birth"));
                cususr.setEmail(rs.getString("email"));
                cususr.setZcode(rs.getString("zcode"));
                cususr.setAdres(rs.getString("adres"));
                cususr.setAdr02(rs.getString("adr02"));
                cususr.setChint(rs.getString("chint"));
                cususr.setReslt(rs.getString("reslt"));
                cususr.setCdate(rs.getTimestamp("cdate"));
                cususr.setAdate(rs.getTimestamp("adate"));
                cususr.setFdate(rs.getTimestamp("fdate"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cususr;
    } // end of select

    public CususrVO selectAdmin(String cusid) {
    	CususrVO 			cususr	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select cusid, paswd, cname, phone, birth, email, zcode, adres, adr02, ");
            query.append(" chint, reslt, cdate, adate, fdate ");
            query.append(" from Cususr  ");
            query.append(" where cusid = ? and cusid != 'admin'  ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, cusid);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                cususr = new CususrVO();
                cususr.setCusid(rs.getString("cusid"));
                cususr.setPaswd(rs.getString("paswd"));
                cususr.setCname(rs.getString("cname"));
                cususr.setPhone(rs.getString("phone"));
                cususr.setBirth(rs.getString("birth"));
                cususr.setEmail(rs.getString("email"));
                cususr.setZcode(rs.getString("zcode"));
                cususr.setAdres(rs.getString("adres"));
                cususr.setAdr02(rs.getString("adr02"));
                cususr.setChint(rs.getString("chint"));
                cususr.setReslt(rs.getString("reslt"));
                cususr.setCdate(rs.getTimestamp("cdate"));
                cususr.setAdate(rs.getTimestamp("adate"));
                cususr.setFdate(rs.getTimestamp("fdate"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cususr;
    } // end of selectAdmin

    public CususrVO selectEmail(String email) {
    	CususrVO 			cususr	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select cusid, paswd, cname, phone, birth, email, zcode, adres, adr02, ");
            query.append(" chint, reslt, cdate, adate, fdate ");
            query.append(" from Cususr  ");
            query.append(" where email = ?  ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                cususr = new CususrVO();
                cususr.setCusid(rs.getString("cusid"));
                cususr.setPaswd(rs.getString("paswd"));
                cususr.setCname(rs.getString("cname"));
                cususr.setPhone(rs.getString("phone"));
                cususr.setBirth(rs.getString("birth"));
                cususr.setEmail(rs.getString("email"));
                cususr.setZcode(rs.getString("zcode"));
                cususr.setAdres(rs.getString("adres"));
                cususr.setAdr02(rs.getString("adr02"));
                cususr.setChint(rs.getString("chint"));
                cususr.setReslt(rs.getString("reslt"));
                cususr.setCdate(rs.getTimestamp("cdate"));
                cususr.setAdate(rs.getTimestamp("adate"));
                cususr.setFdate(rs.getTimestamp("fdate"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cususr;
    } // end of selectEmail

    public Vector selectAll() {
        Vector 				cususrV = new Vector();
        CususrVO 			cususr	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select cusid, paswd, cname, phone, birth, email, zcode, adres, adr02, ");
            query.append(" chint, reslt, cdate, adate, fdate ");
            query.append(" from Cususr ");
            pstmt = con.prepareStatement(query.toString());
            rs = pstmt.executeQuery();
            while(rs.next()) {
                cususr = new CususrVO();
                cususr.setCusid(rs.getString("cusid"));
                cususr.setPaswd(rs.getString("paswd"));
                cususr.setCname(rs.getString("cname"));
                cususr.setPhone(rs.getString("phone"));
                cususr.setBirth(rs.getString("birth"));
                cususr.setEmail(rs.getString("email"));
                cususr.setZcode(rs.getString("zcode"));
                cususr.setAdres(rs.getString("adres"));
                cususr.setAdr02(rs.getString("adr02"));
                cususr.setChint(rs.getString("chint"));
                cususr.setReslt(rs.getString("reslt"));
                cususr.setCdate(rs.getTimestamp("cdate"));
                cususr.setAdate(rs.getTimestamp("adate"));
                cususr.setFdate(rs.getTimestamp("fdate"));
                
                cususrV.addElement(cususr);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cususrV;
    } // end of selectAll

    public void insert(CususrVO cususr) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append(" Insert into Cususr(");
            query.append("cusid, paswd, cname, phone, birth, email, zcode, adres, adr02, ");
            query.append("chint, reslt, cdate, adate, fdate");
            query.append(") values (");
            query.append("?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ");
            query.append(" ?, ?, ?, ?)");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, cususr.getCusid());
            pstmt.setString(2, cususr.getPaswd());
            pstmt.setString(3, cususr.getCname());
            pstmt.setString(4, cususr.getPhone());
            pstmt.setString(5, cususr.getBirth());
            pstmt.setString(6, cususr.getEmail());
            pstmt.setString(7, cususr.getZcode());
            pstmt.setString(8, cususr.getAdres());
            pstmt.setString(9, cususr.getAdr02());
            pstmt.setString(10, cususr.getChint());
            pstmt.setString(11, cususr.getReslt());
            pstmt.setTimestamp(12, cususr.getCdate());
            pstmt.setTimestamp(13, cususr.getAdate());
            pstmt.setTimestamp(14, cususr.getFdate());
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of insert

    public void update(CususrVO cususr) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Update Cususr SET ");
            query.append("cusid = ?, paswd = ?, cname = ?, phone = ?, birth = ?, email = ?, zcode = ?, adres = ?, adr02 = ?, chint = ?, ");
            query.append(" reslt = ?, cdate = ?, adate = ?, fdate = ?");
            query.append(" where cusid = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, cususr.getCusid());
            pstmt.setString(2, cususr.getPaswd());
            pstmt.setString(3, cususr.getCname());
            pstmt.setString(4, cususr.getPhone());
            pstmt.setString(5, cususr.getBirth());
            pstmt.setString(6, cususr.getEmail());
            pstmt.setString(7, cususr.getZcode());
            pstmt.setString(8, cususr.getAdres());
            pstmt.setString(9, cususr.getAdr02());
            pstmt.setString(10, cususr.getChint());
            pstmt.setString(11, cususr.getReslt());
            pstmt.setTimestamp(12, cususr.getCdate());
            pstmt.setTimestamp(13, cususr.getAdate());
            pstmt.setTimestamp(14, cususr.getFdate());
            pstmt.setString(15, cususr.getCusid());
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of update

    public void delete(String cusid) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Delete From Cususr ");
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

    public void delete(CususrVO cususr) throws Exception {
        delete(cususr.getCusid());
    } // end of delete

    public int count(String cusid) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Cususr ");
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

    public int countByEmail(String email) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Cususr ");
            query.append(" where email = ?  ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, email);
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
    } // end of countByEmail

    public int count() {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Cususr  ");
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

    public int count(Criteria cri) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Cususr ");
            if(!cri.getType().equals("")) {
                query.append((new StringBuilder(" where ")).append(cri.getType()).append(" like '%").append(cri.getKeyword()).append("%' ").toString());
            }
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

    public int countAdmin(Criteria cri) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Cususr ");
            query.append(" where cusid != 'admin' ");
            if(!cri.getType().equals("")) {
                query.append((new StringBuilder(" and ")).append(cri.getType()).append(" like '%").append(cri.getKeyword()).append("%' ").toString());
            }
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
    } // end of countAdmin

    public Vector selectPageOption(Criteria cri) {
        int 				startRow	= (cri.getPageNum() - 1) * cri.getAmount();
        Vector 				cususrV 	= new Vector();
        CususrVO 			cususr		= null;
        Connection 			con			= null;
	    PreparedStatement 	pstmt		= null;
	    ResultSet			rs			= null;
	    StringBuffer		query		= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select cusid, paswd, cname, phone, birth, email, zcode, adres, adr02, ");
            query.append(" chint, reslt, cdate, adate, fdate ");
            query.append(" from Cususr ");
            if(!cri.getType().equals("")) {
                query.append((new StringBuilder(" where ")).append(cri.getType()).append(" like '%").append(cri.getKeyword()).append("%' ").toString());
            }
            query.append(" order by cusid desc, cname ");
            query.append(" limit ?, ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, cri.getAmount());
            rs = pstmt.executeQuery();
            while(rs.next()) {
                cususr = new CususrVO();
                cususr.setCusid(rs.getString("cusid"));
                cususr.setPaswd(rs.getString("paswd"));
                cususr.setCname(rs.getString("cname"));
                cususr.setPhone(rs.getString("phone"));
                cususr.setBirth(rs.getString("birth"));
                cususr.setEmail(rs.getString("email"));
                cususr.setZcode(rs.getString("zcode"));
                cususr.setAdres(rs.getString("adres"));
                cususr.setAdr02(rs.getString("adr02"));
                cususr.setChint(rs.getString("chint"));
                cususr.setReslt(rs.getString("reslt"));
                cususr.setCdate(rs.getTimestamp("cdate"));
                cususr.setAdate(rs.getTimestamp("adate"));
                cususr.setFdate(rs.getTimestamp("fdate"));
                cususrV.addElement(cususr);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cususrV;
    } // end of selectPageOption

    public Vector selectPageOptionAdmin(Criteria cri) {
    	int 				startRow	= (cri.getPageNum() - 1) * cri.getAmount();
        Vector 				cususrV 	= new Vector();
        CususrVO 			cususr		= null;
        Connection 			con			= null;
	    PreparedStatement 	pstmt		= null;
	    ResultSet			rs			= null;
	    StringBuffer		query		= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select cusid, paswd, cname, phone, birth, email, zcode, adres, adr02, ");
            query.append(" chint, reslt, cdate, adate, fdate ");
            query.append(" from Cususr ");
            query.append(" where cusid != 'admin' ");
            if(!cri.getType().equals("")) {
                query.append((new StringBuilder(" and ")).append(cri.getType()).append(" like '%").append(cri.getKeyword()).append("%' ").toString());
            }
            query.append(" order by cusid desc, cname ");
            query.append(" limit ?, ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, cri.getAmount());
            rs = pstmt.executeQuery();
            while(rs.next()) {
                cususr = new CususrVO();
                cususr.setCusid(rs.getString("cusid"));
                cususr.setPaswd(rs.getString("paswd"));
                cususr.setCname(rs.getString("cname"));
                cususr.setPhone(rs.getString("phone"));
                cususr.setBirth(rs.getString("birth"));
                cususr.setEmail(rs.getString("email"));
                cususr.setZcode(rs.getString("zcode"));
                cususr.setAdres(rs.getString("adres"));
                cususr.setAdr02(rs.getString("adr02"));
                cususr.setChint(rs.getString("chint"));
                cususr.setReslt(rs.getString("reslt"));
                cususr.setCdate(rs.getTimestamp("cdate"));
                cususr.setAdate(rs.getTimestamp("adate"));
                cususr.setFdate(rs.getTimestamp("fdate"));
                cususrV.addElement(cususr);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cususrV;
    } // end of selectPageOptionAdmin
} // end of CususrDAO