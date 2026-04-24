<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="pageTitleOverride" value="Expert FAQ — MentorMarket" />

<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/content-pages.css">
<style>
  .faq-hero {
    background: var(--navy-deep);
    padding: 140px 48px 80px;
    text-align: center;
  }
  .faq-hero h1 {
    font-family: var(--font-heading);
    font-size: 48px;
    color: var(--white);
    margin-bottom: 16px;
  }
  .faq-hero p {
    color: rgba(255,255,255,0.70);
    max-width: 600px;
    margin: 0 auto;
  }
  .faq-categories {
    display: flex;
    gap: 12px;
    justify-content: center;
    margin-top: 32px;
    flex-wrap: wrap;
  }
  .faq-cat-pill {
    padding: 10px 20px;
    border-radius: var(--radius-full);
    background: rgba(255,255,255,0.10);
    color: var(--white);
    font-size: 14px;
    cursor: pointer;
    border: 1px solid rgba(255,255,255,0.20);
  }
  .faq-cat-pill.active {
    background: var(--gold-primary);
    color: var(--navy-deep);
    border-color: var(--gold-primary);
  }
  .faq-layout {
    max-width: 900px;
    margin: 0 auto;
    padding: 80px 48px;
  }
  .faq-section-title {
    font-family: var(--font-heading);
    font-size: 24px;
    font-weight: 700;
    margin-bottom: 24px;
    padding-bottom: 16px;
    border-bottom: 2px solid var(--gray-200);
  }
  .faq-item {
    border-bottom: 1px solid var(--gray-200);
  }
  .faq-question {
    width: 100%;
    text-align: left;
    padding: 24px 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: none;
    border: none;
    cursor: pointer;
  }
  .faq-question h3 {
    font-size: 16px;
    font-weight: 600;
    color: var(--gray-800);
    flex: 1;
  }
  .faq-question svg {
    width: 20px;
    height: 20px;
    stroke: var(--gray-400);
    flex-shrink: 0;
    transition: transform 300ms;
  }
  .faq-answer {
    padding: 0 0 24px;
    font-size: 15px;
    color: var(--gray-600);
    line-height: 1.7;
    display: none;
  }
  .faq-item.active .faq-answer {
    display: block;
  }
  .faq-item.active .faq-question svg {
    transform: rotate(180deg);
  }
  @media (max-width: 768px) {
    .faq-hero { padding: 120px 24px 40px; }
    .faq-hero h1 { font-size: 32px; }
    .faq-layout { padding: 40px 24px; }
  }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/includes/navbar.jsp" />

  <section class="faq-hero">
    <span class="label-chip label-chip--gold">FREQUENTLY ASKED QUESTIONS</span>
    <h1>Everything You Need to Know</h1>
    <p>Find answers to common questions about joining MentorMarket as an expert.</p>
    <div class="faq-categories">
      <button class="faq-cat-pill active" data-cat="getting-started">Getting Started</button>
      <button class="faq-cat-pill" data-cat="payments">Payments</button>
      <button class="faq-cat-pill" data-cat="sessions">Sessions</button>
      <button class="faq-cat-pill" data-cat="verification">Verification</button>
    </div>
  </section>

  <div class="faq-layout">
    <h2 class="faq-section-title">Getting Started</h2>
    
    <div class="faq-item">
      <button class="faq-question">
        <h3>Who can become an expert on MentorMarket?</h3>
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg>
      </button>
      <div class="faq-answer">
        <p>MentorMarket is designed for retired or transitioning professionals with 15+ years of experience in their field. This includes C-suite executives, directors, senior managers, and industry specialists who want to share their knowledge with the next generation of business leaders.</p>
      </div>
    </div>
    
    <div class="faq-item">
      <button class="faq-question">
        <h3>How does the verification process work?</h3>
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg>
      </button>
      <div class="faq-answer">
        <p>After you submit your application, our team reviews your credentials, verifies your employment history, and checks references. This typically takes 3-5 business days. We want to ensure every expert on our platform is genuinely qualified.</p>
      </div>
    </div>
    
    <div class="faq-item">
      <button class="faq-question">
        <h3>What if I'm still working but want to mentor part-time?</h3>
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg>
      </button>
      <div class="faq-answer">
        <p>That's welcome! We call these "transitioning" experts. You can set your availability to evenings and weekends, or just a few hours per week. Many of our most popular experts are still working full-time but mentor on the side.</p>
      </div>
    </div>

    <h2 class="faq-section-title" style="margin-top: 48px;">Payments</h2>
    
    <div class="faq-item">
      <button class="faq-question">
        <h3>How do I get paid?</h3>
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg>
      </button>
      <div class="faq-answer">
        <p>Payments are processed via Razorpay directly to your bank account within 48 hours of completing a session. You can withdraw funds weekly or set up automatic transfers.</p>
      </div>
    </div>
    
    <div class="faq-item">
      <button class="faq-question">
        <h3>What percentage does MentorMarket take?</h3>
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg>
      </button>
      <div class="faq-answer">
        <p>We charge buyers a platform fee, not experts. Your displayed rate is what you keep. We're funded separately and focused on maximizing expert earnings.</p>
      </div>
    </div>
  </div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

  <script src="js/main.js"></script>
</body>
</html>
