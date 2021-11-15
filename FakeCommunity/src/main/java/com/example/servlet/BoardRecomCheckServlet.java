// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   BoardRecomCheckServlet.java

package com.example.servlet;

import com.example.domain.CrecomVO;
import com.example.repository.CrecomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BoardRecomCheckServlet")
public class BoardRecomCheckServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String 	recom = req.getParameter("cusid");
        String 	cusid = recom.substring(0, recom.lastIndexOf("*"));
        int		csnum = Integer.parseInt(recom.substring(recom.lastIndexOf("*") + 1));
        res.getWriter().write((new StringBuilder(String.valueOf(userRecomCheck(cusid, csnum)))).toString());
    } // end of doPost

    public int userRecomCheck(String cusid, int csnum) {
        CrecomDAO crecomDAO = CrecomDAO.getInstance();
        CrecomVO crecomVO = new CrecomVO();
        if(crecomDAO.count(csnum, cusid) == 0) {
            crecomVO.setCsnum(csnum);
            crecomVO.setCtype("I");
            crecomVO.setCusid(cusid);
            crecomDAO.insert(crecomVO);
        } else {
            crecomVO = crecomDAO.select(csnum, cusid);
            crecomDAO.update(crecomVO);
        }
        return crecomDAO.count(csnum);
    } // end of userRecomCheck
} // end of BoardRecomCheckServlet