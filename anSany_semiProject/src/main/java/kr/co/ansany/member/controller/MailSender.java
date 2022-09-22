package kr.co.ansany.member.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSender {
	//이메일 인증코드
	public String sendMail(String email) {
		
		boolean result = false;
		//인증용 랜덤코드 생성
		Random r = new Random();
		StringBuilder sb = new StringBuilder();
		for(int i=0; i<8; i++) {
			int flag = r.nextInt(3);
			if(flag == 0) {
				int randomNum = r.nextInt(10);
				sb.append(randomNum);
			}else if(flag == 1) {
				char randomChar = (char)(r.nextInt(26)+65);
				sb.append(randomChar);
			}else if(flag == 2) {
				char randomChar = (char)(r.nextInt(26)+97);
				sb.append(randomChar);
			}
		}
		
		//이메일 통신설정
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		//인증 정보 설정(로그인)
		Session session = Session.getDefaultInstance(prop, 
				new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				PasswordAuthentication pa = new PasswordAuthentication("zzanghyoogii", "farzstbgipanpwdh");
				return pa;
				

			}
		}
		);
		//이메일 작성후 전송
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress("zzanghyoogii@gmail.com","ansany"));
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("ansany 가입 인증 메일입니다.","utf-8");
			msg.setContent("<h1>안녕하세요. ansany 입니다.</h1>"
					+"<h3>인증번호는[<span style='color:red'>"
					+sb.toString()
					+"</span>] 입니다. </h3>","text/html;charset=utf-8");
			
			Transport.send(msg);
			result = true;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result) {
			return sb.toString();
		}else {
			return null;
		}
	}
}
