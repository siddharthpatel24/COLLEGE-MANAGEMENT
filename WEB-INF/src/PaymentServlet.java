import java.io.*;
import java.sql.*;
import java.util.Properties;

import javax.servlet.*;
import javax.servlet.http.*;

import javax.mail.*;
import javax.mail.internet.*;

public class PaymentServlet extends HttpServlet {

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        Connection con = null;
        PreparedStatement pst = null;

        try {

            // Read Form Values
            String cardno = request.getParameter("t1");
            String holder = request.getParameter("t2");
            String expiry = request.getParameter("t3");
            String cvv = request.getParameter("t4");

            // Load Driver
            Class.forName("com.mysql.jdbc.Driver");

            // Database Connection
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/backend",
                    "siddharth",
                    "1234");

            // Verify Card Details
            pst = con.prepareStatement(
                "SELECT * FROM payments WHERE cardno=? AND cardholder=? AND expiry_date=? AND cvv=?");

            pst.setString(1, cardno);
            pst.setString(2, holder);
            pst.setString(3, expiry);
            pst.setString(4, cvv);

            ResultSet rs = pst.executeQuery();

            if(rs.next()){

                String email = rs.getString("email");

                // Generate OTP
                int otp = 100000 + (int)(Math.random()*900000);

                // Store OTP
                PreparedStatement pst2 = con.prepareStatement(
                    "UPDATE payments SET otp=? WHERE cardno=?");

                pst2.setString(1,String.valueOf(otp));
                pst2.setString(2,cardno);

                pst2.executeUpdate();

                pst2.close();

                // -------------------- EMAIL --------------------

                final String fromEmail =
                        "pulishettisiddupuli@gmail.com";

                final String password =
                        "kipa guds qjsb tqmr";

                Properties props = new Properties();

                props.put("mail.smtp.host","smtp.gmail.com");
                props.put("mail.smtp.port","587");
                props.put("mail.smtp.auth","true");
                props.put("mail.smtp.starttls.enable","true");

                Session mailSession =
                    Session.getInstance(
                        props,
                        new Authenticator(){

                        protected PasswordAuthentication
                        getPasswordAuthentication(){

                            return new PasswordAuthentication(
                                    fromEmail,
                                    password);

                        }

                    });

                Message message =
                        new MimeMessage(mailSession);

                message.setFrom(
                        new InternetAddress(fromEmail));

                message.setRecipients(
                        Message.RecipientType.TO,
                        InternetAddress.parse(email));

                message.setSubject(
                        "College Management System");

                message.setText(

                    "Dear Student,\n\n"

                    + "Your OTP for payment verification is : "

                    + otp

                    + "\n\n"

                    + "Do not share this OTP with anyone."

                    + "\n\n"

                    + "Thank You."

                );

                Transport.send(message);

                // Store Session

                HttpSession session =
                        request.getSession();

                session.setAttribute(
                        "cardno",
                        cardno);

                // Redirect

                response.sendRedirect("payment/otp.jsp");

            }

            else{

                out.println("<h2>Invalid Card Details</h2>");

            }

            rs.close();
            pst.close();
            con.close();

        }

        catch(Exception e){

            e.printStackTrace(out);

        }

    }

}