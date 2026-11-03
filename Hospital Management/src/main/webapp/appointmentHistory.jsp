<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>

<head>

    <title>Appointment History</title>

    <style>

        body {
            font-family: Arial;
            background-color: #f2f7ff;
        }

        h1 {
            text-align: center;
            color: #1976d2;
        }

        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #1976d2;
            color: white;
        }

    </style>

</head>

<body>

<h1>My Appointments</h1>

<table>

    <tr>

        <th>Doctor</th>
        <th>Specialization</th>
        <th>Date</th>
        <th>Time</th>
        <th>Reason</th>
        <th>Status</th>

    </tr>

<%

    ResultSet rs =
        (ResultSet) request.getAttribute(
            "appointments"
        );

    while (rs.next()) {

%>

    <tr>

        <td>
            <%= rs.getString("name") %>
        </td>

        <td>
            <%= rs.getString("specialization") %>
        </td>

        <td>
            <%= rs.getDate("appointment_date") %>
        </td>

        <td>
            <%= rs.getString("appointment_time") %>
        </td>

        <td>
            <%= rs.getString("reason") %>
        </td>

        <td>
            <%= rs.getString("status") %>
        </td>

    </tr>

<%
    }
%>

</table>

</body>

</html>