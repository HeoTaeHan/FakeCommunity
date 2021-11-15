// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   RemberMeFilter.java

package com.example.filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class RemberMeFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest 	req		= (HttpServletRequest)request;
        HttpSession 		session = req.getSession();
        String 				id 		= (String)session.getAttribute("sessionid");
        if(id == null) {
            Cookie cookies[] = req.getCookies();
            if(cookies != null) {
                Cookie acookie[];
                int j = (acookie = cookies).length;
                for(int i = 0; i < j; i++) {
                    Cookie cookie = acookie[i];
                    if(cookie.getName().equals("loginId")) {
                        id = cookie.getValue();
                        session.setAttribute("sessionid", id);
                    }
                }
            }
        }
        chain.doFilter(request, response);
    } // end of doFilter
} // end of RemberMeFilter