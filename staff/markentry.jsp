<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<body bgcolor="purple" style="color:khaki;">

<center>

<%
String course=request.getParameter("course");
String year=request.getParameter("year");
String subject=request.getParameter("subject");
%>

<form action="savemarks.jsp">

<input type="hidden" name="course" value="<%=course%>">
<input type="hidden" name="year" value="<%=year%>">
<input type="hidden" name="subject" value="<%=subject%>">

<table border="1">

<tr>
<th>Roll No</th>
<th>Name</th>
<th>Marks</th>
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
<input type="text"
name="marks_<%=rs.getString("rollno")%>">
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

<input type="submit" value="SAVE MARKS">

</form>

</center>

</body>
</html>