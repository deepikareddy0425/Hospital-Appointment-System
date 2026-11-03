package com.hospital;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO patients " +
                    "(patient_id, name, email, phone, age, gender, password) " +
                    "VALUES (patient_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setInt(4, age);
            ps.setString(5, gender);
            ps.setString(6, password);

            ps.executeUpdate();

            response.sendRedirect("login.jsp");

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Registration failed: " + e.getMessage()
            );
        }
    }
}