<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="pageTitleOverride" value="Success Stories — MentorMarket" />

<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/content-pages.css">
<style>
  .stories-hero {
    background: var(--navy-deep);
    background-image: radial-gradient(ellipse at 50% 0%, rgba(245,166,35,0.12) 0%, transparent 70%);
    padding: 140px 48px 60px;
    text-align: center;
  }
  .stories-hero h1 {
    font-family: var(--font-heading);
    font-size: 52px;
    font-weight: 700;
    color: var(--white);
    margin-bottom: 16px;
  }
  .stories-hero .hero-subtitle {
    font-size: 18px;
    color: rgba(255, 255, 255, 0.70);
    max-width: 600px;
    margin: 0 auto 40px;
  }
  .impact-number .number {
    font-family: var(--font-heading);
    font-size: 36px;
    font-weight: 700;
    color: var(--gold-primary);
  }
  .impact-number .label {
    font-size: 14px;
    color: var(--gray-400);
  }
  .impact-numbers {
    display: flex;
    justify-content: center;
    gap: 64px;
    margin-bottom: 40px;
  }
  .filter-pills {
    display: flex;
    gap: 12px;
    overflow-x: auto;
    flex: 1;
  }
  .filter-pill {
    padding: 10px 20px;
    border-radius: var(--radius-full);
    font-size: 14px;
    font-weight: 500;
    white-space: nowrap;
    cursor: pointer;
    border: 1px solid var(--gray-200);
    background: var(--white);
    color: var(--gray-600);
  }
  .filter-pill.active {
    background: var(--gold-primary);
    border-color: var(--gold-primary);
    color: var(--navy-deep);
  }
  .filter-bar {
    background: var(--white);
    padding: 24px 48px;
    border-bottom: 1px solid var(--gray-200);
    display: flex;
    align-items: center;
    gap: 24px;
  }
  .stories-layout {
    display: grid;
    grid-template-columns: 1fr 320px;
    gap: 48px;
    max-width: 1400px;
    margin: 0 auto;
    padding: 48px;
  }
  .stories-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 32px;
  }
  .impact-chip {
    padding: 10px 16px;
    border: 1px solid var(--gold-primary);
    border-radius: var(--radius-md);
    font-size: 13px;
    font-weight: 600;
    color: var(--gold-primary);
    background: transparent;
  }
  .featured-story {
    grid-column: 1 / -1;
    background: var(--navy-deep);
    border-radius: var(--radius-xl);
    overflow: hidden;
    display: grid;
    grid-template-columns: 60% 40%;
    border: 1px solid rgba(245,166,35,0.30);
    margin-bottom: 48px;
  }
  .featured-story h2 {
    font-family: var(--font-heading);
    font-size: 32px;
    font-weight: 700;
    color: var(--white);
  }
  .featured-story__excerpt {
    font-size: 16px;
    color: rgba(255, 255, 255, 0.70);
  }
  .stories-sidebar {
    position: sticky;
    top: 88px;
    height: fit-content;
  }
  .sidebar-card {
    background: var(--navy-deep);
    border-radius: var(--radius-xl);
    padding: 28px;
    margin-bottom: 24px;
  }
  .sidebar-card h3 {
    font-size: 16px;
    font-weight: 700;
    color: var(--white);
    margin-bottom: 20px;
  }
  .sidebar-card--white {
    background: var(--white);
    border: 1px solid var(--gray-200);
  }
  .sidebar-card--white h3 {
    color: var(--gray-800);
  }
  .platform-stats {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
  }
  .platform-stat .number {
    font-family: var(--font-heading);
    font-size: 24px;
    font-weight: 700;
    color: var(--gold-primary);
  }
  .platform-stat .label {
    font-size: 12px;
    color: var(--gray-400);
  }
  @media (max-width: 1200px) {
    .stories-grid { grid-template-columns: repeat(2, 1fr); }
    .stories-layout { grid-template-columns: 1fr; }
    .stories-sidebar { display: none; }
  }
  @media (max-width: 768px) {
    .stories-hero { padding: 120px 24px 40px; }
    .stories-hero h1 { font-size: 32px; }
    .impact-numbers { flex-direction: column; gap: 24px; }
    .filter-bar { padding: 16px 24px; }
    .stories-layout { padding: 24px; }
    .featured-story { grid-template-columns: 1fr; }
    .stories-grid { grid-template-columns: 1fr; }
  }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/includes/navbar.jsp" />

  <section class="stories-hero">
    <span class="label-chip label-chip--gold">REAL RESULTS, REAL PEOPLE</span>
    <h1>When Experience Meets Opportunity</h1>
    <p class="hero-subtitle">Every session on MentorMarket is a story. Here are some of the ones our experts and buyers wanted to share.</p>
    <div class="impact-numbers">
      <div class="impact-number">
        <span class="number">₹24 Cr</span>
        <span class="label">in client value created</span>
      </div>
      <div class="impact-number">
        <span class="number">340+</span>
        <span class="label">Success Stories</span>
      </div>
      <div class="impact-number">
        <span class="number">98%</span>
        <span class="label">Would Recommend</span>
      </div>
    </div>
  </section>

  <div class="filter-bar">
    <div class="filter-pills">
      <button class="filter-pill active" data-category="all">All Stories</button>
      <button class="filter-pill" data-category="finance">Finance & Fundraising</button>
      <button class="filter-pill" data-category="operations">Operations</button>
      <button class="filter-pill" data-category="legal">Legal & Compliance</button>
      <button class="filter-pill" data-category="healthcare">Healthcare</button>
      <button class="filter-pill" data-category="technology">Technology</button>
      <button class="filter-pill" data-category="hr">HR & Culture</button>
      <button class="filter-pill" data-category="sales">Sales Growth</button>
    </div>
  </div>

  <div class="stories-layout">
    <div class="stories-main">
      <div class="featured-story">
        <div class="featured-story__image">
          <img src="assets/success-stories/featured.jpg" alt="Featured success story" onerror="this.style.display='none'">
        </div>
        <div class="featured-story__content">
          <span class="featured-story__badge">Featured</span>
          <h2>How a Retired CFO Helped a Mumbai Startup Raise ₹8 Crore in 60 Days</h2>
          <p class="featured-story__excerpt">When Priya Sharma's fintech startup needed capital to scale, she connected with Rajesh Kumar, a retired CFO who had led finance at three unicorn startups. His guidance on investor pitch decks and financial modeling changed everything.</p>
          <div class="featured-story__chips">
            <span class="impact-chip">₹8 Crore Raised</span>
            <span class="impact-chip">60 Days</span>
            <span class="impact-chip">Series A Closed</span>
          </div>
          <a href="success-stories-single.jsp?id=featured" class="btn btn--primary">Read the Full Story</a>
        </div>
      </div>

      <div class="stories-grid">
        <c:if test="${not empty successStories}">
          <c:forEach var="story" items="${successStories}">
            <div class="story-card">
              <div class="story-card__image">
                <c:if test="${not empty story.imageUrl}">
                  <img src="${story.imageUrl}" alt="${story.title}">
                </c:if>
                <span class="story-card__domain-badge">${story.category}</span>
              </div>
              <div class="story-card__body">
                <h3 class="story-card__headline">${story.title}</h3>
                <p class="story-card__excerpt">${story.excerpt}</p>
                <a href="success-stories-single.jsp?id=${story.id}" class="story-card__read-link">Read Story →</a>
              </div>
            </div>
          </c:forEach>
        </c:if>
      </div>
    </div>

    <aside class="stories-sidebar">
      <div class="sidebar-card">
        <h3>By the Numbers</h3>
        <div class="platform-stats">
          <div class="platform-stat">
            <div class="number">₹200+ Cr</div>
            <div class="label">Value Created</div>
          </div>
          <div class="platform-stat">
            <div class="number">₹15 Cr</div>
            <div class="label">Expert Earnings</div>
          </div>
          <div class="platform-stat">
            <div class="number">10</div>
            <div class="label">Domains</div>
          </div>
          <div class="platform-stat">
            <div class="number">2,400+</div>
            <div class="label">Sessions</div>
          </div>
        </div>
      </div>

      <div class="sidebar-card sidebar-card--white">
        <h3>Share Your Story</h3>
        <p style="font-size: 14px; color: var(--gray-600); margin-bottom: 16px;">Did MentorMarket help your business? Share your success story and inspire other entrepreneurs.</p>
        <a href="contact.jsp" class="btn btn--primary">Share Your Story</a>
      </div>
    </aside>
  </div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

  <script src="js/main.js"></script>
</body>
</html>
