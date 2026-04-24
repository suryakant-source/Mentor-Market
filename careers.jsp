<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="pageTitleOverride" value="Careers — MentorMarket" />

<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/content-pages.css">
<style>
  .careers-hero {
    background: var(--navy-deep);
    padding: 140px 48px 80px;
    text-align: center;
  }
  .careers-hero h1 {
    font-family: var(--font-heading);
    font-size: 48px;
    color: var(--white);
  }
  .careers-values {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 24px;
    max-width: 1200px;
    margin: 48px auto 0;
  }
  .careers-value {
    text-align: center;
    padding: 24px;
  }
  .careers-value__icon {
    width: 48px;
    height: 48px;
    margin: 0 auto 16px;
    background: rgba(245,166,35,0.10);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .careers-value__icon svg {
    width: 24px;
    stroke: var(--gold-primary);
  }
  .careers-value h3 {
    font-size: 16px;
    font-weight: 600;
    color: var(--white);
    margin-bottom: 8px;
  }
  .careers-value p {
    font-size: 14px;
    color: rgba(255,255,255,0.70);
  }
  .jobs-section {
    max-width: 900px;
    margin: 0 auto;
    padding: 80px 48px;
  }
  .jobs-section h2 {
    font-family: var(--font-heading);
    font-size: 28px;
    text-align: center;
    margin-bottom: 48px;
  }
  .job-card {
    padding: 24px;
    background: var(--white);
    border: 1px solid var(--gray-200);
    border-radius: var(--radius-xl);
    margin-bottom: 16px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    cursor: pointer;
    transition: all 200ms;
  }
  .job-card:hover {
    border-color: var(--gold-primary);
    box-shadow: var(--shadow-md);
  }
  .job-card__title {
    font-size: 16px;
    font-weight: 600;
    color: var(--gray-800);
    margin-bottom: 4px;
  }
  .job-card__meta {
    font-size: 14px;
    color: var(--gray-500);
  }
  .job-card__tag {
    padding: 6px 12px;
    border-radius: var(--radius-full);
    font-size: 12px;
    font-weight: 600;
    background: rgba(245,166,35,0.10);
    color: var(--gold-primary);
  }
  @media (max-width: 768px) {
    .careers-hero { padding: 120px 24px 40px; }
    .careers-hero h1 { font-size: 32px; }
    .careers-values { grid-template-columns: repeat(2, 1fr); }
    .jobs-section { padding: 40px 24px; }
    .job-card { flex-direction: column; align-items: flex-start; gap: 12px; }
  }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/includes/navbar.jsp" />

  <section class="careers-hero">
    <span class="label-chip label-chip--gold">JOIN OUR TEAM</span>
    <h1>Build the Future of Mentorship</h1>
    <p style="color: rgba(255,255,255,0.70); max-width: 600px; margin: 16px auto 0;">We're building a platform that connects experienced leaders with aspiring entrepreneurs. Come help us make it happen.</p>
    
    <div class="careers-values">
      <div class="careers-value">
        <div class="careers-value__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M12 6v6l4 2"/></svg>
        </div>
        <h3>Impact First</h3>
        <p>Every feature we build helps someone succeed</p>
      </div>
      <div class="careers-value">
        <div class="careers-value__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
        </div>
        <h3>Remote-First</h3>
        <p>Work from anywhere in India</p>
      </div>
      <div class="careers-value">
        <div class="careers-value__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"/></svg>
        </div>
        <h3>Growth Path</h3>
        <p>Clear career progression</p>
      </div>
      <div class="careers-value">
        <div class="careers-value__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
        </div>
        <h3>Competitive</h3>
        <p>Equity + benefits package</p>
      </div>
    </div>
  </section>

  <div class="jobs-section">
    <h2>Open Positions</h2>
    
    <div class="job-card">
      <div>
        <div class="job-card__title">Senior Full Stack Developer</div>
        <div class="job-card__meta">Bangalore · Full-time</div>
      </div>
      <span class="job-card__tag">Engineering</span>
    </div>
    
    <div class="job-card">
      <div>
        <div class="job-card__title">Product Designer</div>
        <div class="job-card__meta">Remote · Full-time</div>
      </div>
      <span class="job-card__tag">Design</span>
    </div>
    
    <div class="job-card">
      <div>
        <div class="job-card__title">Community Lead</div>
        <div class="job-card__meta">Bangalore · Full-time</div>
      </div>
      <span class="job-card__tag">Operations</span>
    </div>
    
    <div class="job-card">
      <div>
        <div class="job-card__title">Business Development Manager</div>
        <div class="job-card__meta">Mumbai · Full-time</div>
      </div>
      <span class="job-card__tag">Sales</span>
    </div>
  </div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

</body>
</html>
