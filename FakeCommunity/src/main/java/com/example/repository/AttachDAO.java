// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   AttachDAO.java

package com.example.repository;

import com.example.domain.AttachVO;
import java.sql.*;
import java.util.Vector;

// Referenced classes of package com.example.repository:
//            JdbcUtils

public class AttachDAO {
	
	private static AttachDAO instance;

    public static AttachDAO getInstance() {
        if(instance == null) {
            instance = new AttachDAO();
        }
        return instance;
    } // end of getInstance

    private AttachDAO() { } // end of AttachDAO

    public AttachVO select(String uuid) {
        AttachVO			attach	= null;
        Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" Select uuid, uploadpath, filename, filetype, bno ");
            query.append(" from Attach  ");
            query.append(" where uuid = ?  ");
            
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, uuid);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                attach = new AttachVO();
                attach.setUuid(rs.getString("uuid"));
                attach.setUploadpath(rs.getString("uploadpath"));
                attach.setFilename(rs.getString("filename"));
                attach.setFiletype(rs.getString("filetype"));
                attach.setBno(rs.getInt("bno"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return attach;
    } // end of select

    public Vector selectAll() {
    	Vector<AttachVO>    attachV = new Vector<AttachVO>();
 	    AttachVO 			attach 	= null;
 	    Connection 			con		= null;
 	    PreparedStatement 	pstmt	= null;
 	    ResultSet			rs		= null;
 	    StringBuffer		query	= new StringBuffer();

 	    try{
            con = JdbcUtils.getConnection();
            query.append(" Select uuid, uploadpath, filename, filetype, bno ");
            query.append(" from Attach ");
            pstmt 	= con.prepareStatement(query.toString());
            rs 		= pstmt.executeQuery();
            while(rs.next()) {
                attach = new AttachVO();
                attach.setUuid(rs.getString("uuid"));
                attach.setUploadpath(rs.getString("uploadpath"));
                attach.setFilename(rs.getString("filename"));
                attach.setFiletype(rs.getString("filetype"));
                attach.setBno(rs.getInt("bno"));
                attachV.addElement(attach);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return attachV;
    } // end of selectAll

    public Vector getAttachesByBno(int num) {
    	Vector<AttachVO>    attachV = new Vector<AttachVO>();
 	    AttachVO 			attach 	= null;
 	    Connection 			con		= null;
 	    PreparedStatement 	pstmt	= null;
 	    ResultSet			rs		= null;
 	    StringBuffer		query	= new StringBuffer();

 	    try{
            con = JdbcUtils.getConnection();
            query.append(" Select uuid, uploadpath, filename, filetype, bno, cusid ");
            query.append(" from Attach ");
            query.append(" where bno = ? ");
            query.append(" order by filetype, filename ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                attach = new AttachVO();
                attach.setUuid(rs.getString("uuid"));
                attach.setUploadpath(rs.getString("uploadpath"));
                attach.setFilename(rs.getString("filename"));
                attach.setFiletype(rs.getString("filetype"));
                attach.setBno(rs.getInt("bno"));
                attach.setCusid(rs.getString("cusid"));
                attachV.addElement(attach);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return attachV;
    } // end of getAttachesByBno

    public Vector getAttachesByCusid(String cusid) {
    	Vector 				attachV = new Vector<AttachVO>();
 	    AttachVO 			attach 	= null;
 	    Connection 			con		= null;
 	    PreparedStatement 	pstmt	= null;
 	    ResultSet			rs		= null;
 	    StringBuffer		query	= new StringBuffer();

 	    try{
            con = JdbcUtils.getConnection();
            query.append(" Select uuid, uploadpath, filename, filetype, bno, cusid ");
            query.append(" from Attach ");
            query.append(" where cusid = ? ");
            query.append(" order by filetype, filename ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, cusid);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                attach = new AttachVO();
                attach.setUuid(rs.getString("uuid"));
                attach.setUploadpath(rs.getString("uploadpath"));
                attach.setFilename(rs.getString("filename"));
                attach.setFiletype(rs.getString("filetype"));
                attach.setBno(rs.getInt("bno"));
                attach.setCusid(rs.getString("cusid"));
                attachV.addElement(attach);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt, rs);
        }
        return attachV;
    } // end of getAttachesByCusid

    public void insert(AttachVO attach) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();

	    try{
	    	
            con = JdbcUtils.getConnection();
            
            query.append(" Insert into Attach(");
            query.append("uuid, uploadpath, filename, filetype, bno, cusid");
            query.append(") values (");
            query.append("?, ?, ?, ?, ?, ?)");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, attach.getUuid());
            pstmt.setString(2, attach.getUploadpath());
            pstmt.setString(3, attach.getFilename());
            pstmt.setString(4, attach.getFiletype());
            pstmt.setInt(5, attach.getBno());
            pstmt.setString(6, attach.getCusid());
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of insert

    public void update(AttachVO attach) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append("Update Attach SET ");
            query.append("uuid = ?, uploadpath = ?, filename = ?, filetype = ?, bno = ?");
            query.append(" where uuid = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, attach.getUuid());
            pstmt.setString(2, attach.getUploadpath());
            pstmt.setString(3, attach.getFilename());
            pstmt.setString(4, attach.getFiletype());
            pstmt.setInt(5, attach.getBno());
            pstmt.setString(6, attach.getUuid());
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of update

    public void delete(String uuid) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append("Delete From Attach ");
            query.append("where uuid = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, uuid);
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of delete

    public void deleteAttachsByBno(int num) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append("Delete From Attach ");
            query.append("where bno = ? ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
        	query.setLength(0);
        	JdbcUtils.close(con, pstmt);
        }
    } // end of deleteAttachsByBno

    public void deleteAttachsByCusid(String cusid) {
    	Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append("Delete From Attach ");
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
    } // end of deleteAttachsByCusid

    public void delete(AttachVO attach) throws Exception {
        delete(attach.getUuid());
    } // end of delete

    public int count(String uuid) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Attach ");
            query.append(" where uuid = ?   ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, uuid);
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

    public int countByBno(int num) {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Attach ");
            query.append(" where uuid = ?   ");
            pstmt = con.prepareStatement(query.toString());
            pstmt.setInt(1, num);
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
    } // end of countByBno

    public int count() {
    	int					count	= 0;
	    Connection 			con		= null;
	    PreparedStatement 	pstmt	= null;
	    ResultSet			rs		= null;
	    StringBuffer		query	= new StringBuffer();
	    
        try {
            con = JdbcUtils.getConnection();
            query.append(" SELECT COUNT(*) from Attach  ");
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
} // end of AttachDAO