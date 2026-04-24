<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="pageTitleOverride" value="Resources — MentorMarket" />

<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/content-pages.css">
<style>
  .resources-hero {
    background: var(--navy-deep);
    padding: 140px 48px 80px;
    text-align: center;
  }
  .resources-hero h1 {
    font-family: var(--font-heading);
    font-size: 48px;
    color: var(--white);
  }
  .resources-hero p {
    color: rgba(255,255,255,0.70);
    max-width: 600px;
    margin: 0 auto;
  }
  .resources-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 32px;
    max-width: 1400px;
    margin: 0 auto;
    padding: 64px 48px;
  }
  .resource-card {
    background: var(--white);
    border-radius: var(--radius-xl);
    padding: 32px;
    border: 1px solid var(--gray-200);
    transition: all 300ms var(--ease-spring);
  }
  .resource-card:hover {
    border-color: var(--gold-primary);
    transform: translateY(-4px);
  }
  .resource-card__icon {
    width: 56px;
    height: 56px;
    background: rgba(245,166,35,0.10);
    border-radius: var(--radius-lg);
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 20px;
  }
  .resource-card__icon svg {
    width: 28px;
    stroke: var(--gold-primary);
  }
  .resource-card__category {
    font-size: 12px;
    color: var(--gold-primary);
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }
  .resource-card__title {
    font-family: var(--font-heading);
    font-size: 20px;
    font-weight: 600;
    color: var(--gray-800);
    margin: 8px 0 12px;
  }
  .resource-card__desc {
    font-size: 14px;
    color: var(--gray-600);
    line-height: 1.6;
    margin-bottom: 16px;
  }
  .resource-card__download {
    font-size: 14px;
    font-weight: 600;
    color: var(--gold-primary);
  }
  .resource-card__download svg {
    width: 16px;
    display: inline;
    margin-left: 4px;
  }
  @media (max-width: 1200px) {
    .resources-grid { grid-template-columns: repeat(2, 1fr); }
  }
  @media (max-width: 768px) {
    .resources-hero { padding: 120px 24px 40px; }
    .resources-hero h1 { font-size: 32px; }
    .resources-grid { grid-template-columns: 1fr; padding: 40px 24px; }
  }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/includes/navbar.jsp" />

  <section class="resources-hero">
    <span class="label-chip label-chip--gold">FREE RESOURCES</span>
    <h1>Templates, Frameworks & More</h1>
    <p>Everything you need to succeed — completely free. No catch, no signup required.</p>
  </section>

  <div class="resources-grid">
    <div class="resource-card">
      <div class="resource-card__icon">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
      </div>
      <span class="resource-card__category">Financial Model</span>
      <h3 class="resource-card__title">Startup Financial Model Template</h3>
      <p class="resource-card__desc">A comprehensive Excel model with P&L, cash flow, and runway projections. Built by former CFOs.</p>
      <a href="#" class="resource-card__download">Download SVG</a>
    </div>

    <div class="resource-card">
      <div class="resource-card__icon">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"/><line x1="3" y1="9" x2="21" y2="9"/><line x1="9" y1="21" x2="9" y2="9"/></svg>
      </div>
      <span class="resource-card__category">Strategy</span>
      <h3 class="resource-card__title">Board Deck Template</h3>
      <p class="resource-card__desc">The exact structure used to raise ₹50+ Crore. Includes advisor talking points.</p>
      <a href="#" class="resource-card__download">Download SVG</a>
    </div>

    <div class="resource-card">
      <div class="resource-card__icon">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/><rect x="8" y="2" width="8" height="4" rx="1" ry="1"/></svg>
      </div>
      <span class="resource-card__category">HR</span>
      <h3 class="resource-card__title">Compensation Framework</h3>
      <p class="resource-card__desc">Salary bands by role, location, and stage. Updated for 2026 hiring markets.</p>
      <a href="#" class="resource-card__download">Download SVG</a>
    </div>

    <div class="resource-card">
      <div class="resource-card__icon">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="9 11 12 14 22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>
      </div>
      <span class="resource-card__category">Legal</span>
      <h3 class="resource-card__title">Founder Agreement</h3>
      <p class="resource-card__desc">Standard equity split, vesting schedules, and IP assignment. Reviewed by lawyers.</p>
      <a href="#" class="resource-card__download">Download SVG</a>
    </div>

    <div class="resource-card">
      <div class="resource-card__icon">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
      </div>
      <span class="resource-card__category">Operations</span>
      <h3 class="resource-card__title">OKR Starter Kit</h3>
      <p class="resource-card__desc">Set up Objectives and Key Results for your team in minutes. Includes templates.</p>
      <a href="#" class="resource-card__download">Download SVG</a>
    </div>

    <div class="resource-card">
      <div class="resource-card__icon">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
      </div>
      <span class="resource-card__category">Video</span>
      <h3 class="resource-card__title">Expert Masterclass Series</h3>
      <p class="resource-card__desc">Free video masterclasses from top experts on scaling, fundraising, and leadership.</p>
      <a href="#" class="resource-card__download">Watch Now SVG</a>
    </div>
  </div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

</body>
</html>
