<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="pageTitleOverride" value="Careers — MentorMarket" />
<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/content-pages.css">
<link rel="stylesheet" href="css/careers.css">
<style>
  .job-detail-hero {
    background: var(--navy-deep);
    padding: 140px 48px 60px;
  }
  .job-detail-hero__back {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    color: rgba(255,255,255,0.60);
    font-size: 14px;
    margin-bottom: 32px;
    transition: color 200ms ease;
  }
  .job-detail-hero__back:hover { color: var(--gold-primary); }
  .job-detail-hero h1 {
    font-family: var(--font-heading);
    font-size: 40px;
    font-weight: 700;
    color: var(--white);
    margin-bottom: 20px;
  }
  .job-detail-hero__chips {
    display: flex;
    gap: 12px;
    flex-wrap: wrap;
  }
  .job-detail-chip {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 8px 16px;
    border: 1px solid rgba(255,255,255,0.20);
    border-radius: var(--radius-full);
    font-size: 13px;
    color: var(--white);
  }
  .job-detail-chip svg { width: 14px; height: 14px; }
  .job-detail-chip--salary {
    border-color: var(--gold-primary);
    color: var(--gold-primary);
    font-weight: 600;
  }
  .job-detail-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 64px 48px;
    display: grid;
    grid-template-columns: 1fr 380px;
    gap: 64px;
  }
  .job-section { margin-bottom: 48px; }
  .job-section h2 {
    font-family: var(--font-heading);
    font-size: 24px;
    font-weight: 700;
    color: var(--gray-800);
    margin-bottom: 20px;
    padding-bottom: 12px;
    border-bottom: 2px solid var(--gold-primary);
  }
  .job-section p {
    font-size: 16px;
    color: var(--gray-600);
    line-height: 1.8;
    margin-bottom: 16px;
  }
  .job-section ul {
    padding: 0;
    margin: 0;
    list-style: none;
  }
  .job-section li {
    font-size: 16px;
    color: var(--gray-600);
    line-height: 1.7;
    margin-bottom: 12px;
    padding-left: 28px;
    position: relative;
  }
  .job-section li::before {
    content: '';
    position: absolute;
    left: 0;
    top: 8px;
    width: 8px;
    height: 8px;
    background: var(--gold-primary);
    border-radius: 50%;
    transform: rotate(45deg);
  }
  .must-have li::before { background: var(--gold-primary); }
  .nice-to-have li::before {
    background: transparent;
    border: 2px solid var(--gold-primary);
    border-radius: 0;
    transform: none;
    top: 6px;
    width: 10px;
    height: 10px;
  }
  .job-tech-cloud {
    display: flex;
    gap: 12px;
    flex-wrap: wrap;
  }
  .job-tech-tag {
    padding: 8px 16px;
    background: var(--cream);
    border-radius: var(--radius-full);
    font-size: 14px;
    color: var(--gray-700);
    font-weight: 500;
  }
  .interview-timeline {
    position: relative;
    padding-left: 32px;
  }
  .interview-timeline::before {
    content: '';
    position: absolute;
    left: 7px;
    top: 0;
    bottom: 0;
    width: 2px;
    background: var(--gray-200);
  }
  .interview-step {
    position: relative;
    margin-bottom: 32px;
  }
  .interview-step::before {
    content: '';
    position: absolute;
    left: -28px;
    top: 4px;
    width: 16px;
    height: 16px;
    background: var(--gold-primary);
    border-radius: 50%;
  }
  .interview-step__title {
    font-size: 16px;
    font-weight: 600;
    color: var(--gray-800);
    margin-bottom: 4px;
  }
  .interview-step__desc {
    font-size: 14px;
    color: var(--gray-500);
  }
  .job-sidebar {
    position: sticky;
    top: 88px;
    height: fit-content;
  }
  .apply-panel {
    background: var(--white);
    border: 2px solid var(--gray-200);
    border-radius: var(--radius-xl);
    padding: 32px;
  }
  .apply-panel h3 {
    font-family: var(--font-heading);
    font-size: 24px;
    font-weight: 700;
    color: var(--gray-800);
    margin-bottom: 24px;
  }
  .apply-panel .form-group { margin-bottom: 16px; }
  .apply-panel input,
  .apply-panel textarea {
    width: 100%;
    padding: 12px 16px;
    border: 1.5px solid var(--gray-300);
    border-radius: var(--radius-md);
    font-size: 15px;
    font-family: var(--font-body);
    transition: border-color 200ms ease;
  }
  .apply-panel input:focus,
  .apply-panel textarea:focus {
    outline: none;
    border-color: var(--gold-primary);
  }
  .apply-panel textarea {
    min-height: 120px;
    resize: vertical;
  }
  .apply-panel .form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 12px;
  }
  .apply-panel .char-count {
    font-size: 12px;
    color: var(--gray-400);
    text-align: right;
    margin-bottom: 4px;
  }
  .apply-panel .file-upload {
    position: relative;
    border: 2px dashed var(--gray-300);
    border-radius: var(--radius-lg);
    padding: 32px;
    text-align: center;
    cursor: pointer;
    transition: all 200ms ease;
  }
  .apply-panel .file-upload:hover {
    border-color: var(--gold-primary);
    background: var(--cream);
  }
  .apply-panel .file-upload input {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    opacity: 0;
    cursor: pointer;
  }
  .apply-panel .file-upload__icon {
    width: 40px;
    height: 40px;
    margin: 0 auto 12px;
    background: var(--gold-pale);
    border-radius: var(--radius-full);
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .apply-panel .file-upload__icon svg {
    width: 20px;
    height: 20px;
    color: var(--gold-primary);
  }
  .apply-panel .file-upload__text {
    font-size: 14px;
    color: var(--gray-600);
  }
  .apply-panel .file-upload__text strong { color: var(--gold-primary); }
  .apply-panel .file-upload__hint {
    font-size: 12px;
    color: var(--gray-400);
    margin-top: 8px;
  }
  .apply-panel .submit-btn {
    width: 100%;
    margin-top: 16px;
  }
  .apply-panel__note {
    font-size: 13px;
    color: var(--gray-500);
    text-align: center;
    margin-top: 16px;
    line-height: 1.6;
  }
  @media (max-width: 1024px) {
    .job-detail-content { grid-template-columns: 1fr; gap: 48px; }
    .job-sidebar { position: static; }
  }
  @media (max-width: 768px) {
    .job-detail-hero { padding: 120px 24px 40px; }
    .job-detail-hero h1 { font-size: 28px; }
    .job-detail-content { padding: 40px 24px; }
    .apply-panel .form-row { grid-template-columns: 1fr; }
  }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/includes/navbar.jsp" />

<section class="job-detail-hero">
  <a href="careers.jsp" class="job-detail-hero__back">
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="15 18 9 12 15 6"/></svg>
    All Open Positions
  </a>
  <h1>${currentJob.title}</h1>
  <div class="job-detail-hero__chips">
    <span class="job-detail-chip">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg>
      ${currentJob.location}
    </span>
    <span class="job-detail-chip">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
      ${currentJob.type}
    </span>
    <span class="job-detail-chip">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/></svg>
      ${currentJob.experience}
    </span>
    <span class="job-detail-chip job-detail-chip--salary">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
      ${currentJob.salary}
    </span>
  </div>
</section>

<div class="job-detail-content">
  <div class="job-detail-main">
    <div class="job-section">
      <h2>About This Role</h2>
      <p>${currentJob.about1}</p>
      <p>${currentJob.about2}</p>
    </div>

    <div class="job-section">
      <h2>What You'll Do</h2>
      <ul>
        <c:forEach items="${currentJob.responsibilities}" var="resp">
          <li>${resp}</li>
        </c:forEach>
      </ul>
    </div>

    <div class="job-section">
      <h2>What We're Looking For</h2>
      <ul class="must-have">
        <c:forEach items="${currentJob.mustHave}" var="req">
          <li>${req}</li>
        </c:forEach>
      </ul>
    </div>

    <div class="job-section">
      <h2>Nice to Have</h2>
      <ul class="nice-to-have">
        <c:forEach items="${currentJob.niceToHave}" var="nice">
          <li>${nice}</li>
        </c:forEach>
      </ul>
    </div>

    <div class="job-section">
      <h2>Tech Stack & Tools</h2>
      <div class="job-tech-cloud">
        <c:forEach items="${currentJob.tags}" var="tag">
          <span class="job-tech-tag">${tag}</span>
        </c:forEach>
      </div>
    </div>

    <div class="job-section">
      <h2>The Interview Process</h2>
      <div class="interview-timeline">
        <div class="interview-step">
          <div class="interview-step__title">1. Application Review</div>
          <div class="interview-step__desc">We read every application personally. You'll hear back within 3 business days.</div>
        </div>
        <div class="interview-step">
          <div class="interview-step__title">2. Intro Call (30 min)</div>
          <div class="interview-step__desc">A casual conversation with our head of engineering to understand your background and motivation.</div>
        </div>
        <div class="interview-step">
          <div class="interview-step__title">3. Take-Home Task</div>
          <div class="interview-step__desc">A real-world coding task that reflects the kind of work you'd do here. Takes 2–4 hours.</div>
        </div>
        <div class="interview-step">
          <div class="interview-step__title">4. Technical Interview (60 min)</div>
          <div class="interview-step__desc">Live pair programming session. We'll build on the take-home task together.</div>
        </div>
        <div class="interview-step">
          <div class="interview-step__title">5. Culture Fit (30 min)</div>
          <div class="interview-step__desc">Meet with two team members. We want to know you, not just your skills.</div>
        </div>
        <div class="interview-step">
          <div class="interview-step__title">6. Offer</div>
          <div class="interview-step__desc">We make decisions quickly. Expect an offer within 48 hours of your final interview.</div>
        </div>
      </div>
    </div>
  </div>

  <aside class="job-sidebar">
    <div class="apply-panel">
      <h3>Apply for This Role</h3>
      <form action="careers-single.jsp" method="post" enctype="multipart/form-data">
        <input type="hidden" name="jobId" value="${currentJob.id}">
        <div class="form-row">
          <div class="form-group">
            <input type="text" name="firstName" placeholder="First Name" required>
          </div>
          <div class="form-group">
            <input type="text" name="lastName" placeholder="Last Name" required>
          </div>
        </div>
        <div class="form-group">
          <input type="email" name="email" placeholder="Email Address" required>
        </div>
        <div class="form-group">
          <input type="tel" name="phone" placeholder="Phone Number">
        </div>
        <div class="form-group">
          <input type="url" name="linkedin" placeholder="LinkedIn URL">
        </div>
        <div class="form-group">
          <textarea name="coverLetter" placeholder="Why do you want to work at MentorMarket?" rows="4" required minlength="100"></textarea>
          <div class="char-count">0/100 min</div>
        </div>
        <div class="form-group">
          <div class="file-upload">
            <input type="file" name="resume" accept=".pdf,.doc,.docx">
            <div class="file-upload__icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg>
            </div>
            <div class="file-upload__text"><strong>Upload Resume</strong> or drag and drop</div>
            <div class="file-upload__hint">PDF, DOC up to 5MB</div>
          </div>
        </div>
        <button type="submit" class="btn btn--primary submit-btn">Submit Application</button>
        <p class="apply-panel__note">We read every application personally. You'll hear from us within 5 business days regardless of the outcome.</p>
      </form>
    </div>
  </aside>
</div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

</body>
</html>
