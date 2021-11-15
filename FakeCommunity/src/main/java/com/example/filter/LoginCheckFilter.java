// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   LoginCheckFilter.java

package com.example.filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

@WebFilter(urlPatterns = {"/member/logout.jsp", 
		"/member/changePasswd.jsp", 
		"/member/memberModify.jsp",
		"/member/memberModifyPro.jsp",
		"/member/memberModifyAdmin.jsp",
		"/member/memberModifyAdminPro.jsp",
		"/member/memberModifyRemovePro.jsp",
		"/member/memberModifyRemoveAdminPro.jsp"})
public class LoginCheckFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest	req = (HttpServletRequest)request;
        HttpServletResponse res = (HttpServletResponse)response;
        HttpSession session = req.getSession();
        String id = (String)session.getAttribute("sessionid");
        if(id == null) {
            res.sendRedirect("/member/login.jsp");
            return;
        } else {
            chain.doFilter(request, response);
            return;
        }
    } // end of doFilter
} // end of LoginCheckFilter