import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class SendEmail{
 
	public static void main(String[] a) {
        
		final String raddr = a[0];
		final String subject = a[1];	
		final String msgbody = a[2];
        
		final String username = "dhilipmcakumar@gmail.com";
		final String password = "Karthick#2013";
 
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("dhilipmcakumar@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(raddr));
			message.setSubject(subject);
			message.setText(msgbody);
			message.setContent("/home/dhilipkumar/Desktop/Dhilip/perleval.pl");
 
			Transport.send(message);
 
			System.out.println("Done");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
