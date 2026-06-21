<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body bgcolor="wheat" text="blue">
    <form action="verify.jsp">
    <center>
        <h1>COLLEGE MANAGEMENT SYSTEM</h1>
        <img src="download.jpg"  width="500" height="500"  style='position: absolute; top:100pt;left:100pt'>
        <table border="1" cellpadding="3" style="position: absolute;top:200pt;left:800pt">
            <tr>
                <th>User Type</th>
                <td><select name="t1">
                    <option >---select---</option>;
                    <option >Admin</option>
                    <option >Staff</option>
                    <option >Student</option>
                    </select>
                </td>
            </tr>

            <tr>
                <th>User Name</th>
                <td><input type="text" name="t2"></td>
            </tr>

             <tr>
                <th>Password</th>
                <td><input type="password" name="t3"></td>
            </tr>
        </table>
        <input type="submit" value="login" style="position: absolute;top:280pt;left:890pt">
        <a href="register.jsp" style="position: absolute;top:280pt;left:930pt">Register</a>
    </center>
    </form>
</body>
</html>