<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
</head>
<body bgcolor="lightgreen">
<center>

<%
try {

    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String dob = request.getParameter("date");
    String phno = request.getParameter("phno");
    String add = request.getParameter("address");
    String joindate = request.getParameter("joindate");
    String img = request.getParameter("img");
    String dept = request.getParameter("dept");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");

    Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/backend",
        "siddharth",
        "1234"
    );

   
    PreparedStatement pst =
        con.prepareStatement("INSERT INTO staff VALUES(?,?,?,?,?,?,?,?,?,?)");

    pst.setString(1,name);
     pst.setString(2,gender);
      pst.setString(3,dob);
       pst.setString(4,phno);
        pst.setString(5,add);
         pst.setString(6,joindate);
          pst.setString(7,img);
           pst.setString(8,dept);
           pst.setString(9,id);
           pst.setString(10,pwd);


    pst.executeUpdate();

    
    out.println("<h2>Registration Successful</h2>");
    out.println("<a href='addstaff.jsp'>ADD MORE</a>----Click here");

    
    pst.close();
    con.close();
}
catch(Exception e) {
    out.println(e);
}
%>

</center>
</body>
</html>