<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <center>
        <%
            
            String name = request.getParameter("name");
            String phno = request.getParameter("mobile");
            String add = request.getParameter("address");
            String dob = request.getParameter("dob");
            String course = request.getParameter("course");
            String year = request.getParameter("year");
            String gender = request.getParameter("gender");
            String joind = request.getParameter("joindate");
            String img = request.getParameter("image");
            String pwd = request.getParameter("password");
            String id = request.getParameter("rollno");
            
            try{
                 Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/backend",
                "siddharth",
                "1234");
            
            PreparedStatement pst = con.prepareStatement("update  prjstudent set name = ?, phno = ?, address = ?, dob = ?, course = ?, year = ?, gender = ?, join_date = ?, img = ?, password = ? where rollno = ?");
            
            pst.setString(1,name);
            pst.setString(2,phno);
            pst.setString(3,add);
            pst.setString(4,dob);
            pst.setString(5,course);
            pst.setString(6,year);
            pst.setString(7,gender);
            pst.setString(8,joind);
            pst.setString(9,img);
            pst.setString(10,pwd);
            pst.setString(11,id);

            pst.executeUpdate();
           out.println("<h1>"+id+" RECORD UPDATED"+"</h1>");
            pst.close();
            con.close();
        }
            catch(Exception e){
                out.println(e);
            }
        %>
        <a href="modifystudent.jsp">CLICK HERE</a>to update more...;
    </center>
</body>
</html>