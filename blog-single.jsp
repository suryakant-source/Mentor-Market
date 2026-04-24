<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="pageTitleOverride" value="Blog — MentorMarket" />
<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/content-pages.css">
<link rel="stylesheet" href="css/blog.css">
<style>
  .blog-single-hero {
    background: var(--navy-deep);
    padding: 140px 48px 60px;
  }
  .blog-single-hero__category {
    display: inline-block;
    padding: 6px 14px;
    background: var(--gold-primary);
    color: var(--navy-deep);
    font-size: 12px;
    font-weight: 600;
    border-radius: var(--radius-full);
    margin-bottom: 20px;
  }
  .blog-single-hero h1 {
    font-family: var(--font-heading);
    font-size: 48px;
    font-weight: 700;
    color: var(--white);
    max-width: 800px;
    line-height: 1.2;
    margin-bottom: 20px;
  }
  .blog-single-hero__meta {
    display: flex;
    align-items: center;
    gap: 16px;
    margin-bottom: 24px;
  }
  .blog-single-hero__author {
    display: flex;
    align-items: center;
    gap: 10px;
  }
  .blog-single-hero__author img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    object-fit: cover;
  }
  .blog-single-hero__author-name {
    font-size: 14px;
    font-weight: 600;
    color: var(--white);
  }
  .blog-single-hero__author-role {
    font-size: 12px;
    color: var(--gray-400);
  }
  .blog-single-hero__meta-info {
    display: flex;
    gap: 16px;
    font-size: 13px;
    color: var(--gray-400);
  }
  .blog-single-hero__hero-image {
    width: 100%;
    max-width: 1000px;
    margin: 40px auto 0;
    border-radius: var(--radius-xl);
    overflow: hidden;
  }
  .blog-single-hero__hero-image img {
    width: 100%;
    height: 480px;
    object-fit: cover;
  }
  .blog-single-content {
    max-width: 720px;
    margin: 0 auto;
    padding: 64px 48px;
  }
  .blog-single-content h2 {
    font-family: var(--font-heading);
    font-size: 28px;
    font-weight: 700;
    color: var(--gray-800);
    margin: 40px 0 20px;
  }
  .blog-single-content h3 {
    font-family: var(--font-heading);
    font-size: 22px;
    font-weight: 600;
    color: var(--gray-800);
    margin: 32px 0 16px;
  }
  .blog-single-content p {
    font-size: 17px;
    color: var(--gray-600);
    line-height: 1.85;
    margin-bottom: 24px;
  }
  .blog-single-content blockquote {
    border-left: 4px solid var(--gold-primary);
    padding: 20px 32px;
    margin: 32px 0;
    background: var(--cream);
    border-radius: 0 var(--radius-lg) var(--radius-lg) 0;
  }
  .blog-single-content blockquote p {
    font-family: var(--font-heading);
    font-size: 20px;
    font-style: italic;
    color: var(--navy-deep);
    margin: 0;
  }
  .blog-single-content ul, .blog-single-content ol {
    padding-left: 24px;
    margin-bottom: 24px;
  }
  .blog-single-content li {
    font-size: 17px;
    color: var(--gray-600);
    line-height: 1.7;
    margin-bottom: 12px;
  }
  .blog-single-share {
    display: flex;
    align-items: center;
    gap: 16px;
    padding: 24px 0;
    border-top: 1px solid var(--gray-200);
    border-bottom: 1px solid var(--gray-200);
    margin: 40px 0;
  }
  .blog-single-share span {
    font-size: 14px;
    font-weight: 600;
    color: var(--gray-700);
  }
  .blog-single-share a {
    width: 36px;
    height: 36px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: var(--radius-md);
    background: var(--gray-100);
    color: var(--gray-600);
    transition: all 200ms ease;
  }
  .blog-single-share a:hover {
    background: var(--gold-primary);
    color: var(--navy-deep);
  }
  .blog-author-card {
    display: flex;
    gap: 24px;
    background: var(--cream);
    padding: 32px;
    border-radius: var(--radius-xl);
    margin: 40px 0;
  }
  .blog-author-card img {
    width: 72px;
    height: 72px;
    border-radius: 50%;
    object-fit: cover;
    flex-shrink: 0;
  }
  .blog-author-card h4 {
    font-size: 18px;
    font-weight: 700;
    color: var(--gray-800);
    margin-bottom: 4px;
  }
  .blog-author-card .role {
    font-size: 13px;
    color: var(--gold-primary);
    font-weight: 600;
    margin-bottom: 12px;
  }
  .blog-author-card p {
    font-size: 14px;
    color: var(--gray-600);
    line-height: 1.6;
    margin: 0;
  }
  .related-posts {
    padding: 64px 48px;
    max-width: 1200px;
    margin: 0 auto;
  }
  .related-posts h2 {
    font-family: var(--font-heading);
    font-size: 32px;
    font-weight: 700;
    color: var(--gray-800);
    margin-bottom: 32px;
  }
  .related-posts__grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 32px;
  }
  .related-post-card {
    background: var(--white);
    border-radius: var(--radius-xl);
    overflow: hidden;
    box-shadow: var(--shadow-sm);
    transition: all 300ms var(--ease-spring);
  }
  .related-post-card:hover {
    transform: translateY(-8px);
    box-shadow: var(--shadow-lg);
  }
  .related-post-card__image {
    height: 160px;
    overflow: hidden;
  }
  .related-post-card__image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  .related-post-card__body {
    padding: 20px;
  }
  .related-post-card__category {
    font-size: 11px;
    color: var(--gold-primary);
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    margin-bottom: 8px;
  }
  .related-post-card__title {
    font-family: var(--font-heading);
    font-size: 17px;
    font-weight: 600;
    color: var(--gray-800);
    line-height: 1.4;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }
  @media (max-width: 768px) {
    .blog-single-hero { padding: 120px 24px 40px; }
    .blog-single-hero h1 { font-size: 28px; }
    .blog-single-hero__hero-image img { height: 240px; }
    .blog-single-content { padding: 40px 24px; }
    .blog-single-content h2 { font-size: 22px; }
    .blog-single-content p, .blog-single-content li { font-size: 16px; }
    .related-posts__grid { grid-template-columns: 1fr; }
    .blog-author-card { flex-direction: column; text-align: center; align-items: center; }
  }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/includes/navbar.jsp" />

<section class="blog-single-hero">
  <span class="blog-single-hero__category">${currentPost.category}</span>
  <h1>${currentPost.title}</h1>
  <div class="blog-single-hero__meta">
    <div class="blog-single-hero__author">
      <img src="${currentPost.authorImage}" alt="${currentPost.author}">
      <div>
        <div class="blog-single-hero__author-name">${currentPost.author}</div>
        <div class="blog-single-hero__author-role">${currentPost.authorRole}</div>
      </div>
    </div>
    <div class="blog-single-hero__meta-info">
      <span><fmt:formatDate value="${currentPost.publishDate}" pattern="MMMM d, yyyy" /></span>
      <span>·</span>
      <span>${currentPost.readTime}</span>
    </div>
  </div>
  <div class="blog-single-hero__hero-image">
    <img src="${currentPost.heroImage}" alt="${currentPost.title}">
  </div>
</section>

<article class="blog-single-content">
  ${currentPost.content}
  
  <div class="blog-single-share">
    <span>Share this article:</span>
    <a href="https://www.linkedin.com/sharing/share-offsite/?url=${pageContext.request.requestURL}" aria-label="Share on LinkedIn" target="_blank">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg>
    </a>
    <a href="https://twitter.com/intent/tweet?text=${currentPost.title}&url=${pageContext.request.requestURL}" aria-label="Share on Twitter" target="_blank">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>
    </a>
  </div>

  <div class="blog-author-card">
    <img src="${currentPost.authorImage}" alt="${currentPost.author}">
    <div>
      <h4>${currentPost.author}</h4>
      <div class="role">${currentPost.authorRole}</div>
      <p>${currentPost.authorBio}</p>
    </div>
  </div>
</article>

<section class="related-posts">
  <h2>More to Read</h2>
  <div class="related-posts__grid">
    <c:forEach items="${relatedPosts}" var="post">
      <a href="blog-single.jsp?id=${post.id}" class="related-post-card">
        <div class="related-post-card__image">
          <img src="${post.heroImage}" alt="${post.title}">
        </div>
        <div class="related-post-card__body">
          <div class="related-post-card__category">${post.category}</div>
          <div class="related-post-card__title">${post.title}</div>
        </div>
      </a>
    </c:forEach>
  </div>
</section>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

</body>
</html>
