<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>

.login{
    position:absolute;
    top:180px;
    left:780px;
    background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0px 0px 15px black;
}

.login table{
    border-collapse:collapse;
}

.login th{
    color:purple;
    text-align:left;
    padding:10px;
}

.login td{
    padding:10px;
}

.login input,
.login select{
    width:180px;
    padding:6px;
    border:1px solid gray;
    border-radius:5px;
}

</style>
<body bgcolor="wheat" text="blue">
   <form action="LoginServlet" method="post">
    <center>
        <h1>COLLEGE MANAGEMENT SYSTEM</h1>
        <img src="assets/images/download.jpg"  width="500" height="500"  style='position: absolute; top:100pt;left:100pt'>
       <div class="login">

<table cellpadding="8">

<tr>
    <th>User Type</th>
    <td>
        <select name="t1">
            <option>---Select---</option>
            <option>Admin</option>
            <option>Staff</option>
            <option>Student</option>
        </select>
    </td>
</tr>

<tr>
    <th>User Name</th>
    <td>
        <input type="text" name="t2">
    </td>
</tr>

<tr>
    <th>Password</th>
    <td>
        <input type="password" name="t3">
    </td>
</tr>
<tr>
    <th></th>
    <td>
        <input type="submit" value="submit" name="t4">
    </td>
</tr>

</table>

</div>
        
        <a href="register.jsp" style="position: absolute;top:300pt;left:700pt">Register</a>
    </center>
    </form>
</body>
</html>   