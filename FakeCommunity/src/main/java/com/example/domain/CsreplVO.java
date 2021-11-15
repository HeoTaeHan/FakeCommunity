// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CsreplVO.java

package com.example.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class CsreplVO {
    private int			csnum;
    private String		ctype;
    private int 		conum;
    private String 		cusid;
    private String 		cnten;
    private int 		crerf;
    private int 		crelv;
    private int 		cresq;
    private String 		trmid;
    private Timestamp 	cdate;
} // end of CsreplVO