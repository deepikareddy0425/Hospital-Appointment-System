package com.hospital;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/doctors")
public class DoctorServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, Object>> doctors =
                new ArrayList<>();

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql = "SELECT * FROM doctors";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Map<String, Object> doctor =
                        new HashMap<>();

                doctor.put(
                        "id",
                        rs.getInt("doctor_id")
                );

                doctor.put(
                        "name",
                        rs.getString("name")
                );

                doctor.put(
                        "specialization",
                        rs.getString("specialization")
                );

                doctor.put(
                        "qualification",
                        rs.getString("qualification")
                );

                doctor.put(
                        "experience",
                        rs.getInt("experience")
                );

                doctor.put(
                        "days",
                        rs.getString("available_days")
                );

                doctor.put(
                        "fee",
                        rs.getDouble("fee")
                );

                doctors.add(doctor);
            }

            request.setAttribute(
                    "doctors",
                    doctors
            );

            request.getRequestDispatcher(
                    "doctors.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error: " + e.getMessage()
            );
        }
    }
}