// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   BoardEmailCheckServlet.java

package com.example.servlet;

import com.example.repository.CususrDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BoardEmailCheckServlet")
public class BoardEmailCheckServlet extends HttpServlet {


    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        res.getWriter().write((new StringBuilder(String.valueOf(userEmailCheck(email)))).toString());
    } // end of doPost

    public int userEmailCheck(String email) {
        CususrDAO cususrDAO = CususrDAO.getInstance();
        return cususrDAO.countByEmail(email);
    } // end of userEmailCheck
} // end of BoardEmailCheckServlet