<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <title>Admin Dashboard</title>

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
            margin: 20px;
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

    <h1>Admin Dashboard</h1>

    <h3>Welcome Admin</h3>

    <a href="adminAppointments">
        View All Appointments
    </a>

    <a href="logout">
        Logout
    </a>

</div>

</body>

</html>