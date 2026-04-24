package com.mentormarket.servlet;

import com.mentormarket.util.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Handles session booking.
 * POST /book-session
 */
public class BookSessionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp?error=session_expired&redirect=booking.jsp");
            return;
        }

        int buyerId        = (int) session.getAttribute("userId");
        String expertId    = request.getParameter("expertId");
        String sessionType = request.getParameter("sessionType");
        String sessionDate = request.getParameter("sessionDate");
        String sessionTime = request.getParameter("sessionTime");
        String duration    = request.getParameter("duration");
        String notes       = request.getParameter("notes");

        if (expertId == null || sessionDate == null || sessionTime == null) {
            request.setAttribute("bookingError", "Please complete all required fields.");
            request.getRequestDispatcher("booking.jsp?id=" + expertId).forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO bookings (buyer_id, expert_id, session_type, session_date, "
                       + "session_time, duration_minutes, notes, status, created_at) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, 'PENDING', NOW())";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,    buyerId);
            ps.setInt(2,    Integer.parseInt(expertId));
            ps.setString(3, sessionType);
            ps.setString(4, sessionDate);
            ps.setString(5, sessionTime);
            ps.setInt(6,    duration != null ? Integer.parseInt(duration) : 60);
            ps.setString(7, notes);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("booking-confirmation.jsp?success=true&expertId=" + expertId);
            } else {
                request.setAttribute("bookingError", "Booking failed. Please try again.");
                request.getRequestDispatcher("booking.jsp?id=" + expertId).forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("bookingError", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("booking.jsp?id=" + expertId).forward(request, response);
        } finally {
            DBUtil.close(ps, conn);
        }
    }
}
