<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
</head>

<body bgcolor="wheat" text="purple">

<center>

<h1>MY PROFILE</h1>

<%
String rollno = (String)session.getAttribute("stdrollno");

try
{
    Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/backend",
        "siddharth",
        "1234");

    PreparedStatement pst =
        con.prepareStatement(
        "select * from prjstudent where rollno=?");

    pst.setString(1,rollno);

    ResultSet rs = pst.executeQuery();

    if(rs.next())
    {
%>

<table border="1" cellpadding="6" cellspacing="4">

<tr>
<th>Roll Number</th>
<td><%=rs.getString("rollno")%></td>
</tr>

<tr>
<th>Name</th>
<td><%=rs.getString("name")%></td>
</tr>

<tr>
<th>Mobile Number</th>
<td><%=rs.getString("phno")%></td>
</tr>

<tr>
<th>Address</th>
<td><%=rs.getString("address")%></td>
</tr>

<tr>
<th>Date Of Birth</th>
<td><%=rs.getString("dob")%></td>
</tr>

<tr>
<th>Course</th>
<td><%=rs.getString("course")%></td>
</tr>

<tr>
<th>Year</th>
<td><%=rs.getString("year")%></td>
</tr>

<tr>
<th>Gender</th>
<td><%=rs.getString("gender")%></td>
</tr>

<tr>
<th>Joining Date</th>
<td><%=rs.getString("join_date")%></td>
</tr>

<tr>
<th>Image</th>
<td><%=rs.getString("img")%></td>
</tr>

</table>

<%
    }

    rs.close();
    pst.close();
    con.close();
}
catch(Exception e)
{
    out.println(e);
}
%>

<br><br>

</center>

</body>
</html>