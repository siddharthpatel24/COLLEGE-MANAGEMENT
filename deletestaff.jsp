<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Staff Record</title>
</head>
<body bgcolor="wheat">
<center>

<%
try {

    String id = request.getParameter("rollno");

   

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/backend",
                "siddharth",
                "1234");

        PreparedStatement pst =
                con.prepareStatement("DELETE FROM prjstudent WHERE rollno=?");

        pst.setString(1, id);

        int rows = pst.executeUpdate();

        if (rows > 0) {
            out.println("<h3 style='color: olive;' >"+ id + " Record Deleted Successfully"+"</h3>");
        }  
        pst.close();
        con.close();
} catch (Exception e) {
    out.println(e);
}
%>

<form>

<table border="1" cellpadding="4" cellspacing="4">

<tr>
    <th>Select ROLL NO to Delete</th>
    <td>
        <select name="rollno">

        <%
        try {

            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/backend",
                    "siddharth",
                    "1234");

            PreparedStatement pst =
                    con.prepareStatement("SELECT rollno FROM prjstudent");

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
        %>

            <option value="<%= rs.getString(1) %>">
                <%= rs.getString(1) %>
            </option>

        <%
            }
            rs.close();
            pst.close();
            con.close();

        } catch (Exception e) {
            out.println(e);
        }
        %>

        </select>
    </td>
</tr>

<tr>
    <td colspan="2" align="center">
        <input type="submit" value="Delete">
    </td>
</tr>

</table>

</form>
<br><br><br>
<a href='viewstudent.jsp'> VIEW RECORDS </a>
</center>

</body>
</html>