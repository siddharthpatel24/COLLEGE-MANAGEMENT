<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save Attendance</title>
</head>

<body bgcolor="purple" style="color:khaki;">

<center>

<%
try
{
    String course = request.getParameter("course");
    String year = request.getParameter("year");

    java.text.SimpleDateFormat sd =
        new java.text.SimpleDateFormat("dd-MM-yyyy");

    String adate = sd.format(new java.util.Date());

    String rollnos[] = request.getParameterValues("rollno");
    String names[] = request.getParameterValues("name");

    Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/backend",
        "siddharth",
        "1234");

    PreparedStatement pst = con.prepareStatement(
        "insert into attendance values(?,?,?,?,?,?)");

    for(int i=0; i<rollnos.length; i++)
    {
        String status =
            request.getParameter("status_" + rollnos[i]);

        pst.setString(1, rollnos[i]);
        pst.setString(2, names[i]);
        pst.setString(3, course);
        pst.setString(4, year);
        pst.setString(5, adate);
        pst.setString(6, status);

        pst.executeUpdate();
    }

    out.println(
    "<h2 style='color:lime'>Attendance Saved Successfully</h2>");

    pst.close();
    con.close();
}
catch(Exception e)
{
    out.println(e);
}
%>


</center>

</body>
</html>