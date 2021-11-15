// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ChartRestServlet.java

package com.example.restapi;

import com.example.repository.CusbodDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(urlPatterns = "/api/chart/*")
public class ChartRestServlet extends HttpServlet {
	private static final String BASE_URI			= "/api/chart";
    private static final long	serialVersionUID 	= 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI 	= request.getRequestURI();
        String str 			= requestURI.substring("/api/chart".length());
        str = str.substring(1);
        
        if(str.equals("gender-per-count")) {
            printGenderPerCount(request, response);
        }
    } // end of printGenderPerCount

    private void printGenderPerCount(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
        CusbodDAO						cusbodDAO 	= CusbodDAO.getInstance();
        List<Map<String, Object>> 		list		= cusbodDAO.getCount();
        List 							labelList 	= new ArrayList();
        List 							dataList 	= new ArrayList();
        for(Map<String, Object> map : list){
            labelList.add((String)map.get("cusid"));
            dataList.add(list.size());
        }

        Gson gson = new Gson();
        Map map = new HashMap();
        map.put("labelList", labelList);
        map.put("dataList", dataList);
        String strJson = gson.toJson(map);
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(strJson);
        out.flush();
        out.close();
    } // end of printGenderPerCount
} // end of ChartRestServlet