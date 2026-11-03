package com.hospital;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminAppointments")
public class AdminAppointmentServlet
        extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT a.appointment_id, " +
                    "p.name AS patient_name, " +
                    "p.phone, " +
                    "d.name AS doctor_name, " +
                    "d.specialization, " +
                    "a.appointment_date, " +
                    "a.appointment_time, " +
                    "a.reason, " +
                    "a.status " +
                    "FROM appointments a " +
                    "JOIN patients p " +
                    "ON a.patient_id = p.patient_id " +
                    "JOIN doctors d " +
                    "ON a.doctor_id = d.doctor_id " +
                    "ORDER BY a.appointment_date DESC";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            request.setAttribute(
                    "appointments",
                    rs
            );

            request.getRequestDispatcher(
                    "adminAppointments.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error: " + e.getMessage()
            );
        }
    }
}