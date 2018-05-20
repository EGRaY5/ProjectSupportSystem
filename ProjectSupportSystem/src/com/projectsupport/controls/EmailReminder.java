package com.projectsupport.controls;

import com.projectsupport.models.User;
import com.projectsupport.services.MyUtils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Properties;

/**
 * Servlet implementation class EmailReminder
 */
@WebServlet("/EmailReminder")
public class EmailReminder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailReminder() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//Get session
        HttpSession session = request.getSession();
        //Get current user's session
        User currentUser = MyUtils.getLoginedUser(session);
        //If no logged in user ask to login
        if (currentUser == null) {
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/login");
            dispatcher.forward(request, response);
            return;
        }
        
        //Get current user's username and store to variable userName
        String userName = (currentUser.getUserName());
        //Get recipient mail through id recipient mail in sendReminders.jsp
        String recipientmail = request.getParameter("recipientmail");
        //Get heading throgh id heading
        String heading = request.getParameter("heading");
        //Get mail through id mail
        String mail = request.getParameter("mail");

        //Print in console for testing purposes
        System.out.println(userName);
        System.out.println(heading);
        System.out.println(mail);

        //Code from javaxmail
        final String username = "bitprojectcoordinator@gmail.com";
        final String password = "BitCoordinator123";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session sess = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        
        	String errorString = null;
        	if(errorString == null){
            try {

                Message message = new MimeMessage(sess);
                message.setFrom(new InternetAddress("bitprojectcoordinator@gmail.com"));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientmail));
                message.setSubject(heading);
                message.setText(mail);

                Transport.send(message);

                System.out.println("Done");



            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            
            request.setAttribute("errorString", errorString);
    	    
    	    //out.println("<script>  alert('Question inserted Successfully');  </script>");
            //If mail sent successfully direct to ShowEmailSuccess servelet
			   response.sendRedirect(request.getContextPath() + "/ShowEmailSuccess");
            
        	}   

    }

}
