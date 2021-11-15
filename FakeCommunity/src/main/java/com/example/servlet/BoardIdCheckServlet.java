// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   BoardIdCheckServlet.java

package com.example.servlet;

import com.example.repository.CususrDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BoardIdCheckServlet")
public class BoardIdCheckServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String cusid = req.getParameter("cusid");
        
        res.getWriter().write((new StringBuilder(String.valueOf(userIdCheck(cusid)))).toString());
    } // end of doPost

    public int userIdCheck(String cusid) {
        CususrDAO cususrDAO = CususrDAO.getInstance();
        return cususrDAO.count(cusid);
    } // end of userIdCheck
} // end of BoardIdCheckServlet