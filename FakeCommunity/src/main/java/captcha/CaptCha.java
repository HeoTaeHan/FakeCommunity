// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CaptCha.java

package captcha;

import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nl.captcha.Captcha;
import nl.captcha.backgrounds.GradiatedBackgroundProducer;
import nl.captcha.gimpy.DropShadowGimpyRenderer;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.text.producer.NumbersAnswerProducer;
import nl.captcha.text.renderer.DefaultWordRenderer;

public class CaptCha {
	
	private static final long serialVersionUID = 1L;
    private static int width	= 150;
    private static int height 	= 50;

    public void getCaptCha(HttpServletRequest req, HttpServletResponse res) throws IOException {
        List fontList = new ArrayList();
        fontList.add(new Font("", 2, 40));
        fontList.add(new Font("Courier", 2, 40));
        fontList.add(new Font("", 0, 40));
        java.util.List colorList = new ArrayList();
        colorList.add(Color.black);
        Captcha captcha = (new nl.captcha.Captcha.Builder(width, height)).addText(new NumbersAnswerProducer(6), new DefaultWordRenderer(colorList, fontList)).gimp(new DropShadowGimpyRenderer()).gimp().addNoise().addBorder().addBackground(new GradiatedBackgroundProducer()).build();
        req.getSession().setAttribute("simpleCaptcha", captcha);
        CaptchaServletUtil.writeImage(res, captcha.getImage());
    } // end of getCaptCha
} // end of CaptCha