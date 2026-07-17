<!DOCTYPE html>
<%@page import = "java.sql.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body bgcolor="wheat" text="purple"> 
    <center>
        <table border="1" bgcolor="gold" cellpadding="4" cellspacing="4">
            <tr>
                <th>DATE</th>
                <th>STATUS</th>
            </tr>
        <%

            String x = (String) session.getAttribute("stdrollno");
            try{
                 Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/backend",
        "siddharth",
        "1234"
    );

                PreparedStatement pst = con.prepareStatement(" select adate,status from attendance where rollno = ?  order by adate desc");
                pst.setString(1,x);
                ResultSet rs = pst.executeQuery();
                while(rs.next()){
        %>
                    <tr>
                        <td><%= rs.getString(1)%></td>
                        <td><%= rs.getString(2)%></td>
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
    </center>
</body>
</html>