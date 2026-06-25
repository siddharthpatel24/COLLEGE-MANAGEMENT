<%@ page import="java.sql.*" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Menu</title>
</head>

<body bgcolor="lightyellow">
<center>

<a href="addstaff.jsp" target="f3">ADD STAFF</a><br><br>

<%
int c = 0;
try {
    Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/backend",
        "siddharth",
        "1234"
    );

    PreparedStatement pst =
        con.prepareStatement("SELECT COUNT(*) FROM staff");

    ResultSet rs = pst.executeQuery();

    if(rs.next()) {
        c = rs.getInt(1);
    }

    rs.close();
    pst.close();
    con.close();
}
catch(Exception e) {
    out.println(e);
}
%>

<a href="viewstaff.jsp" target="f3">
    VIEW STAFF (<%= c %>)
</a><br><br>

<a href="modifystaffinfo.jsp" target="f3">MODIFY STAFF</a><br><br>


<a href="deletestaffinfo.jsp" target="f3">DELETE STAFF</a><br><br>

</center>
</body>
</html>