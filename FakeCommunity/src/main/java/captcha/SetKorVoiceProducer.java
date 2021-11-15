// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SetKorVoiceProducer.java

package captcha;

import java.util.HashMap;
import java.util.Map;
import nl.captcha.audio.Sample;
import nl.captcha.audio.producer.VoiceProducer;
import nl.captcha.util.FileUtil;

public class SetKorVoiceProducer implements VoiceProducer {
	
	private static final Map 	DEFAULT_VOICES_MAP;
    private final Map 			_voices;

    public SetKorVoiceProducer() {
        this(DEFAULT_VOICES_MAP);
    } // end of SetKorVoiceProducer

    public SetKorVoiceProducer(Map voices) {
        _voices = voices;
    } // end of SetKorVoiceProducer

    public Sample getVocalization(char num) {
        try {
            Integer.parseInt((new StringBuilder(String.valueOf(num))).toString());
        } catch(NumberFormatException e) {
            throw new IllegalArgumentException((new StringBuilder("Expected <num> to be a number, got '")).append(num).append("' instead.").toString(), e);
        }
        int		idx			= Integer.parseInt((new StringBuilder(String.valueOf(num))).toString());
        String 	filename	= (String)_voices.get(Integer.valueOf(idx));
        return FileUtil.readSample(filename);
    } // end of getVocalization

    static {
        DEFAULT_VOICES_MAP = new HashMap();
        for(int i = 0; i < 10; i++) {
            StringBuilder sb = new StringBuilder("/sounds/ko/numbers/");
            sb.append(i);
            sb.append(".wav");
            DEFAULT_VOICES_MAP.put(Integer.valueOf(i), sb.toString());
        }
    }
} // end of SetKorVoiceProducer