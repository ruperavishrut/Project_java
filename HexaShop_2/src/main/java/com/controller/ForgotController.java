package com.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.dao.ForgotDao;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/ForgotController")
public class ForgotController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("forgot_pass"))
		{
			String email=request.getParameter("email");
			User f=new User();
			ForgotDao dao=new ForgotDao();
			f=dao.checkEmail(email);
			if(f==null)
			{
				request.setAttribute("invalidemail", "Email Address Not Valid");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else
			{
				
				String emailid=f.getEmail();
				String username=f.getFirstname()+ " "+ f.getLastname();

				final String Senderid = "hexashopproject@gmail.com";
				final String password = "hiyksrkqqodswcoj";

				Properties props = new Properties();

				String host = "smtp.gmail.com";

				
				props.put("mail.smtp.socketFactory.port", "465");
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.socketFactory.fallback", "true");
				props.put("mail.smtp.ssl.protocols", "TLSv1.2");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.debug", "true");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", "465");
				props.put("mail.smtp.user", Senderid);
				props.put("mail.smtp.password", password);

				Session session = Session.getInstance(props, new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(Senderid, password);
					}
				});


				try {
					Random rand = new Random();
					int otp = rand.nextInt(900000) + 100000;
					Message message = new MimeMessage(session);
					message.setFrom(new InternetAddress(Senderid));
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailid));// to
																									// mail
																									// address.
					message.setSubject("OTP Request");
					String msg1 = "<!DOCTYPE html><html><head></head><body><center><div style='background-color:#f8f8f8; width:500px; height:200px'><div style='background-color:#00e58b; width:500px; height:50px'><h3 style='color:white; padding-top:10px;'>EmailDemo.com </h3></div><p style='color:gray; margin-left:-300px;'>Dear "
							+ username + ",</p><br><p style='color:gray; margin-top:-10px;'>" + otp
							+ "  is your One Time Password.Do NOT share this code with anyone for security reasons.this is valid for 10 minutes.</p><div></center></body></html>";
					
					
					String msg2="<div style=\"font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2\">\r\n"
							+ "  <div style=\"margin:50px auto;width:70%;padding:20px 0\">\r\n"
							+ "    <div style=\"border-bottom:1px solid #eee\">\r\n"
							+ "      <a href=\"\" style=\"font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600\">HexaShop</a>\r\n"
							+ "    </div>\r\n"
							+ "    <p style=\"font-size:1.1em\">Hi,"+username+"</p>\r\n"
							+ "    <p>Thank you for choosing HexaShop. Use the following OTP to complete your Forgot password procedures. OTP is valid for 10 minutes</p>\r\n"
							+ "    <h2 style=\"background: #00466a;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;\">"+otp+"</h2>\r\n"
							+ "    <p style=\"font-size:0.9em;\">Regards,<br />HexaShop</p>\r\n"
							+ "    <hr style=\"border:none;border-top:1px solid #eee\" />\r\n"
							+ "    <div style=\"float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300\">\r\n"							    
							+ "    </div>\r\n"
							+ "  </div>\r\n"
							+ "</div>";
					message.setContent(msg2, "text/html; charset=utf-8");
			
					Transport.send(message);

					HttpSession otpsession = request.getSession();
					otpsession.setAttribute("otp", otp);
					otpsession.setMaxInactiveInterval(10 * 60); /*Session Set for 10 minutes*/
					
					otpsession.setAttribute("UserData", f);
					request.getRequestDispatcher("SendOTP.jsp").forward(request, response);

				} catch (Exception e) {
					request.setAttribute("msg", "Otp Not Send");
					request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
					e.printStackTrace();
				}
			}
			
			
		}
		
		else if(action.equalsIgnoreCase("Verify"))
		{
			HttpSession session=request.getSession(false);
			String G_otp=String.valueOf(session.getAttribute("otp"));
			String E_otp=request.getParameter("EnterOTP");
			
			if(G_otp.equalsIgnoreCase(E_otp))
			{
				request.setAttribute("Otpmatch", "OTP Match");
				request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("notmatch", "OTP Not Match");
				request.getRequestDispatcher("SendOTP.jsp").forward(request, response);
			}
			
			
			
		}
		else if(action.equalsIgnoreCase("Confirm"))
		{
			String pswd=request.getParameter("newpassword");
			User f=new User();
			HttpSession session=request.getSession(false);
			f=(User)session.getAttribute("UserData");
			f.setPassword(pswd);
			f.setId(f.getId());
			ForgotDao dao=new ForgotDao();
			int r=dao.resetPassword(f);
			if(r>0)
			{
				request.setAttribute("pass_update", "Password Change Successfully...");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				//response.sendRedirect("index.jsp");
				System.out.println("Password Recovery Success!");
			}
			else
			{
				System.out.println("Error");
			}
			
			
		}
		
	}

}
