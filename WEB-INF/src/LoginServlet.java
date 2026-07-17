

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
                System.out.println("===== LoginServlet Executed =====");
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
                
        Connection con = null;
        PreparedStatement pst = null;

        try {

            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/backend",
                    "siddharth",
                    "1234");

            String utype = request.getParameter("t1");
            String uname = request.getParameter("t2");
            String upwsd = request.getParameter("t3");

            HttpSession session = request.getSession();

            if (utype != null && uname != null && upwsd != null) {

                if (!uname.isEmpty()) {

                    if (!upwsd.isEmpty()) {

                        if (utype.equals("Admin")) {

                            if (uname.equals("Admin") && upwsd.equals("Admin")) {

                                session.setAttribute("name", "Administrator");

                                response.sendRedirect("admin/AdminPage.jsp");

                            } else {

                                out.println("<h1>Invalid User Name/Password</h1>");

                            }

                        }

                        else if (utype.equals("Staff")) {

                            pst = con.prepareStatement(
                                    "select * from staff where name=? and password=?");

                            pst.setString(1, uname);
                            pst.setString(2, upwsd);

                            ResultSet rs = pst.executeQuery();

                            if (rs.next()) {

                                session.setAttribute("staffname",
                                        rs.getString(1));

                                response.sendRedirect("staff/staffPage.jsp");

                            } else {

                                out.println("<h1>Invalid Staff Credentials</h1>");

                            }

                            rs.close();

                        }

                        else if (utype.equals("Student")) {

                            pst = con.prepareStatement(
                                    "select * from prjstudent where name=? and password=?");

                            pst.setString(1, uname);
                            pst.setString(2, upwsd);

                            ResultSet rs = pst.executeQuery();

                            if (rs.next()) {

                                session.setAttribute(
                                        "stdrollno",
                                        rs.getString("rollno"));

                                session.setAttribute(
                                        "stdname",
                                        rs.getString("name"));

                                response.sendRedirect("student/student_Page.jsp");

                            } else {

                                out.println("<h1>Invalid Student Credentials</h1>");

                            }

                            rs.close();

                        }

                    } else {

                        out.println("<h1>Invalid Password</h1>");

                    }

                } else {

                    out.println("<h1>Invalid Username</h1>");

                }

            } else {

                out.println("<h1>Missing Request Parameters</h1>");

            }

            if (pst != null)
                pst.close();

            if (con != null)
                con.close();

        }

        catch (Exception e) {

            out.println(e);

        }

    }

}