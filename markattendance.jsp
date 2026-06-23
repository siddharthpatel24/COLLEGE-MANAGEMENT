<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<body bgcolor="purple" style="color:khaki;">

<center>

<%
String course=request.getParameter("course");
String year=request.getParameter("year");
%>

<h2>Attendance Entry</h2>

<form action="saveattendance.jsp">

<input type="hidden" name="course" value="<%=course%>">
<input type="hidden" name="year" value="<%=year%>">

<table border="1">

<tr>
<th>Roll No</th>
<th>Name</th>
<th>Attendance</th>
</tr>

<%
try{

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/backend",
"siddharth",
"1234");

PreparedStatement pst=
con.prepareStatement(
"select * from prjstudent where course=? and year=?");

pst.setString(1,course);
pst.setString(2,year);

ResultSet rs=pst.executeQuery();

while(rs.next()){
%>

<tr>

<td>
<%=rs.getString("rollno")%>

<input type="hidden"
name="rollno"
value="<%=rs.getString("rollno")%>">

<input type="hidden"
name="name"
value="<%=rs.getString("name")%>">

</td>

<td><%=rs.getString("name")%></td>

<td>

<input type="radio"
name="status_<%=rs.getString("rollno")%>"
value="Present" checked>Present

<input type="radio"
name="status_<%=rs.getString("rollno")%>"
value="Absent">Absent

</td>

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

<br>

<input type="submit" value="SAVE ATTENDANCE">

</form>

</center>

</body>
</html>