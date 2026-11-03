<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession session1 = request.getSession(false);

    if (session1 == null ||
        session1.getAttribute("patientName") == null) {

        response.sendRedirect("login.jsp");
        return;
    }

    String patientName =
            (String) session1.getAttribute("patientName");
%>

<!DOCTYPE html>
<html>

<head>

    <title>Patient Dashboard</title>

    <style>

        body {
            font-family: Arial;
            background-color: #f2f7ff;
            text-align: center;
        }

        .container {
            width: 600px;
            margin: 80px auto;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        a {
            display: block;
            margin: 15px;
            padding: 15px;
            background-color: #1976d2;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>Welcome, <%= patientName %>!</h1>

    <p>Hospital Appointment System</p>

    <a href="doctors">
        View Doctors
    </a>

    <a href="appointmentHistory">
        My Appointments
    </a>

    <a href="logout">
        Logout
    </a>

</div>

</body>

</html>