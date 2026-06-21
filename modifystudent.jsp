<%@page import = "java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>
</head>
<body   bgcolor="purple" style="color: khaki;">
<center>
<h1><i><b>MODIFICATION FORM</b></i> </h1>
<form action="updatestudent.jsp">

<table border="1" cellpadding="4" cellspacing="4">

<tr>
    <th>SELECT ROLL NUMBER TO UPDATE</th>
    <td><select name="rollno">
    <%
        try{
             Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/backend",
                "siddharth",
                "1234");
            PreparedStatement pst = con.prepareStatement("select rollno from prjstudent");
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
    %>
        <option ><%= rs.getString(1)%></option>
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
    </select></td>
</tr>

<tr>
    <th>STUDENT NAME</th>
    <td><input type="text" name="name"></td>
</tr>

<tr>
    <th>MOBILE NUMBER</th>
    <td><input type="text" name="mobile"></td>
</tr>

<tr>
    <th>ADDRESS</th>
    <td>
        <textarea name="address" rows="4" cols="25"></textarea>
    </td>
</tr>

<tr>
    <th>DATE OF BIRTH</th>
    <td><input type="date" name="dob"></td>
</tr>

<tr>
    <th>COURSE</th>
    <td>
        <select name="course">
            <option>CSE</option>
            <option>EEE</option>
            <option>ECE</option>
            <option>MECH</option>
            <option>CIVIL</option>
            <option>AI&ML</option>
        </select>
    </td>
</tr>

<tr>
    <th>YEAR</th>
    <td>
        <select name="year">
            <option>1st Year</option>
            <option>2nd Year</option>
            <option>3rd Year</option>
            <option>4th Year</option>
        </select>
    </td>
</tr>

<tr>
    <th>GENDER</th>
    <td>
        <input type="radio" name="gender" value="MALE"> Male
        <input type="radio" name="gender" value="FEMALE"> Female
    </td>
</tr>

<tr>
    <th>JOINING DATE</th>
    <%
        java.text.SimpleDateFormat sd =
            new java.text.SimpleDateFormat("dd-MM-yyyy");
        String str = sd.format(new java.util.Date());
    %>
    <td>
        <input type="text" name="joindate"
               value="<%=str%>" readonly>
    </td>
</tr>

<tr>
    <th>IMAGE</th>
    <td>
        <input type="file" name="image">
    </td>
</tr>

<tr>
    <th>PASSWORD</th>
    <td>
        <input type="password" name="password">
    </td>
</tr>

<tr>
    <td colspan="2" align="center">
        <input type="submit" value="UPDATE">
    </td>
</tr>

</table>

</form>

</center>

</body>
</html>