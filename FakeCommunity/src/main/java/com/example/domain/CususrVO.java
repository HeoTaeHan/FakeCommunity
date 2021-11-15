// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CususrVO.java

package com.example.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class CususrVO {
    private String 		cusid;
    private String 		paswd;
    private String 		cname;
    private String 		phone;
    private String 		birth;
    private String 		email;
    private String 		zcode;
    private String 		adres;
    private String 		adr02;
    private String 		chint;
    private String		reslt;
    private Timestamp 	cdate;
    private Timestamp 	adate;
    private Timestamp 	fdate;
} // end of CususrVO