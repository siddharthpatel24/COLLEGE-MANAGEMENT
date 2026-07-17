<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body bgcolor="lightpurple" text="gold">
    <center>
        <table border="1" cellpadding="4" cellspacing="4">
           <%@ page import="java.sql.*" %>
            <%
                try{
                     Class.forName("com.mysql.jdbc.Driver");

                    Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/backend",
                        "siddharth",
                        "1234"
                    );
                    PreparedStatement pst = con.prepareStatement("select * from staff");
                    ResultSet rs = pst.executeQuery();
                    out.println("<tr>");
                    out.println("<th>NAME</th>");
                    out.println("<th>GENDER</th>");
                    out.println("<th>DOB</th>");
                    out.println("<th>PHONE NO</th>");
                    out.println("<th>ADDRESS</th>");
                    out.println("<th>JOINDATE</th>");
                    out.println("<th>IAMGE</th>");
                    out.println("<th>DEPARTMENT</th>");
                    out.println("<th>ID</th>");
                    out.println("</tr>");
                    while(rs.next()){
                        out.println("<tr>");
                        out.println("<td>"+rs.getString(1)+"</td>");
                        out.println("<td>"+rs.getString(2)+"</td>");
                        out.println("<td>"+rs.getString(3)+"</td>");
                        out.println("<td>"+rs.getString(4)+"</td>");
                        out.println("<td>"+rs.getString(5)+"</td>");
                        out.println("<td>"+rs.getString(6)+"</td>");
                        out.println("<td>"+rs.getString(7)+"</td>");
                        String s = rs.getString(7);
                     
                        out.println("<td>"+rs.getString(8)+"</td>");
                        out.println("<td>"+rs.getString(9)+"</td>");
                        out.println("</tr>");
                    }
                   
                 
                    rs.close();
                    pst.close();
                    con.close();
                }
                catch(Exception e){
                    out.println(e);
                }
                out.close();
            %>
        </table>
    </center>
</body>
</html>