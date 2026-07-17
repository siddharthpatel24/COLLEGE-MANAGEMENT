<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body bgcolor="lightyellow" text="marun">
    <center>
        <a href="addstudent.jsp" target="f3">ADD STUDENT</a><br><br>
        <%
            int c = 0;
            try{
                 Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/backend",
                "siddharth",
                "1234");

                PreparedStatement pst = con.prepareStatement("select count(*) from prjstudent");
                ResultSet rs = pst.executeQuery();
                if(rs.next()){
                    c = rs.getInt(1);
                }
                rs.close();
                pst.close();
                con.close();
            }
            catch(Exception e){
                out.println(e);
            }
        %>
        <a href="viewstudent.jsp"  target="f3" >VIEW STUDENT (<%= c%>)</a><br><br>
        <a href="modifystudent.jsp"  target="f3">MODIFY STUDENT</a><br><br>
        <a href="deletestaff.jsp"  target="f3">DELETE STUDENT</a><br><br>
    </center>
</body>
</html>