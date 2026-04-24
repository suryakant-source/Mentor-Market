package com.mentormarket.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Database utility class for MentorMarket.
 * 
 * Configure your database connection parameters below.
 * Supports MySQL by default — change the driver and URL for other databases.
 */
public class DBUtil {

    // ── Database Configuration ─────────────────────────────────────
    // TODO: Update these values for your environment
    private static final String DRIVER   = "com.mysql.cj.jdbc.Driver";
    private static final String URL      = "jdbc:mysql://localhost:3306/mentormarket?useSSL=false&serverTimezone=Asia/Kolkata&allowPublicKeyRetrieval=true";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";  // Change this!

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            System.err.println("[MentorMarket] JDBC Driver not found: " + DRIVER);
            e.printStackTrace();
        }
    }

    /**
     * Get a new database connection.
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    /**
     * Safely close a ResultSet, PreparedStatement, and Connection.
     */
    public static void close(ResultSet rs, PreparedStatement ps, Connection conn) {
        try { if (rs   != null) rs.close();   } catch (SQLException ignored) {}
        try { if (ps   != null) ps.close();   } catch (SQLException ignored) {}
        try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
    }

    /**
     * Safely close a PreparedStatement and Connection.
     */
    public static void close(PreparedStatement ps, Connection conn) {
        close(null, ps, conn);
    }
}
