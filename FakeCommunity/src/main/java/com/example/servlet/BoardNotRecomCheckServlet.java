// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   BoardNotRecomCheckServlet.java

package com.example.servlet;

import com.example.domain.CntcomVO;
import com.example.repository.CntcomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BoardNotRecomCheckServlet")
public class BoardNotRecomCheckServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String 	recom = req.getParameter("cusid");
        String 	cusid = recom.substring(0, recom.lastIndexOf("*"));
        int 	csnum = Integer.parseInt(recom.substring(recom.lastIndexOf("*") + 1));
        res.getWriter().write((new StringBuilder(String.valueOf(userNotRecomCheck(cusid, csnum)))).toString());
    } // end of doPost

    public int userNotRecomCheck(String cusid, int csnum) {
        CntcomDAO cntcomDAO = CntcomDAO.getInstance();
        CntcomVO cntcomVO = new CntcomVO();
        if(cntcomDAO.count(csnum, cusid) == 0) {
            cntcomVO.setCsnum(csnum);
            cntcomVO.setCusid(cusid);
            cntcomDAO.insert(cntcomVO);
        } else {
            cntcomVO = cntcomDAO.select(csnum, cusid);
            cntcomDAO.update(cntcomVO);
        }
        return cntcomDAO.count(csnum);
    } // end of userNotRecomCheck
} // end of BoardNotRecomCheckServlet