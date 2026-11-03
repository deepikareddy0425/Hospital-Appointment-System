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
import javax.servlet.http.HttpSession;

@WebServlet("/appointmentHistory")
public class AppointmentHistoryServlet
        extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("patientId") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        int patientId =
                (Integer) session.getAttribute(
                        "patientId"
                );

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                "SELECT a.appointment_id, " +
                "d.name, d.specialization, " +
                "a.appointment_date, " +
                "a.appointment_time, " +
                "a.reason, a.status " +
                "FROM appointments a " +
                "JOIN doctors d " +
                "ON a.doctor_id = d.doctor_id " +
                "WHERE a.patient_id = ? " +
                "ORDER BY a.appointment_date DESC";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, patientId);

            ResultSet rs =
                    ps.executeQuery();

            request.setAttribute(
                    "appointments",
                    rs
            );

            request.getRequestDispatcher(
                    "appointmentHistory.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Error: " + e.getMessage()
            );
        }
    }
}