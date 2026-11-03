package com.hospital;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/bookAppointment")
public class BookAppointmentServlet extends HttpServlet {

    protected void doPost(
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
                (Integer) session.getAttribute("patientId");

        int doctorId =
                Integer.parseInt(
                    request.getParameter("doctorId")
                );

        String appointmentDate =
                request.getParameter("appointmentDate");

        String appointmentTime =
                request.getParameter("appointmentTime");

        String reason =
                request.getParameter("reason");

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                "INSERT INTO appointments " +
                "(appointment_id, patient_id, doctor_id, " +
                "appointment_date, appointment_time, " +
                "reason, status) " +
                "VALUES " +
                "(appointment_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, patientId);

            ps.setInt(2, doctorId);

            ps.setDate(
                3,
                Date.valueOf(appointmentDate)
            );

            ps.setString(
                4,
                appointmentTime
            );

            ps.setString(
                5,
                reason
            );

            ps.setString(
                6,
                "Pending"
            );

            ps.executeUpdate();

            response.sendRedirect(
                    "appointmentHistory"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Booking failed: " +
                e.getMessage()
            );
        }
    }
}