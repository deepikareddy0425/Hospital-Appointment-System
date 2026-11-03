package com.hospital;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateAppointment")
public class UpdateAppointmentServlet
        extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int appointmentId =
                Integer.parseInt(
                    request.getParameter(
                        "appointmentId"
                    )
                );

        String status =
                request.getParameter("status");

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "UPDATE appointments " +
                    "SET status = ? " +
                    "WHERE appointment_id = ?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, status);

            ps.setInt(2, appointmentId);

            ps.executeUpdate();

            response.sendRedirect(
                    "adminAppointments"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Update failed: " +
                    e.getMessage()
            );
        }
    }
}