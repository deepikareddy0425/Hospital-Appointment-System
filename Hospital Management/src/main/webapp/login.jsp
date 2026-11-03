<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Patient Login</title>

    <style>

        body {
            font-family: Arial;
            background-color: #f2f7ff;
        }

        .container {
            width: 350px;
            margin: 100px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
            color: #1976d2;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #1976d2;
            color: white;
            border: none;
            border-radius: 5px;
        }

    </style>

</head>

<body>

<div class="container">

    <h2>Patient Login</h2>

    <form action="login" method="post">

        <label>Email:</label>

        <input type="email"
               name="email"
               required>

        <label>Password:</label>

        <input type="password"
               name="password"
               required>

        <button type="submit">
            Login
        </button>

    </form>

</div>

</body>

</html>