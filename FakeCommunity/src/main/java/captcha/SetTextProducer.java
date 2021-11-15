// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SetTextProducer.java

package captcha;

import nl.captcha.text.producer.TextProducer;

public class SetTextProducer implements TextProducer {
	
	private final String srcStr;

    public SetTextProducer(String answer) {
        srcStr = answer;
    }

    public String getText() {
        return srcStr;
    }
} // end of SetTextProducer