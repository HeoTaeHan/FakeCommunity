// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   AudioCaptCha2.java

package captcha;

import java.io.IOException;
import javax.servlet.http.*;
import nl.captcha.Captcha;
import nl.captcha.audio.AudioCaptcha;
import nl.captcha.servlet.CaptchaServletUtil;

// Referenced classes of package captcha:
//            SetTextProducer

public class AudioCaptCha2 {

    public void getAudioCaptCha(HttpServletRequest req, HttpServletResponse res, String answer) throws IOException {
        HttpSession session 	= req.getSession();
        Captcha 	captcha		= (Captcha)session.getAttribute("simpleCaptcha");
        String 		getAnswer 	= answer;
        if(getAnswer == null || getAnswer.equals("")) {
            getAnswer = captcha.getAnswer();
        }
        AudioCaptcha audiocaptcha = (new nl.captcha.audio.AudioCaptcha.Builder()).addAnswer(new SetTextProducer(getAnswer)).addNoise().build();
        CaptchaServletUtil.writeAudio(res, audiocaptcha.getChallenge());
    } // end of getAudioCaptCha
} // end of AudioCaptCha2
