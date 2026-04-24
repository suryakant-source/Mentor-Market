-- ============================================================
-- MentorMarket Database Schema
-- MySQL 8.0+
-- ============================================================

CREATE DATABASE IF NOT EXISTS mentormarket
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE mentormarket;

-- ── Users Table ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS users (
    id               INT AUTO_INCREMENT PRIMARY KEY,
    first_name       VARCHAR(100)  NOT NULL,
    last_name        VARCHAR(100)  NOT NULL,
    email            VARCHAR(255)  NOT NULL UNIQUE,
    password         VARCHAR(255)  NOT NULL,
    phone            VARCHAR(20),
    role             ENUM('BUYER', 'EXPERT', 'ADMIN') NOT NULL DEFAULT 'BUYER',

    -- Buyer-specific fields
    company          VARCHAR(200),
    company_stage    VARCHAR(50),

    -- Expert-specific fields
    linkedin         VARCHAR(500),
    domain           VARCHAR(100),
    years_experience INT,
    job_title        VARCHAR(200),
    bio              TEXT,
    session_types    VARCHAR(200),
    price_per_session INT,
    profile_photo    VARCHAR(500),
    expert_status    ENUM('PENDING', 'APPROVED', 'REJECTED') DEFAULT NULL,
    rating           DECIMAL(3,2)  DEFAULT 0.00,
    review_count     INT           DEFAULT 0,

    created_at       TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_email (email),
    INDEX idx_role  (role)
) ENGINE=InnoDB;

-- ── Bookings Table ──────────────────────────────────────────
CREATE TABLE IF NOT EXISTS bookings (
    id               INT AUTO_INCREMENT PRIMARY KEY,
    buyer_id         INT           NOT NULL,
    expert_id        INT           NOT NULL,
    session_type     VARCHAR(50),
    session_date     DATE          NOT NULL,
    session_time     VARCHAR(20)   NOT NULL,
    duration_minutes INT           DEFAULT 60,
    notes            TEXT,
    status           ENUM('PENDING', 'CONFIRMED', 'COMPLETED', 'CANCELLED') DEFAULT 'PENDING',
    amount           DECIMAL(10,2),
    payment_id       VARCHAR(255),
    created_at       TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (buyer_id)  REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (expert_id) REFERENCES users(id) ON DELETE CASCADE,

    INDEX idx_buyer  (buyer_id),
    INDEX idx_expert (expert_id),
    INDEX idx_date   (session_date)
) ENGINE=InnoDB;

-- ── Contact Messages Table ──────────────────────────────────
CREATE TABLE IF NOT EXISTS contact_messages (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(200)  NOT NULL,
    email      VARCHAR(255)  NOT NULL,
    subject    VARCHAR(100),
    message    TEXT          NOT NULL,
    is_read    BOOLEAN       DEFAULT FALSE,
    created_at TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ── Seed: Admin User ────────────────────────────────────────
INSERT INTO users (first_name, last_name, email, password, role)
VALUES ('Admin', 'MentorMarket', 'admin@mentormarket.com', 'admin123', 'ADMIN')
ON DUPLICATE KEY UPDATE first_name = first_name;

-- ── Seed: Sample Expert ─────────────────────────────────────
INSERT INTO users (first_name, last_name, email, password, phone, role,
                   domain, years_experience, company, job_title, bio,
                   session_types, price_per_session, expert_status, rating, review_count)
VALUES ('Rajesh', 'Kumar', 'rajesh@example.com', 'expert123', '+91 98765 00001', 'EXPERT',
        'Finance', 30, 'Goldman Sachs', 'Vice President',
        'Retired VP from Goldman Sachs with 30+ years in investment banking and corporate finance. Passionate about helping the next generation of entrepreneurs navigate fundraising and financial strategy.',
        'hourly,halfday', 2500, 'APPROVED', 4.90, 45)
ON DUPLICATE KEY UPDATE first_name = first_name;

-- ── Seed: Sample Buyer ──────────────────────────────────────
INSERT INTO users (first_name, last_name, email, password, phone, role,
                   company, company_stage)
VALUES ('Priya', 'Sharma', 'priya@example.com', 'buyer123', '+91 98765 00002', 'BUYER',
        'FinTech Innovations', 'STARTUP')
ON DUPLICATE KEY UPDATE first_name = first_name;
