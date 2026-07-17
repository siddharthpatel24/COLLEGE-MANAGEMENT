<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Store</title>
</head>
<body bgcolor="gray" text="black">

<center>
    <h1><i><b>BOOK STORE</b></i></h1>
    <table border="1" cellpadding="4" cellspacing="4" bgcolor="gold">
        <tr>
            <th>BOOKS</th>
            <th>COST</th>
            <th>ACTION</th>
        </tr>

        <tr>
            <td>
                <img src="../assets/images/500x669engineering-physics.webp" width="150" alt="Engineering Physics">
            </td>
            <td>500</td>
            <td>
                <form action="../payment/payment.jsp">
                    <input type="submit" value="BUY">
                </form>
            </td>
        </tr>

        <tr>
            <td>
                <img src="../assets/images/SPPL_45_Front_1080x.webp" width="150" alt="Book">
            </td>
            <td>600</td>
            <td>
                <form action="../payment/payment.jsp">
                    <input type="submit" value="BUY">
                </form>
            </td>
        </tr>

    </table>

    <a href="student_Page.jsp">BACK TO PAGE</a>...
</center>

</body>
</html>