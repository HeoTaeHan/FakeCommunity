// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   JdbcUtils.java

package com.example.repository;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcUtils
{

    public JdbcUtils()
    {
    }

    public static Connection getConnection()
        throws Exception
    {
        Connection con = null;
        Context context = new InitialContext();
        DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/jspdb");
        con = ds.getConnection();
        return con;
    }

    public Connection getConnectionJunit()
        throws Exception
    {
        String url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&characterEncoding=utf8&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Seoul";
        String user = "jspid";
        String passwd = "jsppass";
        Connection con = null;
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, passwd);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }

    public static void close(Connection con, PreparedStatement pstmt)
    {
        close(con, pstmt, null);
    }

    public static void close(Connection con, PreparedStatement pstmt, ResultSet rs)
    {
        try
        {
            if(rs != null)
                rs.close();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            if(pstmt != null)
                pstmt.close();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            if(con != null)
                con.close();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
    }
}
