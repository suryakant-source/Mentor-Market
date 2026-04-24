<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="postTitle" value="${param.title ne null ? param.title : 'Success Story'}" />
<c:set var="pageTitleOverride" value="${postTitle} — MentorMarket" />

<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/content-pages.css">
<style>
  .story-single {
    max-width: 800px;
    margin: 0 auto;
    padding: 120px 48px 80px;
  }
  .story-single__hero {
    margin-bottom: 48px;
  }
  .story-single__back {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    font-size: 14px;
    color: var(--gray-600);
    margin-bottom: 24px;
  }
  .story-single__badge {
    display: inline-block;
    padding: 6px 14px;
    background: var(--gold-primary);
    color: var(--navy-deep);
    font-size: 12px;
    font-weight: 600;
    border-radius: var(--radius-full);
    margin-bottom: 16px;
  }
  .story-single__title {
    font-family: var(--font-heading);
    font-size: 40px;
    font-weight: 700;
    line-height: 1.3;
    margin-bottom: 24px;
  }
  .story-single__meta {
    display: flex;
    align-items: center;
    gap: 24px;
    padding-bottom: 24px;
    border-bottom: 1px solid var(--gray-200);
  }
  .story-single__expert {
    display: flex;
    align-items: center;
    gap: 12px;
  }
  .story-single__expert img {
    width: 48px;
    height: 48px;
    border-radius: 50%;
  }
  .story-single__expert-name {
    font-weight: 600;
    color: var(--gray-800);
  }
  .story-single__expert-title {
    font-size: 13px;
    color: var(--gray-500);
  }
  .story-single__content {
    padding: 48px 0;
    font-size: 17px;
    line-height: 1.8;
    color: var(--gray-700);
  }
  .story-single__content p {
    margin-bottom: 24px;
  }
  .story-single__content h2 {
    font-family: var(--font-heading);
    font-size: 28px;
    margin: 40px 0 20px;
    color: var(--gray-800);
  }
  .story-single__impact {
    background: var(--navy-deep);
    border-radius: var(--radius-xl);
    padding: 32px;
    margin-top: 48px;
  }
  .story-single__impact h3 {
    color: var(--white);
    font-size: 14px;
    margin-bottom: 24px;
  }
  .story-single__impact-chips {
    display: flex;
    gap: 16px;
    flex-wrap: wrap;
  }
  .impact-chip {
    padding: 12px 20px;
    border: 1px solid var(--gold-primary);
    border-radius: var(--radius-md);
    font-size: 14px;
    font-weight: 600;
    color: var(--gold-primary);
  }
  @media (max-width: 768px) {
    .story-single { padding: 100px 24px 40px; }
    .story-single__title { font-size: 28px; }
  }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/includes/navbar.jsp" />

  <article class="story-single">
    <div class="story-single__hero">
      <a href="success-stories.jsp" class="story-single__back">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="15 18 9 12 15 6"/></svg>
        Back to Success Stories
      </a>
      
      <span class="story-single__badge">Success Story</span>
      <h1 class="story-single__title">
        <c:choose>
          <c:when test="${param.id == 'featured'}">How a Retired CFO Helped a Mumbai Startup Raise ₹8 Crore in 60 Days</c:when>
          <c:when test="${not empty param.title}">${param.title}</c:when>
          <c:otherwise>How Mentorship Changed Everything</c:otherwise>
        </c:choose>
      </h1>
      
      <div class="story-single__meta">
        <div class="story-single__expert">
          <img src="assets/experts/default.jpg" alt="Rajesh Kumar" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 48 48%22><circle cx=%2224%22 cy=%2224%22 r=%2224%22 fill=%22%23F5A623%22/><text x=%2250%25%22 y=%2255%25%22 text-anchor=%22middle%22 fill=%22%230A1628%22 font-size=%2216%22>RK</text></svg>'">
          <div>
            <div class="story-single__expert-name">Rajesh Kumar</div>
            <div class="story-single__expert-title">Former CFO, Retired Finance Expert</div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="story-single__content">
      <c:choose>
        <c:when test="${param.id == 'featured'}">
          <p>When Priya Sharma's fintech startup needed capital to scale, she didn't know where to turn. Her runway was down to three months, and traditional VC routes seemed impossibly slow. Then she discovered MentorMarket.</p>
          
          <h2>The Challenge</h2>
          <p>Priya had built a compelling product — a peer-to-peer lending platform tailored for small businesses in India. But investors wanted to see more than a great idea. They wanted financial projections, unit economics, and a clear path to profitability.</p>
          
          <p>"I knew my product was solid," Priya recalls. "But I had no idea how to present it to investors. My background was in technology, not finance."</p>
          
          <h2>The Solution</h2>
          <p>Through MentorMarket, Priya connected with Rajesh Kumar, a retired CFO who had led finance at three unicorn startups. Within 48 hours of their first session, Rajesh helped her build a financial model that told her story in terms investors understood.</p>
          
          <p>But more than the numbers, Rajesh taught Priya how to think like a CFO. He helped her understand unit economics, customer acquisition costs, and lifetime value — concepts that would define her company's future.</p>
          
          <h2>The Results</h2>
          <p>Sixty days after her first session with Rajesh, Priya closed her Series A round. ₹8 crore at a ₹40 crore valuation.</p>
        </c:when>
        <c:otherwise>
          <p>This is a placeholder for the success story content. In production, this would be populated from the database or a CMS.</p>
          <p>Stories typically include:</p>
          <ul>
            <li>The challenge the buyer faced</li>
            <li>How the expert helped</li>
            <li>The results achieved</li>
            <li>Lessons learned</li>
          </ul>
        </c:otherwise>
      </c:choose>
      
      <div class="story-single__impact">
        <h3>THE IMPACT</h3>
        <div class="story-single__impact-chips">
          <c:choose>
            <c:when test="${param.id == 'featured'}">
              <span class="impact-chip">₹8 Crore Raised</span>
              <span class="impact-chip">60 Days</span>
              <span class="impact-chip">Series A Closed</span>
            </c:when>
            <c:otherwise>
              <span class="impact-chip">Results Coming Soon</span>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </article>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

</body>
</html>
