<body>
<script src="assets/javascript/login.js"></script>
<link rel="stylesheet" href="assets/css/index.css">
<form action="LoginServlet" method="post">

<div class="overlay">

    <div class="title">

        <h1>College Management System</h1>

        <p>
            Manage Students, Staff, Attendance, Marks,
            Books and Payments in one integrated platform.
        </p>

    </div>

    <div class="login">

        <h2>Login</h2>

        <table>

            <tr>
                <th>User Type</th>
            </tr>
            <tr>
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
            </tr>

            <tr>
                <td>
                    <input type="text" id="t2" name="t2" onblur="valid()">
                    <span id="nameError" style="color:#ff8080;"></span>
                </td>
            </tr>

            <tr>
                <th>Password</th>
            </tr>

            <tr>
                <td>
                    <input type="password" id="t3" name="t3" onblur="valid()">
                    <span id="passError" style="color:#ff8080;"></span>
                </td>
            </tr>

            <tr>
                <td>
                    <input type="submit" value="LOGIN">
                </td>
            </tr>

        </table>

        <a href="register.jsp" class="register">
            New User? Register Here
        </a>

    </div>

</div>

</form>

</body>