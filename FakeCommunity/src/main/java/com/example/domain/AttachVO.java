// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   AttachVO.java

package com.example.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class AttachVO {
    private String 	uuid;
    private String 	uploadpath;
    private String 	filename;
    private String 	filetype;
    private int		bno;
    private String 	cusid;
} // end of AttachVO