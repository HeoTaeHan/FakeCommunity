// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   AudioCaptCha.java

package captcha;

import java.io.IOException;
import javax.servlet.http.*;
import nl.captcha.Captcha;
import nl.captcha.audio.AudioCaptcha;
import nl.captcha.servlet.CaptchaServletUtil;

// Referenced classes of package captcha:
//            SetKorVoiceProducer, SetTextProducer

public class AudioCaptCha {

	public void getAudioCaptCha(HttpServletRequest req, HttpServletResponse resp, String answer) throws IOException {
		HttpSession		session 		= req.getSession();
		Captcha 		captcha			= (Captcha)session.getAttribute("simpleCaptcha");
		String 			getAnswer 		= answer;
		AudioCaptcha 	audiocaptcha	= null;
		if(getAnswer == null || "".equals(getAnswer)) {
			getAnswer = captcha.getAnswer();
		}
		String lan = req.getParameter("lan");
		if(lan != null && "kor".equals(lan)) {
			nl.captcha.audio.producer.VoiceProducer vProd = new SetKorVoiceProducer();
			audiocaptcha = (new nl.captcha.audio.AudioCaptcha.Builder()).addAnswer(new SetTextProducer(getAnswer)).addVoice(vProd).addNoise().build();
		} else {
			audiocaptcha = (new nl.captcha.audio.AudioCaptcha.Builder()).addAnswer(new SetTextProducer(getAnswer)).addNoise().build();
		}
		String agent = req.getParameter("agent");
		CaptchaServletUtil.writeAudio(resp, audiocaptcha.getChallenge());
	} // end of getAudioCaptCha
} // end of AudioCaptCha