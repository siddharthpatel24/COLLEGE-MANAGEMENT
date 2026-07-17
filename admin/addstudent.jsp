<%@page import = "java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>
</head>
<body   bgcolor="purple" style="color: khaki;">
<%
    String id = request.getParameter("rollno");

    if(id != null)
    {
    try{

        String name = request.getParameter("name");
        String phno = request.getParameter("mobile");
        String add = request.getParameter("address");
        String dob = request.getParameter("dob");
        String course = request.getParameter("course");
        String year = request.getParameter("year");
        String gender = request.getParameter("gender");
        String joind = request.getParameter("joindate");
        String img = request.getParameter("image");
        String pwd = request.getParameter("password");

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/backend",
                "siddharth",
                "1234");

        PreparedStatement pst =
            con.prepareStatement(
                "insert into prjstudent values(?,?,?,?,?,?,?,?,?,?,?)");

        pst.setString(1,id);
        pst.setString(2,name);
        pst.setString(3,phno);
        pst.setString(4,add);
        pst.setString(5,dob);
        pst.setString(6,course);
        pst.setString(7,year);
        pst.setString(8,gender);
        pst.setString(9,joind);
        pst.setString(10,img);
        pst.setString(11,pwd);

        int x = pst.executeUpdate();

        if(x > 0){
           out.println(
"<div style='color:lime; font-size:20px; font-weight:bold; margin-bottom:10px;'>"
+ "REGISTRATION COMPLETED"
+ "</div>"
);
        }

        pst.close();
        con.close();
    }
    catch(Exception e){
        out.println(e);
    }
}
%>
<center>
    <h1><i><b>STUDENT REGISTRATION FORM</b></i> </h1>
<form>

<table border="1" cellpadding="4" cellspacing="4">

<tr>
    <th>ROLL NUMBER</th>
    <%  
        int c = 0;
        try{
            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/backend",
                "siddharth",
                "1234"
            );
            PreparedStatement pst = con.prepareStatement("select max(rollno) from prjstudent");
            ResultSet rs = pst.executeQuery();
            if(rs.next() && rs.getString(1) != null){
                c = Integer.parseInt(rs.getString(1)) + 1;
            }
            else{
                c = 1;
            }
            rs.close();
            pst.close();
            con.close();
        }   
        catch(Exception e){
            out.println(e);
        } 
    %>
    <td><input type="text" name="rollno" value="<%= c%>" readonly></td>
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
        <input type="submit" value="ADD STUDENT">
    </td>
</tr>

</table>

</form>

</center>

</body>
</html>