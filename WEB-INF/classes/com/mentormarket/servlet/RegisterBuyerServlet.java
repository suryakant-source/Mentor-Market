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
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

/**
 * Handles buyer registration.
 * 
 * POST /register-buyer
 *   Parameters: firstName, lastName, email, password, phone, company, companyStage
 */
public class RegisterBuyerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String firstName    = request.getParameter("firstName");
        String lastName     = request.getParameter("lastName");
        String email        = request.getParameter("email");
        String password     = request.getParameter("password");
        String phone        = request.getParameter("phone");
        String company      = request.getParameter("company");
        String companyStage = request.getParameter("companyStage");

        // ── Validation ──────────────────────────────────────────────
        Map<String, String> errors = new HashMap<>();

        if (firstName == null || firstName.trim().isEmpty())
            errors.put("firstName", "First name is required.");
        if (lastName == null || lastName.trim().isEmpty())
            errors.put("lastName", "Last name is required.");
        if (email == null || email.trim().isEmpty())
            errors.put("email", "Email is required.");
        if (password == null || password.length() < 8)
            errors.put("password", "Password must be at least 8 characters.");
        if (phone == null || phone.trim().isEmpty())
            errors.put("phone", "Phone number is required.");

        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("register-buyer.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();

            // Check if email already exists
            ps = conn.prepareStatement("SELECT id FROM users WHERE email = ?");
            ps.setString(1, email.trim().toLowerCase());
            rs = ps.executeQuery();

            if (rs.next()) {
                errors.put("email", "An account with this email already exists.");
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("register-buyer.jsp").forward(request, response);
                return;
            }
            DBUtil.close(rs, ps, null); // close only rs and ps, reuse conn

            // Insert new buyer
            String sql = "INSERT INTO users (first_name, last_name, email, password, phone, company, company_stage, role, created_at) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, 'BUYER', NOW())";
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, firstName.trim());
            ps.setString(2, lastName.trim());
            ps.setString(3, email.trim().toLowerCase());
            ps.setString(4, password); // TODO: Hash this
            ps.setString(5, phone.trim());
            ps.setString(6, company != null ? company.trim() : null);
            ps.setString(7, companyStage);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int userId = rs.getInt(1);

                    // Auto-login after registration
                    HttpSession session = request.getSession(true);
                    session.setAttribute("userId",    userId);
                    session.setAttribute("firstName",  firstName.trim());
                    session.setAttribute("lastName",   lastName.trim());
                    session.setAttribute("email",      email.trim().toLowerCase());
                    session.setAttribute("userRole",   "BUYER");

                    response.sendRedirect("buyer-dashboard.jsp");
                    return;
                }
            }

            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            request.getRequestDispatcher("register-buyer.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("register-buyer.jsp").forward(request, response);
        } finally {
            DBUtil.close(rs, ps, conn);
        }
    }
}
