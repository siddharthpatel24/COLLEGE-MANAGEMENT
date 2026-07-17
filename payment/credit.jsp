<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Credit Card Details</title>
</head>

<body bgcolor="wheat" text="blue">
<%

    try{

        String no   = request.getParameter("t1");
        String name = request.getParameter("t2");
        String date = request.getParameter("t3");
        String cvv  = request.getParameter("t4");

        int otp = 100000 + (int)(Math.random() * 900000);

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/backend",
            "siddharth",
            "1234"
        );

        PreparedStatement pst = con.prepareStatement(
            "UPDATE payments SET otp=? WHERE cardno=? AND cardholder=? AND expiry_date=? AND cvv=?"
        );

        pst.setInt(1, otp);
        pst.setString(2, no);
        pst.setString(3, name);
        pst.setString(4, date);
        pst.setString(5, cvv);

        int x = pst.executeUpdate();

        if(x > 0){
            out.println("<center>PAYMENT SUCCESSFULL</center>");
            out.println("<center><a href='../student/buy_books.jsp'>BUY MORE</a>.....</center>");
        }
        else{
            out.println("<center><h2>Invalid Card Details</h2></center>");
        }

        pst.close();
        con.close();
    }
    catch(Exception e){
        out.println(e);
    }

%>

<center>
  <h1><i>CREDIT CARD DETAILS</i></h1>

<form action="../PaymentServlet" method="post">

<table border="1" cellpadding="4" cellspacing="4">

<tr>
    <th>ENTER CARD NO</th>
    <td>
        <input type="text" placeholder="Enter Card Number" name="t1" required>
    </td>
</tr>

<tr>
    <th>CARD HOLDER NAME</th>
    <td>
        <input type="text" placeholder="Card Holder Name" name="t2" required>
    </td>
</tr>

<tr>
    <th>EXPIRY DATE</th>
    <td>
        <input type="text" placeholder="MM/YY" name="t3" required>
    </td>
</tr>

<tr>
    <th>ENTER CVV</th>
    <td>
        <input type="password" placeholder="CVV" name="t4" maxlength="3" required>
    </td>
</tr>

<tr>
    <td colspan="2" align="center">
        <input type="submit" value="SUBMIT">
    </td>
</tr>

</table>

</form>

</body>
</html>