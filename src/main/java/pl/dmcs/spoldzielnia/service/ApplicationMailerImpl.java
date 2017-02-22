package pl.dmcs.spoldzielnia.service;

import java.util.Properties;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service("mailService")
public class ApplicationMailerImpl {

	private JavaMailSenderImpl mailSender;

	public ApplicationMailerImpl() {
		mailSender = new JavaMailSenderImpl();
		// mailSender.setHost("smtp.gmail.com");
		mailSender.setPassword("trolling1234");
		// mailSender.setPort(587);

		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587");
		props.put("mail.debug", "true");
		props.put("mail.smtp.starttls.enable", "true");

		/*
		 * props.put("mail.smtp.socketFactory.port", "465");
		 * props.put("mail.smtp.socketFactory.class",
		 * "javax.net.ssl.SSLSocketFactory");
		 * props.put("mail.smtp.socketFactory.fallback", "false");
		 */
		/*
		 * mail.host=smtp.gmail.com mail.port=587
		 * mail.username=<gmail-username@gmail.com>
		 * mail.password=<gmail-password> mail.transport.protocol=smtp
		 * mail.smtp.auth=true mail.smtp.starttls.enable=true
		 * mail.from.email=<gmail-username@gmail.com>
		 */
		mailSender.setJavaMailProperties(props);
		mailSender.setUsername("mailsenderassociation@gmail.com");

	}

	public void setMailSender(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}

	public void sendMail(String to, String subject, String body) {

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(to);
		message.setSubject(subject);
		message.setText(body);
		mailSender.send(message);
	}

}