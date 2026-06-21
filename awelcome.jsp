<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body bgcolor="wheat" text="red">
    <center>
        <h1>COLLEGE MANAGEMENT SYSTEM</h1>
        <%
           String name = (String) session.getAttribute("name");
        %>
    </center>
    Welcome <%=name%>
    
</body>
</html>