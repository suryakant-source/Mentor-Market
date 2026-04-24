package com.mentormarket.servlet;

import com.mentormarket.util.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Handles the contact form submission.
 * POST /contact
 */
public class ContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name    = request.getParameter("name");
        String email   = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        if (name == null || email == null || subject == null || message == null
                || name.trim().isEmpty() || email.trim().isEmpty()
                || subject.trim().isEmpty() || message.trim().isEmpty()) {
            request.setAttribute("contactError", "Please fill in all fields.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO contact_messages (name, email, subject, message, created_at) "
                       + "VALUES (?, ?, ?, ?, NOW())";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name.trim());
            ps.setString(2, email.trim().toLowerCase());
            ps.setString(3, subject.trim());
            ps.setString(4, message.trim());
            ps.executeUpdate();

            response.sendRedirect("contact.jsp?success=true");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("contactError", "Failed to send message. Please try again.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        } finally {
            DBUtil.close(ps, conn);
        }
    }
}
