<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="pageTitleOverride" value="Blog — MentorMarket" />

<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/content-pages.css">
<style>
  .blog-hero {
    background: var(--navy-deep);
    padding: 140px 48px 80px;
    text-align: center;
  }
  .blog-hero h1 {
    font-family: var(--font-heading);
    font-size: 48px;
    color: var(--white);
    margin-bottom: 16px;
  }
  .blog-hero p {
    color: rgba(255,255,255,0.70);
    max-width: 600px;
    margin: 0 auto;
  }
  .blog-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 32px;
    max-width: 1400px;
    margin: 0 auto;
    padding: 64px 48px;
  }
  .blog-card {
    background: var(--white);
    border-radius: var(--radius-xl);
    overflow: hidden;
    box-shadow: var(--shadow-sm);
    transition: all 300ms var(--ease-spring);
    cursor: pointer;
  }
  .blog-card:hover {
    transform: translateY(-8px);
    box-shadow: var(--shadow-lg);
  }
  .blog-card__image {
    height: 220px;
    overflow: hidden;
  }
  .blog-card__image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  .blog-card__body {
    padding: 24px;
  }
  .blog-card__category {
    font-size: 12px;
    color: var(--gold-primary);
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    margin-bottom: 12px;
  }
  .blog-card__title {
    font-family: var(--font-heading);
    font-size: 20px;
    font-weight: 600;
    color: var(--gray-800);
    margin-bottom: 12px;
    line-height: 1.4;
  }
  .blog-card__excerpt {
    font-size: 14px;
    color: var(--gray-600);
    line-height: 1.6;
    margin-bottom: 16px;
  }
  .blog-card__author {
    display: flex;
    align-items: center;
    gap: 12px;
  }
  .blog-card__author img {
    width: 32px;
    height: 32px;
    border-radius: 50%;
  }
  .blog-card__author-name {
    font-size: 13px;
    font-weight: 600;
    color: var(--gray-700);
  }
  .blog-card__read-time {
    font-size: 12px;
    color: var(--gray-400);
  }
  @media (max-width: 1200px) {
    .blog-grid { grid-template-columns: repeat(2, 1fr); }
  }
  @media (max-width: 768px) {
    .blog-hero { padding: 120px 24px 40px; }
    .blog-hero h1 { font-size: 32px; }
    .blog-grid { grid-template-columns: 1fr; padding: 40px 24px; }
  }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/includes/navbar.jsp" />

  <section class="blog-hero">
    <span class="label-chip label-chip--gold">EXPERT INSIGHTS</span>
    <h1>From Experience to Expertise</h1>
    <p>Thought leadership, frameworks, and wisdom from our community of industry leaders.</p>
  </section>

  <div class="blog-grid">
    <c:choose>
      <c:when test="${not empty blogPosts}">
        <c:forEach var="post" items="${blogPosts}">
          <a href="blog-single.jsp?id=${post.id}" class="blog-card">
            <div class="blog-card__image">
              <img src="${post.imageUrl}" alt="${post.title}" onerror="this.style.display='none'">
            </div>
            <div class="blog-card__body">
              <span class="blog-card__category">${post.category}</span>
              <h3 class="blog-card__title">${post.title}</h3>
              <p class="blog-card__excerpt">${post.excerpt}</p>
              <div class="blog-card__author">
                <span class="blog-card__author-name">${post.authorName}</span>
                <span class="blog-card__read-time">${post.readTime} min read</span>
              </div>
            </div>
          </a>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <a href="blog-single.jsp?id=1" class="blog-card">
          <div class="blog-card__image">
            <img src="assets/blog/blog-1.jpg" alt="5 Financial Mistakes Startups Make" onerror="this.style.display='none'">
          </div>
          <div class="blog-card__body">
            <span class="blog-card__category">Finance</span>
            <h3 class="blog-card__title">5 Financial Mistakes Startups Make (And How to Avoid Them)</h3>
            <p class="blog-card__excerpt">After reviewing hundreds of seed funding rounds, these are the cash flow errors I see most often...</p>
            <div class="blog-card__author">
              <span class="blog-card__author-name">Rajesh Kumar</span>
              <span class="blog-card__read-time">8 min read</span>
            </div>
          </div>
        </a>
        
        <a href="blog-single.jsp?id=2" class="blog-card">
          <div class="blog-card__image">
            <img src="assets/blog/blog-2.jpg" alt="Building a Sales Machine" onerror="this.style.display='none'">
          </div>
          <div class="blog-card__body">
            <span class="blog-card__category">Sales</span>
            <h3 class="blog-card__title">Building a Sales Machine From Scratch</h3>
            <p class="blog-card__excerpt">TheFramework I used to build 50-person sales teams at three unicorn startups...</p>
            <div class="blog-card__author">
              <span class="blog-card__author-name">Anita Sharma</span>
              <span class="blog-card__read-time">12 min read</span>
            </div>
          </div>
        </a>
        
        <a href="blog-single.jsp?id=3" class="blog-card">
          <div class="blog-card__image">
            <img src="assets/blog/blog-3.jpg" alt="Leadership in Crisis" onerror="this.style.display='none'">
          </div>
          <div class="blog-card__body">
            <span class="blog-card__category">Leadership</span>
            <h3 class="blog-card__title">Leadership When It Counts Most</h3>
            <p class="blog-card__excerpt">What I learned leading through three market crashes and one global recession...</p>
            <div class="blog-card__author">
              <span class="blog-card__author-name">Vikram Malhotra</span>
              <span class="blog-card__read-time">10 min read</span>
            </div>
          </div>
        </a>
      </c:otherwise>
    </c:choose>
  </div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

</body>
</html>
