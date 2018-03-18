/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sms;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendSmsViaSmtp {

    /**
     * * @param args
     * @throws MessagingException
     * @throws AddressException
     */
    /**
     * * @throws AddressException
     * @throws MessagingException
     */
    public void msgsend(String body,String mob) throws AddressException, MessagingException {
        String username = "divya17";
        String password = "divyas17";
        String smtphost = "smtp.upsidewireless.com";
        String compression = "Lingas"; // insert compression option here if desired 
        String from = "divya17@smtp.upsidewireless.com"; 
        String to = "+91"+mob+"@sms.upsidewireless.com"; 
        Transport tr;

        Properties props = System.getProperties();
        props.put("mail.smtp.auth", "true");

        // Get a Session object 
        Session mailSession = Session.getDefaultInstance(props, null);

        // construct the message 
        Message msg = new MimeMessage(mailSession); 

        // Set message attributes 
        msg.setFrom(new InternetAddress(from)); 
        InternetAddress[] address = { new InternetAddress(to) }; 
        msg.setRecipients(Message.RecipientType.TO, address); 
        msg.setSubject(compression); msg.setText(body); 
        msg.setSentDate(new Date());

        tr = mailSession.getTransport("smtp");
        tr.connect(smtphost, username, password);
        msg.saveChanges();
        tr.sendMessage(msg, msg.getAllRecipients());
        tr.close();
    }
}
