import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class VerifyOTPServlet extends HttpServlet {

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        try{

            String enteredOTP = request.getParameter("otp");

            HttpSession session = request.getSession();

            String cardno =
                (String)session.getAttribute("cardno");

            Class.forName("com.mysql.jdbc.Driver");

            Connection con =
                DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/backend",
                    "siddharth",
                    "1234");

            PreparedStatement pst =
                con.prepareStatement(
                    "SELECT otp FROM payments WHERE cardno=?");

            pst.setString(1,cardno);

            ResultSet rs = pst.executeQuery();

            if(rs.next()){

                String dbOTP = rs.getString("otp");

                if(dbOTP.equals(enteredOTP)){

                    response.sendRedirect("payment/payment_success.jsp");

                }

                else{

                    out.println("<h2>Invalid OTP</h2>");

                }

            }

            else{

                out.println("<h2>Payment Record Not Found</h2>");

            }

            rs.close();
            pst.close();
            con.close();

        }

        catch(Exception e){

            out.println(e);

        }

    }

}