<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<body bgcolor="purple" style="color:khaki;">

<center>

<%
try{

String course=request.getParameter("course");
String year=request.getParameter("year");
String subject=request.getParameter("subject");

String rollnos[]=request.getParameterValues("rollno");
String names[]=request.getParameterValues("name");

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/backend",
"siddharth",
"1234");

PreparedStatement pst=
con.prepareStatement(
"insert into marks values(?,?,?,?,?,?)");

for(int i=0;i<rollnos.length;i++)
{
String m=request.getParameter(
"marks_"+rollnos[i]);

pst.setString(1,rollnos[i]);
pst.setString(2,names[i]);
pst.setString(3,course);
pst.setString(4,year);
pst.setString(5,subject);
pst.setString(6,m);

pst.executeUpdate();
}

out.println("<h2>MARKS SAVED SUCCESSFULLY</h2>");

pst.close();
con.close();

}
catch(Exception e){
out.println(e);
}
%>

</center>

</body>
</html>