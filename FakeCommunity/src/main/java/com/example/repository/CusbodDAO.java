// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CusbodDAO.java

package com.example.repository;

import com.example.domain.Criteria;
import com.example.domain.CusbodVO;

import oracle.net.aso.e;

import java.sql.*;
import java.util.*;

// Referenced classes of package com.example.repository:
//            JdbcUtils

public class CusbodDAO {
	
	private static CusbodDAO instance;

    public static CusbodDAO getInstance() {
        if(instance == null) {
            instance = new CusbodDAO();
        }
        return instance;
    } // end of getInstance

    private CusbodDAO() {} // end of CusbodDAO

    public CusbodVO select(long csnum, String ctype) {
        CusbodVO 			cusbod	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select csnum, ctype, cusid, csbjt, ccont, crdcn, cdate, ctmid, crerf, ");
            query.append(" crelv, cresq ");
            query.append(" from Cusbod  ");
            query.append(" where csnum = ? and ctype = ?  ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            pstmt.setString(2, ctype);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                cusbod = new CusbodVO();
                cusbod.setCsnum(rs.getInt("csnum"));
                cusbod.setCtype(rs.getString("ctype"));
                cusbod.setCusid(rs.getString("cusid"));
                cusbod.setCsbjt(rs.getString("csbjt"));
                cusbod.setCcont(rs.getString("ccont"));
                cusbod.setCrdcn(rs.getInt("crdcn"));
                cusbod.setCdate(rs.getTimestamp("cdate"));
                cusbod.setCtmid(rs.getString("ctmid"));
                cusbod.setCrerf(rs.getInt("crerf"));
                cusbod.setCrelv(rs.getInt("crelv"));
                cusbod.setCresq(rs.getInt("cresq"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cusbod;
    } // end of select

    public Vector selectAll() {
        Vector 				cusbodV = new Vector();
        CusbodVO 			cusbod	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select csnum, ctype, cusid, csbjt, ccont, crdcn, cdate, ctmid, crerf, ");
            query.append(" crelv, cresq ");
            query.append(" from Cusbod ");
            pstmt = con.prepareStatement(query.toString());
            rs = pstmt.executeQuery();
            while(rs.next()) {
                cusbod = new CusbodVO();
                cusbod.setCsnum(rs.getInt("csnum"));
                cusbod.setCtype(rs.getString("ctype"));
                cusbod.setCusid(rs.getString("cusid"));
                cusbod.setCsbjt(rs.getString("csbjt"));
                cusbod.setCcont(rs.getString("ccont"));
                cusbod.setCrdcn(rs.getInt("crdcn"));
                cusbod.setCdate(rs.getTimestamp("cdate"));
                cusbod.setCtmid(rs.getString("ctmid"));
                cusbod.setCrerf(rs.getInt("crerf"));
                cusbod.setCrelv(rs.getInt("crelv"));
                cusbod.setCresq(rs.getInt("cresq"));
                cusbodV.addElement(cusbod);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cusbodV;
    } // end of selectAll

    public Vector selectAll(long csnum) {
    	Vector 				cusbodV = new Vector();
        CusbodVO 			cusbod	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append("Select csnum, ctype, cusid, csbjt, ccont, crdcn, cdate, ctmid, crerf, ");
            query.append(" crelv, cresq ");
            query.append("  from Cusbod  ");
            query.append("  where csnum = ?  ");
            query.append("  order by ctype");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                cusbod = new CusbodVO();
                cusbod.setCsnum(rs.getInt("csnum"));
                cusbod.setCtype(rs.getString("ctype"));
                cusbod.setCusid(rs.getString("cusid"));
                cusbod.setCsbjt(rs.getString("csbjt"));
                cusbod.setCcont(rs.getString("ccont"));
                cusbod.setCrdcn(rs.getInt("crdcn"));
                cusbod.setCdate(rs.getTimestamp("cdate"));
                cusbod.setCtmid(rs.getString("ctmid"));
                cusbod.setCrerf(rs.getInt("crerf"));
                cusbod.setCrelv(rs.getInt("crelv"));
                cusbod.setCresq(rs.getInt("cresq"));
                cusbodV.addElement(cusbod);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cusbodV;
    } // end of selectAll

    public Vector selectBetween(long csnum, String f_ctype, String t_ctype) {
        return selectBetween(csnum, f_ctype, t_ctype, 0);
    } // end of selectBetween

    public Vector selectBetween(long csnum, String f_ctype, String t_ctype, int lastKeyOrder) {
    	Vector 				cusbodV = new Vector();
        CusbodVO 			cusbod	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append("Select csnum, ctype, cusid, csbjt, ccont, crdcn, cdate, ctmid, crerf, ");
            query.append(" crelv, cresq ");
            query.append("  from Cusbod  ");
            query.append("  where csnum = ?  ");
            query.append("  and ctype between ? and ?  ");
            if(lastKeyOrder == 1) {
                query.append(" order by DESC ctype");
            } else {
                query.append(" order by ctype");
            }
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            pstmt.setString(2, f_ctype);
            pstmt.setString(3, t_ctype);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                cusbod = new CusbodVO();
                cusbod.setCsnum(rs.getInt("csnum"));
                cusbod.setCtype(rs.getString("ctype"));
                cusbod.setCusid(rs.getString("cusid"));
                cusbod.setCsbjt(rs.getString("csbjt"));
                cusbod.setCcont(rs.getString("ccont"));
                cusbod.setCrdcn(rs.getInt("crdcn"));
                cusbod.setCdate(rs.getTimestamp("cdate"));
                cusbod.setCtmid(rs.getString("ctmid"));
                cusbod.setCrerf(rs.getInt("crerf"));
                cusbod.setCrelv(rs.getInt("crelv"));
                cusbod.setCresq(rs.getInt("cresq"));
                cusbodV.addElement(cusbod);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cusbodV;
    } // end of selectBetween

    public void insert(CusbodVO cusbod) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append(" Insert into Cusbod(");
            query.append("csnum, ctype, cusid, csbjt, ccont, crdcn, cdate, ctmid, crerf, ");
            query.append("crelv, cresq");
            query.append(") values (");
            query.append("?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ");
            query.append(" ?)");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, cusbod.getCsnum());
            pstmt.setString(2, cusbod.getCtype());
            pstmt.setString(3, cusbod.getCusid());
            pstmt.setString(4, cusbod.getCsbjt());
            pstmt.setString(5, cusbod.getCcont());
            pstmt.setInt(6, cusbod.getCrdcn());
            pstmt.setTimestamp(7, cusbod.getCdate());
            pstmt.setString(8, cusbod.getCtmid());
            pstmt.setInt(9, cusbod.getCrerf());
            pstmt.setInt(10, cusbod.getCrelv());
            pstmt.setInt(11, cusbod.getCresq());
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of insert

    public void update(CusbodVO cusbod) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Update Cusbod SET ");
            query.append("csnum = ?, ctype = ?, cusid = ?, csbjt = ?, ccont = ?, crdcn = ?, cdate = ?, ctmid = ?, crerf = ?, crelv = ?, ");
            query.append(" cresq = ?");
            query.append(" where csnum = ? and ctype = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, cusbod.getCsnum());
            pstmt.setString(2, cusbod.getCtype());
            pstmt.setString(3, cusbod.getCusid());
            pstmt.setString(4, cusbod.getCsbjt());
            pstmt.setString(5, cusbod.getCcont());
            pstmt.setInt(6, cusbod.getCrdcn());
            pstmt.setTimestamp(7, cusbod.getCdate());
            pstmt.setString(8, cusbod.getCtmid());
            pstmt.setInt(9, cusbod.getCrerf());
            pstmt.setInt(10, cusbod.getCrelv());
            pstmt.setInt(11, cusbod.getCresq());
            pstmt.setLong(12, cusbod.getCsnum());
            pstmt.setString(13, cusbod.getCtype());
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of update

    public void delete(long csnum, String ctype) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Delete From Cusbod ");
            query.append("where csnum = ? and ctype = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            pstmt.setString(2, ctype);
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
            query.append("Delete From Cusbod ");
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

    public void delete(CusbodVO cusbod) throws Exception {
        delete(cusbod.getCsnum(), cusbod.getCtype());
    } // end of delete

    public int count(long csnum, String ctype) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Cusbod ");
            query.append(" where csnum = ? and ctype = ?   ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setLong(1, csnum);
            pstmt.setString(2, ctype);
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
            query.append(" SELECT COUNT(*) from Cusbod ");
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

    public int count() {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Cusbod  ");
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

    public void updateBoardCount(int num, String ctype) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Update Cusbod SET ");
            query.append(" crdcn = crdcn + 1");
            query.append(" where csnum = ? and ctype = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, num);
            pstmt.setString(2, ctype);
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of updateBoardCount

    public int count(Criteria cri, String ctype) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append("	SELECT COUNT(*) from (  ");
            query.append("		Select a.csnum, a.cusid, a.csbjt, a.ccont, a.crdcn, a.cdate, a.ctmid, a.crerf, a.crelv, ");
            query.append("		a.cresq, a.ctype, b.cname, c.recom ");
            query.append("		from Cusbod a ");
            query.append("		left outer join cususr b on (a.cusid = b.cusid) ");
            query.append("     	left outer join (");
            query.append("			select csnum, sum(recom) as recom ");
            query.append("			from crecom ");
            query.append("			group by csnum ");
            query.append("		) c on (a.csnum = c.csnum)");
            query.append("	) x ");
            query.append(" 	where ctype = ? ");
            if(!cri.getType().equals("")) {
                query.append((new StringBuilder(" and ")).append(cri.getType()).append(" like '%").append(cri.getKeyword()).append("%' ").toString());
            }
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, ctype);
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

    public Vector selectPageOption(Criteria cri, String ctype) {
    	int 				startRow 	= (cri.getPageNum() - 1) * cri.getAmount();
    	Vector 				cusbodV 	= new Vector();
        CusbodVO 			cusbod		= null;
        Connection 			con			= null;
	    PreparedStatement 	pstmt		= null;
	    ResultSet			rs			= null;
	    StringBuffer		query		= new StringBuffer();
        
        try
        {
            con = JdbcUtils.getConnection();
            query.append("	select * from ( ");
            query.append("		Select a.csnum, a.cusid, a.csbjt, a.ccont, a.crdcn, a.cdate, a.ctmid, a.crerf, a.crelv, ");
            query.append("		a.cresq, a.ctype, b.cname, c.recom ");
            query.append("		from Cusbod a ");
            query.append("		left outer join cususr b on (a.cusid = b.cusid) ");
            query.append("     	left outer join (");
            query.append("			select csnum, sum(recom) as recom ");
            query.append("			from crecom ");
            query.append("			group by csnum ");
            query.append("		) c on (a.csnum = c.csnum)");
            query.append("	) x ");
            query.append(" 	where ctype = ? ");
            if(!cri.getType().equals("")) {
                query.append((new StringBuilder(" and ")).append(cri.getType()).append(" like '%").append(cri.getKeyword()).append("%' ").toString());
            }
            query.append(" order by crerf desc, cresq ");
            query.append(" limit ?, ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, ctype);
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, cri.getAmount());
            rs = pstmt.executeQuery();
            while(rs.next()) {
                cusbod = new CusbodVO();
                cusbod.setCsnum(rs.getInt("csnum"));
                cusbod.setCusid(rs.getString("cusid"));
                cusbod.setCsbjt(rs.getString("csbjt"));
                cusbod.setCcont(rs.getString("ccont"));
                cusbod.setCrdcn(rs.getInt("crdcn"));
                cusbod.setCdate(rs.getTimestamp("cdate"));
                cusbod.setCtmid(rs.getString("ctmid"));
                cusbod.setCrerf(rs.getInt("crerf"));
                cusbod.setCrelv(rs.getInt("crelv"));
                cusbod.setCresq(rs.getInt("cresq"));
                cusbod.setCtype(rs.getString("ctype"));
                cusbod.setCname(rs.getString("cname"));
                cusbod.setRecom(rs.getInt("recom"));
                cusbodV.addElement(cusbod);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cusbodV;
    }// end of selectPageOption

    public void update2(CusbodVO cusbod) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            query.append("Update Cusbod SET ");
            query.append("csnum = ?, cusid = ?, csbjt = ?, ccont = ?, ctmid = ? ");
            query.append(" where csnum = ? and ctype = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, cusbod.getCsnum());
            pstmt.setString(2, cusbod.getCusid());
            pstmt.setString(3, cusbod.getCsbjt());
            pstmt.setString(4, cusbod.getCcont());
            pstmt.setString(5, cusbod.getCtmid());
            pstmt.setLong(6, cusbod.getCsnum());
            pstmt.setString(7, cusbod.getCtype());
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of update2

    public int getNextnum(String ctype) {
        int					num		= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append("	select IFNULL(MAX(csnum), 0) + 1 as nextnum ");
            query.append("	from cusbod ");
            query.append("	where ctype = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, ctype);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                num = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return num;
    } // end of getNextnum

    public void updateBoardReseqAndAddReply(CusbodVO cusbodVO) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
            con = JdbcUtils.getConnection();
            con.setAutoCommit(false);
            query.append(" Update cusbod SET ");
            query.append(" cresq = cresq + 1");
            query.append(" where crerf = ? ");
            query.append(" and cresq > ? and ctype = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, cusbodVO.getCrerf());
            pstmt.setInt(2, cusbodVO.getCresq());
            pstmt.setString(3, cusbodVO.getCtype());
            pstmt.executeUpdate();
            pstmt.close();
            query.setLength(0);
            query.append(" Insert into Cusbod(");
            query.append("csnum, cusid, csbjt, ccont, crdcn, cdate, ctmid, crerf, crelv, ");
            query.append("cresq, ctype");
            query.append(") values (");
            query.append("?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ");
            query.append(" ?)");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, cusbodVO.getCsnum());
            pstmt.setString(2, cusbodVO.getCusid());
            pstmt.setString(3, cusbodVO.getCsbjt());
            pstmt.setString(4, cusbodVO.getCcont());
            pstmt.setInt(5, cusbodVO.getCrdcn());
            pstmt.setTimestamp(6, cusbodVO.getCdate());
            pstmt.setString(7, cusbodVO.getCtmid());
            pstmt.setInt(8, cusbodVO.getCrerf());
            pstmt.setInt(9, cusbodVO.getCrelv() + 1);
            pstmt.setInt(10, cusbodVO.getCresq() + 1);
            pstmt.setString(11, cusbodVO.getCtype());
            pstmt.executeUpdate();
            con.commit();
            con.setAutoCommit(true);
        } catch(Exception e) {
            try {
                con.rollback();
            } catch(SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of updateBoardReseqAndAddReply

    public Vector selectPageOption(String ctype) {
    	Vector 				cusbodV 	= new Vector();
        CusbodVO 			cusbod		= null;
        Connection 			con			= null;
	    PreparedStatement 	pstmt		= null;
	    ResultSet			rs			= null;
	    StringBuffer		query		= new StringBuffer();
        
        try {
            con = JdbcUtils.getConnection();
            query.append("\tselect * from ( ");
            query.append(" \t\tSelect a.csnum, a.cusid, a.csbjt, a.ccont, a.crdcn, a.cdate, a.ctmid, a.crerf, a.crelv, ");
            query.append(" \t\ta.cresq, a.ctype, b.cname, c.recom ");
            query.append(" \t\tfrom Cusbod a ");
            query.append("\t\tleft outer join cususr b on (a.cusid = b.cusid) ");
            query.append("        left outer join (");
            query.append("\t\t\tselect csnum, sum(recom) as recom ");
            query.append("\t\t\tfrom crecom ");
            query.append("\t\t\tgroup by csnum ");
            query.append("        ) c on (a.csnum = c.csnum)");
            query.append("\t) x ");
            query.append(" where ctype = ? ");
            query.append(" order by crerf desc, cresq ");
            query.append(" limit 0, 10 ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, ctype);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                cusbod = new CusbodVO();
                cusbod.setCsnum(rs.getInt("csnum"));
                cusbod.setCusid(rs.getString("cusid"));
                cusbod.setCsbjt(rs.getString("csbjt"));
                cusbod.setCcont(rs.getString("ccont"));
                cusbod.setCrdcn(rs.getInt("crdcn"));
                cusbod.setCdate(rs.getTimestamp("cdate"));
                cusbod.setCtmid(rs.getString("ctmid"));
                cusbod.setCrerf(rs.getInt("crerf"));
                cusbod.setCrelv(rs.getInt("crelv"));
                cusbod.setCresq(rs.getInt("cresq"));
                cusbod.setCtype(rs.getString("ctype"));
                cusbod.setCname(rs.getString("cname"));
                cusbod.setRecom(rs.getInt("recom"));
                cusbodV.addElement(cusbod);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return cusbodV;
    } // end of selectPageOption

    public List getCount() {
        List 				list		= new ArrayList();
        Connection 			con			= null;
	    PreparedStatement 	pstmt		= null;
	    ResultSet			rs			= null;
	    StringBuffer		query		= new StringBuffer();
        
        try {
            con = JdbcUtils.getConnection();
            query.append("	select cusid, count(*) as cnt ");
            query.append("	from cusbod");
            query.append("	group by cusid	");
            query.append("	order by cusid	");
            pstmt = con.prepareStatement(query.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
 				Map<String, Object> map = new HashMap<String, Object>();
                map.put("cusid", rs.getString("cusid"));
                map.put("cnt", Integer.valueOf(rs.getInt("cnt")));
                
                list.add(map);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return list;
    } // end of getCount
} // end of CusbodDAO