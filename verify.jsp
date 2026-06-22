<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Validation</title>
</head>
<body bgcolor="wheat" text="blue">
<center>
<%@page import = "java.sql.*" %>
<%
    Connection con = null;
    PreparedStatement pst = null;
    try{
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/backend",
                "siddharth",
                "1234"
            );

        
        
            String utype = request.getParameter("t1");
            String uname = request.getParameter("t2");
            String upwsd = request.getParameter("t3");

            if (utype != null && uname != null && upwsd != null) {

                if (!uname.isEmpty()) {

                    if (!upwsd.isEmpty()) {

                        if (utype.equals("Admin")) {

                            if (uname.equals("Admin") && upwsd.equals("Admin")) {

                                session.setAttribute("name", "Administrator");
                                response.sendRedirect("AdminPage.jsp");

                            } else {

                                out.println("<h1>Invalid User Name/Password</h1>");

                            }

                        }
                        else if(utype.equals("Staff")) {                                                       //staff area
                            pst = con.prepareStatement("select * from staff where name= ? and  password = ?");
                            pst.setString(1,uname);
                            pst.setString(2,upwsd);
                            ResultSet rs = pst.executeQuery();
                            if(rs.next()){
                                
                                session.setAttribute("staffname",rs.getString(1));
                                response.sendRedirect("staffPage.jsp");
                            }
                            else{
                                out.println("<h1>Invalid staff credentials</h1>");
                            }
                            rs.close();
                        } else if (utype.equals("Student")) {
                            out.println("<h1>student area to be implemented</h1>");
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
        
        pst.close();
        con.close();
        }
    
catch(Exception e){
    out.println(e);
}

%>

<a href="index.jsp">Click Here</a> to go back

</center>
</body>
</html>