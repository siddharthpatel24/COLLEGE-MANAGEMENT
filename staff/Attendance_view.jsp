<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body bgcolor="purple" style="color:khaki;">
    <center>
        <table border="1" cellpadding="4" cellspacing="4">
            <tr>
                <th>Rollno</th>
                <th>Name</th>
                <th>course</th>
                <th>year</th>
                <th>adate</th>
                <th>status</th>
            </tr>
        <%@page import = "java.sql.*"%>
        <%
            String course = request.getParameter("course");
            String year = request.getParameter("year");
           String date = request.getParameter("date");

String arr[] = date.split("-");

date = arr[2] + "-" + arr[1] + "-" + arr[0];

            try{
                boolean f = false;
                Class.forName("com.mysql.jdbc.Driver");

                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/backend",
                    "siddharth",
                    "1234");
                PreparedStatement pst = con.prepareStatement("select * from attendance where course = ? and year = ? and adate = ?");
                pst.setString(1,course);
                pst.setString(2,year);
                pst.setString(3,date);
                ResultSet rs = pst.executeQuery();
                while(rs.next()){
                    f = true;
        %>
                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                    <td>
                        <%
                        if(rs.getString(6).equals("Present"))
                        {
                        %>
                            <font color="lime">Present</font>
                        <%
                        }
                        else
                        {
                        %>
                            <font color="red">Absent</font>
                        <%
                        }
                        %>
                    </td>
                </tr>
        <%
                }
            if(!f){
                out.println("<h1>RECORDS NOT FOUND</h1>");
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