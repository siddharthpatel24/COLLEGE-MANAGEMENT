<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modify Staff Data</title>
</head>

<body bgcolor="wheat" text="purple">



<center>

    <h1><i><b>MODIFY DATA</b></i></h1>

    <form action="updatestaffinto.jsp" method="post" >

        <table border="1" bgcolor="gold" cellpadding="4" cellspacing="4">

            <tr>
                <th>Select ID TO UPDATE</th>
                <td>
                    <select name="id">
                        <%
                            Connection con = null;
                            PreparedStatement pst = null;
                            ResultSet rs = null;
                            try {
                                Class.forName("com.mysql.jdbc.Driver");

                                con = DriverManager.getConnection(
                                    "jdbc:mysql://localhost:3306/backend",
                                    "siddharth",
                                    "1234"
                                );

                                pst = con.prepareStatement(
                                    "SELECT id FROM staff"
                                );

                                rs = pst.executeQuery();

                                while (rs.next()) {
                        %>
                                    <option value="<%= rs.getString(1) %>">
                                        <%= rs.getString(1) %>
                                    </option>
                        <%
                                }
                            }
                            catch (Exception e) {
                                out.println(e);
                            }
                           
                        %>
                    </select>
                </td>
            </tr>

            <tr>
                <th>NAME :</th>
                <td>
                    <input type="text" name="name">
                </td>
            </tr>

            <tr>
                <th>Gender :</th>
                <td>
                    <select name="gender">
                        <option value="MALE">MALE</option>
                        <option value="FEMALE">FEMALE</option>
                    </select>
                </td>
            </tr>

            <tr>
                <th>DOB :</th>
                <td>
                    <input type="date" name="dob">
                </td>
            </tr>

            <tr>
                <th>PHONE NUMBER :</th>
                <td>
                    <input type="number" name="phno">
                </td>
            </tr>

            <tr>
                <th>ADDRESS :</th>
                <td>
                    <textarea name="address" rows="4" cols="25"></textarea>
                </td>
            </tr>

            <tr>
                <th>JOINING DATE :</th>
                <td>
                    <input type="date" name="joindate">
                </td>
            </tr>

            <tr>
                <th>IMAGE :</th>
                <td>
                    <input type="file" name="img">
                </td>
            </tr>

            <tr>
                <th>DEPARTMENT :</th>
                <td>
                    <select name="dept">
                        <option value="">---SELECT---</option>
                        <option value="CSE">CSE</option>
                        <option value="ECE">ECE</option>
                        <option value="EEE">EEE</option>
                        <option value="MECH">MECH</option>
                        <option value="AI/DS">AI/DS</option>
                    </select>
                </td>
            </tr>

            <tr>
                <th>PASSWORD :</th>
                <td>
                    <input type="password" name="pwd">
                </td>
            </tr>

        </table>

        <br>

        <input type="submit" value="MODIFY">

    </form>

</center>

</body>
</html>