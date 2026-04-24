package com.mentormarket.servlet;

import com.mentormarket.util.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Handles multi-step expert registration.
 * POST /register-expert
 */
public class RegisterExpertServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads/photos";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);

        String action      = request.getParameter("action");
        String currentStep = request.getParameter("currentStep");
        int step = 1;
        try { step = Integer.parseInt(currentStep); } catch (Exception ignored) {}

        // Handle "back" navigation
        if ("back".equals(action)) {
            response.sendRedirect("register-expert.jsp?currentStep=" + (step - 1));
            return;
        }

        Map<String, String> errors = new HashMap<>();

        if (step == 1) {
            // Validate & save Step 1 fields in session
            String firstName = request.getParameter("firstName");
            String lastName  = request.getParameter("lastName");
            String email     = request.getParameter("email");
            String password  = request.getParameter("password");
            String phone     = request.getParameter("phone");
            String linkedin  = request.getParameter("linkedin");

            if (firstName == null || firstName.trim().isEmpty()) errors.put("firstName", "Required.");
            if (lastName == null  || lastName.trim().isEmpty())  errors.put("lastName", "Required.");
            if (email == null     || email.trim().isEmpty())     errors.put("email", "Required.");
            if (password == null  || password.length() < 8)      errors.put("password", "Min 8 characters.");
            if (phone == null     || phone.trim().isEmpty())     errors.put("phone", "Required.");

            if (!errors.isEmpty()) {
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("register-expert.jsp?currentStep=1").forward(request, response);
                return;
            }

            // Check duplicate email
            try (Connection conn = DBUtil.getConnection();
                 PreparedStatement ps = conn.prepareStatement("SELECT id FROM users WHERE email = ?")) {
                ps.setString(1, email.trim().toLowerCase());
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    errors.put("email", "An account with this email already exists.");
                    request.setAttribute("errors", errors);
                    request.getRequestDispatcher("register-expert.jsp?currentStep=1").forward(request, response);
                    return;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            session.setAttribute("reg_firstName", firstName.trim());
            session.setAttribute("reg_lastName",  lastName.trim());
            session.setAttribute("reg_email",     email.trim().toLowerCase());
            session.setAttribute("reg_password",  password);
            session.setAttribute("reg_phone",     phone.trim());
            session.setAttribute("reg_linkedin",  linkedin != null ? linkedin.trim() : "");

            response.sendRedirect("register-expert.jsp?currentStep=2");

        } else if (step == 2) {
            String domain          = request.getParameter("domain");
            String yearsExperience = request.getParameter("yearsExperience");
            String company         = request.getParameter("company");
            String jobTitle        = request.getParameter("jobTitle");
            String bio             = request.getParameter("bio");

            if (domain == null || domain.trim().isEmpty())            errors.put("domain", "Required.");
            if (yearsExperience == null || yearsExperience.isEmpty()) errors.put("yearsExperience", "Required.");
            if (company == null || company.trim().isEmpty())          errors.put("company", "Required.");
            if (jobTitle == null || jobTitle.trim().isEmpty())        errors.put("jobTitle", "Required.");
            if (bio == null || bio.trim().length() < 50)             errors.put("bio", "Min 50 characters.");

            if (!errors.isEmpty()) {
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("register-expert.jsp?currentStep=2").forward(request, response);
                return;
            }

            session.setAttribute("reg_domain",          domain.trim());
            session.setAttribute("reg_yearsExperience", yearsExperience);
            session.setAttribute("reg_company",         company.trim());
            session.setAttribute("reg_jobTitle",        jobTitle.trim());
            session.setAttribute("reg_bio",             bio.trim());

            response.sendRedirect("register-expert.jsp?currentStep=3");

        } else if (step == 3 && "submit".equals(action)) {
            // Final submission
            String[] sessionTypes  = request.getParameterValues("sessionTypes");
            String pricePerSession = request.getParameter("pricePerSession");

            if (sessionTypes == null || sessionTypes.length == 0) errors.put("sessionTypes", "Select at least one.");
            if (pricePerSession == null || pricePerSession.isEmpty()) errors.put("pricePerSession", "Required.");

            if (!errors.isEmpty()) {
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("register-expert.jsp?currentStep=3").forward(request, response);
                return;
            }

            // Handle photo upload
            String photoPath = null;
            try {
                Part photoPart = request.getPart("profilePhoto");
                if (photoPart != null && photoPart.getSize() > 0) {
                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                    new File(uploadPath).mkdirs();
                    String ext = photoPart.getSubmittedFileName()
                            .substring(photoPart.getSubmittedFileName().lastIndexOf('.'));
                    String filename = UUID.randomUUID() + ext;
                    photoPart.write(uploadPath + File.separator + filename);
                    photoPath = UPLOAD_DIR + "/" + filename;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            // Save to database
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                conn = DBUtil.getConnection();
                String sql = "INSERT INTO users (first_name, last_name, email, password, phone, "
                           + "linkedin, domain, years_experience, company, job_title, bio, "
                           + "session_types, price_per_session, profile_photo, role, expert_status, created_at) "
                           + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'EXPERT', 'PENDING', NOW())";
                ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                ps.setString(1,  (String) session.getAttribute("reg_firstName"));
                ps.setString(2,  (String) session.getAttribute("reg_lastName"));
                ps.setString(3,  (String) session.getAttribute("reg_email"));
                ps.setString(4,  (String) session.getAttribute("reg_password")); // TODO: Hash
                ps.setString(5,  (String) session.getAttribute("reg_phone"));
                ps.setString(6,  (String) session.getAttribute("reg_linkedin"));
                ps.setString(7,  (String) session.getAttribute("reg_domain"));
                ps.setInt(8, Integer.parseInt((String) session.getAttribute("reg_yearsExperience")));
                ps.setString(9,  (String) session.getAttribute("reg_company"));
                ps.setString(10, (String) session.getAttribute("reg_jobTitle"));
                ps.setString(11, (String) session.getAttribute("reg_bio"));
                ps.setString(12, String.join(",", sessionTypes));
                ps.setInt(13,    Integer.parseInt(pricePerSession));
                ps.setString(14, photoPath);

                int rows = ps.executeUpdate();

                if (rows > 0) {
                    rs = ps.getGeneratedKeys();
                    if (rs.next()) {
                        int userId = rs.getInt(1);
                        // Clean up registration session vars
                        clearRegSession(session);
                        // Auto-login
                        session.setAttribute("userId",       userId);
                        session.setAttribute("firstName",    session.getAttribute("reg_firstName"));
                        session.setAttribute("userRole",     "EXPERT");
                        session.setAttribute("expertStatus", "PENDING");
                        response.sendRedirect("expert-dashboard.jsp");
                        return;
                    }
                }
                request.setAttribute("errorMessage", "Registration failed.");
                request.getRequestDispatcher("register-expert.jsp?currentStep=3").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error: " + e.getMessage());
                request.getRequestDispatcher("register-expert.jsp?currentStep=3").forward(request, response);
            } finally {
                DBUtil.close(rs, ps, conn);
            }
        }
    }

    private void clearRegSession(HttpSession session) {
        String[] keys = {"reg_firstName","reg_lastName","reg_email","reg_password",
                         "reg_phone","reg_linkedin","reg_domain","reg_yearsExperience",
                         "reg_company","reg_jobTitle","reg_bio","reg_sessionTypes","reg_pricePerSession"};
        for (String k : keys) session.removeAttribute(k);
    }
}
