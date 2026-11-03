<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String doctorId =
        request.getParameter("doctorId");

    String doctorName =
        request.getParameter("doctorName");
%>

<!DOCTYPE html>
<html>

<head>

    <title>Book Appointment</title>

    <style>

        body {
            font-family: Arial;
            background-color: #f2f7ff;
        }

        .container {
            width: 400px;
            margin: 60px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #1976d2;
            color: white;
            border: none;
        }

    </style>

</head>

<body>

<div class="container">

    <h2>Book Appointment</h2>

    <p>
        Doctor:
        <b><%= doctorName %></b>
    </p>

    <form action="bookAppointment" method="post">

        <input type="hidden"
               name="doctorId"
               value="<%= doctorId %>">

        <label>Appointment Date:</label>

        <input type="date"
               name="appointmentDate"
               required>

        <label>Appointment Time:</label>

        <input type="text"
               name="appointmentTime"
               placeholder="Example: 10:30 AM"
               required>

        <label>Reason:</label>

        <textarea
            name="reason"
            required>
        </textarea>

        <button type="submit">
            Book Appointment
        </button>

    </form>

</div>

</body>

</html>