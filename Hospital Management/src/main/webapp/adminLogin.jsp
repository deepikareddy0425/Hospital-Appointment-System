<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <title>Admin Login</title>

    <style>

        body {
            font-family: Arial;
            background-color: #f2f7ff;
        }

        .container {
            width: 400px;
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

    <h2>Admin Login</h2>

    <form action="adminLogin" method="post">

        <label>Username:</label>

        <input type="text"
               name="username"
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