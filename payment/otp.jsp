<!DOCTYPE html>
<html>
<head>
    <title>OTP Verification</title>
</head>

<body bgcolor="wheat" text="blue">

<center>

<h1>EMAIL OTP VERIFICATION</h1>

<form action="../VerifyOTPServlet" method="post">

<table border="1" cellpadding="5" cellspacing="5">

<tr>

    <th>ENTER OTP</th>

    <td>

        <input type="text"
               name="otp"
               maxlength="6"
               required>

    </td>

</tr>

<tr>

    <td colspan="2" align="center">

        <input type="submit"
               value="VERIFY OTP">

    </td>

</tr>

</table>

</form>

</center>

</body>
</html>