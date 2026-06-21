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
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/backend",
        "siddharth",
        "1234");
                PreparedStatement pst = con.prepareStatement("update staff set name = ?, gender = ?, DOB = ?, phonenumber = ?, address = ?, join_date = ?, image = ?, department = ?,password= ? where id = ?");
                String name = request.getParameter("name");
                String gender = request.getParameter("gender");
                String dob = request.getParameter("date");
                String phno = request.getParameter("phno");
                String add = request.getParameter("address");
                String joindate = request.getParameter("joindate");
                String img = request.getParameter("img");
                String dept = request.getParameter("dept");
                String pwd = request.getParameter("pwd");

                String id = request.getParameter("id");

                pst.setString(1,name);
                pst.setString(2,gender);
                pst.setString(3,dob);
                pst.setString(4,phno);
                pst.setString(5,add);
                pst.setString(6,joindate);
                pst.setString(7,img);
                pst.setString(8,dept);
                
                pst.setString(9,pwd);
                pst.setString(10,id);


                pst.executeUpdate();
                out.println("<h1>"+id+" RECORD UPDATED"+"</h1>");
            
            pst.close();
            con.close();
            }
            catch(Exception e){
                out.println(e);
            }

        %>

    <a href="modifystaffinfo.jsp"><h1>UPDATE MORE</h1></a>
    </center>
</body>
</html>