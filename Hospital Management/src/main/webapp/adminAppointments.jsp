<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>

<head>

    <title>Manage Appointments</title>

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
            width: 95%;
            margin: 30px auto;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #1976d2;
            color: white;
        }

        .confirm {
            background-color: green;
            color: white;
            padding: 7px;
            text-decoration: none;
        }

        .reject {
            background-color: red;
            color: white;
            padding: 7px;
            text-decoration: none;
        }

    </style>

</head>

<body>

<h1>Manage Appointments</h1>

<table>

<tr>

    <th>Patient</th>
    <th>Phone</th>
    <th>Doctor</th>
    <th>Specialization</th>
    <th>Date</th>
    <th>Time</th>
    <th>Reason</th>
    <th>Status</th>
    <th>Action</th>

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
        <%= rs.getString("patient_name") %>
    </td>

    <td>
        <%= rs.getString("phone") %>
    </td>

    <td>
        <%= rs.getString("doctor_name") %>
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

    <td>

        <a class="confirm"
           href="updateAppointment?appointmentId=<%= rs.getInt("appointment_id") %>&status=Confirmed">

            Confirm

        </a>

        <br><br>

        <a class="reject"
           href="updateAppointment?appointmentId=<%= rs.getInt("appointment_id") %>&status=Rejected">

            Reject

        </a>

    </td>

</tr>

<%
    }
%>

</table>

</body>

</html>