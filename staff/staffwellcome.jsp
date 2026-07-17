<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<% String name = (String) session.getAttribute("staffname");%>
<body style="color: crimson;">
    <center>
        <h1><i><B>COLLEGE MANAGEMENT SYSTEM</B></i></h1>
    </center>
    Welcome <%=name%>
</body>
</html>