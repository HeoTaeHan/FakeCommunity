// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CusbodVO.java

package com.example.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class CusbodVO {
    private int			csnum;
    private String 		cusid;
    private String 		csbjt;
    private String 		ccont;
    private int 		crdcn;
    private Timestamp 	cdate;
    private String 		ctmid;
    private int 		crerf;
    private int 		crelv;
    private int 		cresq;
    private String 		ctype;
    private String 		cname;
    private int 		recom;
} // end of CusbodVO