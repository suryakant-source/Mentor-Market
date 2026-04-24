<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="pageTitleOverride" value="Contact Us — MentorMarket" />

<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/content-pages.css">
<style>
  .contact-hero {
    background: var(--navy-deep);
    padding: 140px 48px 80px;
    text-align: center;
  }
  .contact-hero h1 {
    font-family: var(--font-heading);
    font-size: 48px;
    font-weight: 700;
    color: var(--white);
    margin-bottom: 16px;
  }
  .contact-hero p {
    font-size: 18px;
    color: rgba(255,255,255,0.70);
    max-width: 600px;
    margin: 0 auto;
  }
  .contact-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 64px;
    max-width: 1200px;
    margin: 0 auto;
    padding: 80px 48px;
  }
  .contact-methods {
    display: flex;
    flex-direction: column;
    gap: 24px;
  }
  .contact-method {
    display: flex;
    align-items: flex-start;
    gap: 16px;
    padding: 24px;
    background: var(--white);
    border-radius: var(--radius-xl);
    border: 1px solid var(--gray-200);
  }
  .contact-method__icon {
    width: 48px;
    height: 48px;
    background: rgba(245,166,35,0.10);
    border-radius: var(--radius-lg);
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
  }
  .contact-method__icon svg {
    width: 24px;
    height: 24px;
    stroke: var(--gold-primary);
  }
  .contact-method__content h3 {
    font-size: 16px;
    font-weight: 600;
    color: var(--gray-800);
    margin-bottom: 4px;
  }
  .contact-method__content p {
    font-size: 14px;
    color: var(--gray-600);
  }
  .contact-method__content a {
    font-size: 14px;
    color: var(--gold-primary);
    font-weight: 600;
  }
  .contact-form-container {
    background: var(--white);
    border-radius: var(--radius-xl);
    padding: 40px;
    border: 1px solid var(--gray-200);
  }
  .contact-form-container h2 {
    font-family: var(--font-heading);
    font-size: 24px;
    font-weight: 700;
    margin-bottom: 24px;
  }
  @media (max-width: 768px) {
    .contact-hero { padding: 120px 24px 40px; }
    .contact-hero h1 { font-size: 32px; }
    .contact-grid { grid-template-columns: 1fr; padding: 40px 24px; gap: 40px; }
  }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/includes/navbar.jsp" />

  <section class="contact-hero">
    <span class="label-chip label-chip--gold">GET IN TOUCH</span>
    <h1>We'd Love to Hear From You</h1>
    <p>Whether you're a buyer, an expert, or just curious about our platform, we're here to help.</p>
  </section>

  <div class="contact-grid">
    <div class="contact-methods">
      <div class="contact-method">
        <div class="contact-method__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
            <polyline points="22,6 12,13 2,6"/>
          </svg>
        </div>
        <div class="contact-method__content">
          <h3>Email Us</h3>
          <p>For general inquiries and support</p>
          <a href="mailto:hello@mentormarket.com">hello@mentormarket.com</a>
        </div>
      </div>

      <div class="contact-method">
        <div class="contact-method__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/>
            <circle cx="12" cy="10" r="3"/>
          </svg>
        </div>
        <div class="contact-method__content">
          <h3>Visit Us</h3>
          <p>Our headquarters</p>
          <span>MentorMarket Pvt Ltd<br>Bangalore, Karnataka, India</span>
        </div>
      </div>

      <div class="contact-method">
        <div class="contact-method__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
          </svg>
        </div>
        <div class="contact-method__content">
          <h3>Call Us</h3>
          <p>Mon-Fri, 9am-6pm IST</p>
          <a href="tel:+919876543210">+91 98765 43210</a>
        </div>
      </div>
    </div>

    <div class="contact-form-container">
      <h2>Send Us a Message</h2>
      <form action="contact" method="POST">
        <div class="form-row">
          <div class="form-group">
            <label>Your Name</label>
            <input type="text" name="name" class="form-input" placeholder="Your name" required>
          </div>
        </div>
        <div class="form-group">
          <label>Email Address</label>
          <input type="email" name="email" class="form-input" placeholder="your@email.com" required>
        </div>
        <div class="form-group">
          <label>Subject</label>
          <select name="subject" class="form-input" required>
            <option value="">Select a topic</option>
            <option value="general">General Inquiry</option>
            <option value="buyer">I'm a Buyer</option>
            <option value="expert">I'm an Expert</option>
            <option value="support">Technical Support</option>
            <option value="partnership">Partnership</option>
          </select>
        </div>
        <div class="form-group">
          <label>Message</label>
          <textarea name="message" class="form-input" placeholder="How can we help you?" rows="5" required></textarea>
        </div>
        <button type="submit" class="btn btn--primary" style="width: 100%; height: 52px;">
          Send Message
        </button>
      </form>
    </div>
  </div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

</body>
</html>
