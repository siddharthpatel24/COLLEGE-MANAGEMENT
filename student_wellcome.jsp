<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body >
    <link rel="stylesheet" href="styles.css">
    <center>
        <h1><i><b>STUDENT DAHSBOARD</b></i></h1>
    </center>
    <%
    String name = (String) session.getAttribute("stdname");
    %>
<h2>WELLCOME <%= name%></h2>
</body>
</html>