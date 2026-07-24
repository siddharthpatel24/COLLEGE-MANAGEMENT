<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src=""></script>
</head>
<body  bgcolor="purple" style="color: khaki;">
    <!-- <link rel="stylesheet" href="../assets/css/tables.css"> -->

    <center>
        <form action="staffdatabase.jsp">
        <h1><i><b>STAFF REGISTRATION</h1>
        <table border="1"  cellpadding="4" cellspacing="4">
            <tr>
                <th>NAME : </th>
                <td><input type="text" name="name" ></td>
            </tr>
            <tr>
                <th>Gender : </th>
                <td><select name="gender">
                    <option >MALE</option>
                    <option >female</option>
                </select></td>
            </tr>
            <tr>
                <th>DOB : </th>
                <td><input type="date" name="date"></td>
            </tr>
            <tr>
                <th>PHONE NUMBER : </th>
                <td><input type="number" name="phno"></td>
            </tr>
            <tr>
                <th>ADDRESS</th>
                <td><input type="textarea" name="address"></td>
            </tr>
            <tr>
                <th>JOINING DATE</th>
                <%
                    java.text.SimpleDateFormat sd = new java.text.SimpleDateFormat("dd-MM-yyyy");
                    String str = sd.format(new java.util.Date()).toString();
                %>
                <td><input type="text" name="joindate" value="<%=str%>" readonly></td>
            </tr>
            <tr>
                <th>Image</th>
                <td>
                    <input type="file" name="img">
                </td>
            </tr>
            <tr>
                <th>DEPARTMENT</th>
                <td>
                    <select name="dept">
                        <option>---select---</option>
                        <option>CSE</option>
                        <option>ECE</option>
                        <option>EEE</option>
                        <option>MECH</option>
                        <option>AI/DS</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>ID</th>
            <%
                int n = 0;
                try{
                    
                    Class.forName("com.mysql.jdbc.Driver");

                    Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/backend",
                        "siddharth",
                        "1234"
                    );
                    PreparedStatement pst = con.prepareStatement("select MAX(id) from staff");
                    ResultSet rs = pst.executeQuery();
                    
                    if(rs.next()){
                        n = Integer.parseInt(rs.getString(1)) + 1;
                    }
        
                    rs.close();
                    pst.close();
                    con.close();


                }
                catch(Exception e){
                    out.println(e);
                }
                
            %>
            <td><input type="number" name="id" value="<%=n%>" readonly></td>
            </tr>
            <tr>
                <th>PASSWORD</th>
                <td><input type="password" name="pwd"></td>
            </tr>

        </table>
        <br>
        <input type="submit" value="ADD">
        </form>
    </center>
</body>
</html>