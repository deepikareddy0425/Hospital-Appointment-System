<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html>

<head>

    <title>Doctors</title>

    <style>

        body {
            font-family: Arial;
            background-color: #f2f7ff;
        }

        h1 {
            text-align: center;
            color: #1976d2;
        }

        .doctor {
            width: 600px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 8px #ccc;
        }

        .doctor h2 {
            color: #1976d2;
        }

        .book {
            display: inline-block;
            padding: 10px 20px;
            background: #1976d2;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

    </style>

</head>

<body>

<h1>Available Doctors</h1>

<%
    List<Map<String, Object>> doctors =
        (List<Map<String, Object>>)
        request.getAttribute("doctors");

    for (Map<String, Object> doctor : doctors) {
%>

<div class="doctor">

    <h2>
        <%= doctor.get("name") %>
    </h2>

    <p>
        <b>Specialization:</b>
        <%= doctor.get("specialization") %>
    </p>

    <p>
        <b>Qualification:</b>
        <%= doctor.get("qualification") %>
    </p>

    <p>
        <b>Experience:</b>
        <%= doctor.get("experience") %> years
    </p>

    <p>
        <b>Available:</b>
        <%= doctor.get("days") %>
    </p>

    <p>
        <b>Fee:</b>
        ₹<%= doctor.get("fee") %>
    </p>

    <a class="book"
       href="bookAppointment.jsp?doctorId=<%= doctor.get("id") %>&doctorName=<%= doctor.get("name") %>">

        Book Appointment

    </a>

</div>

<%
    }
%>

</body>

</html>