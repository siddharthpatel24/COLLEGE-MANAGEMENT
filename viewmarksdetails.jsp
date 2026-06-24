<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<body bgcolor="purple" style="color:khaki;">

<center>

<table border="1">

<tr>
<th>Roll No</th>
<th>Name</th>
<th>Course</th>
<th>Year</th>
<th>Subject</th>
<th>Marks</th>
</tr>

<%
try{

String course=request.getParameter("course");
String year=request.getParameter("year");
String subject=request.getParameter("subject");

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/backend",
"siddharth",
"1234");

PreparedStatement pst=
con.prepareStatement(
"select * from marks where course=? and year=? and subject=?");

pst.setString(1,course);
pst.setString(2,year);
pst.setString(3,subject);

ResultSet rs=pst.executeQuery();

while(rs.next()){
%>

<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
</tr>

<%
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