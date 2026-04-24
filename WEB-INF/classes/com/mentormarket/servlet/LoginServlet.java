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
import java.sql.ResultSet;

/**
 * Handles user login for both Buyers and Experts.
 * 
 * POST /login
 *   Parameters: email, password, userType (BUYER | EXPERT)
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email    = request.getParameter("email");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType"); // BUYER or EXPERT

        if (email == null || password == null || userType == null) {
            request.setAttribute("loginError", "Please fill in all fields.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();

            String sql = "SELECT id, first_name, last_name, email, role, profile_photo, password "
                       + "FROM users WHERE email = ? AND role = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email.trim().toLowerCase());
            ps.setString(2, userType.trim().toUpperCase());
            rs = ps.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");

                // TODO: Replace with BCrypt or similar hash comparison
                if (password.equals(storedPassword)) {
                    // Authentication successful — create session
                    HttpSession session = request.getSession(true);
                    session.setAttribute("userId",       rs.getInt("id"));
                    session.setAttribute("firstName",    rs.getString("first_name"));
                    session.setAttribute("lastName",     rs.getString("last_name"));
                    session.setAttribute("email",        rs.getString("email"));
                    session.setAttribute("userRole",     rs.getString("role"));
                    session.setAttribute("profilePhoto", rs.getString("profile_photo"));

                    // Redirect to the appropriate dashboard
                    String redirect = request.getParameter("redirect");
                    if (redirect != null && !redirect.isEmpty()) {
                        response.sendRedirect(redirect);
                    } else if ("BUYER".equals(userType)) {
                        response.sendRedirect("buyer-dashboard.jsp");
                    } else if ("EXPERT".equals(userType)) {
                        response.sendRedirect("expert-dashboard.jsp");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                    return;
                }
            }

            // Authentication failed
            request.setAttribute("loginError", "Invalid email or password. Please try again.");
            request.getRequestDispatcher("login.jsp?tab=" + userType.toLowerCase())
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("loginError", "An unexpected error occurred. Please try again later.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } finally {
            DBUtil.close(rs, ps, conn);
        }
    }
}
