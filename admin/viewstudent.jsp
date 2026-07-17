<!DOCTYPE html>
<%@page import = "java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body bgcolor="purple" style="color: khaki;">
    <center>
        <table border="1" cellpadding="4" cellspacing="4">
        <tr>
            <th>ROLLNO</th>
            <th>NAME</th>
            <th>MOBILE NUMBER</th>
            <th>ADDRESS</th>
            <th>DATE OF BIRTH</th>
            <th>COURSE</th>
            <th>YEAR</th>
            <th>GENDER</th>
            <th>JOINDATE</th>
            <th>IMAGE</th>
            <th>PASSWORD</th>
        </tr>

        <%
            try{
                 Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/backend",
                "siddharth",
                "1234");
            
            PreparedStatement pst = con.prepareStatement("select * from prjstudent");
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                out.println("<tr>");
                out.println("<td>"+rs.getString(1)+"</td>");
                out.println("<td>"+rs.getString(2)+"</td>");
                out.println("<td>"+rs.getString(3)+"</td>");
                out.println("<td>"+rs.getString(4)+"</td>");
                out.println("<td>"+rs.getString(5)+"</td>");
                out.println("<td>"+rs.getString(6)+"</td>");
                out.println("<td>"+rs.getString(7)+"</td>");
                out.println("<td>"+rs.getString(8)+"</td>");
                out.println("<td>"+rs.getString(9)+"</td>");
                out.println("<td>"+rs.getString(10)+"</td>");
                out.println("<td>"+rs.getString(11)+"</td>");
                out.println("</tr>");
            }
            
            rs.close();
            pst.close();
            con.close();
        }
            catch(Exception e){
                out.println(e);
            }
        %>
        </table>
    </center>
</body>
</html>