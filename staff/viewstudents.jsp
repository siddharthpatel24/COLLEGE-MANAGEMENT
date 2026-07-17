<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body bgcolor="purple" style="color: khaki;">
    <center>
        <form action="staff_std_details.jsp">
        <h1><i><b>VIEW STUDENTS</b></i></h1>
        <table border="1" cellpadding="4" cellspacing="4">
            <tr>
                <th>SELECT COURSE :</th>
                <td>
                    <select name="course" >
                        <option>CSE</option>
                        <option>EEE</option>
                        <option>ECE</option>
                        <option>MECH</option>
                        <option>AIML</option>
                        <option>CIVIL</option>
                    </select>
                </td>
            </tr>

            <tr>
                <th>SELECT YEAR</th>
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
                <td colspan="2" align="center" >

                    <input type="submit" value="VIEW" style="border-radius: 20%; overflow: hidden; cursor: pointer;">
                </td>
            </tr>
        </table>
        </form>
    </center>
</body>
</html>