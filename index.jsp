<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="pageTitleOverride" value="MentorMarket — Connect with Retired Industry Experts" />

<%-- Include common head fragment --%>
<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/landing.css">
</head>
<body>

<%-- Include navigation fragment --%>
<jsp:include page="/WEB-INF/includes/navbar.jsp" />

  <section class="hero">
    <video class="hero__video" autoplay muted loop playsinline poster="assets/hero-fallback.jpg">
      <source src="assets/hero-video.mp4" type="video/mp4">
    </video>
    <img class="hero__fallback" src="assets/hero-fallback.jpg" alt="MentorMarket">
    <div class="hero__overlay"></div>
    <div class="hero__content">
      <div class="hero__chip">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"/>
        </svg>
        Trusted by 10,000+ Professionals
      </div>
      <h1 class="hero__headline">Tap Into Decades of Industry Wisdom</h1>
      <p class="hero__subheadline">Connect with retired executives who've built empires. Get personalized guidance on business, strategy, and growth from those who've been there.</p>
      <div class="hero__actions">
        <a href="experts.jsp" class="btn btn--primary">Find Your Expert</a>
        <a href="how-it-works.html" class="btn btn--ghost">See How It Works</a>
      </div>
      <div class="hero__proof">
        <div class="hero__proof-item">
          <svg viewBox="0 0 24 24" fill="currentColor">
            <path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"/>
          </svg>
          4.9 Average Rating
        </div>
        <span class="hero__proof-divider">|</span>
        <div class="hero__proof-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
            <polyline points="22 4 12 14.01 9 11.01"/>
          </svg>
          300+ Verified Experts
        </div>
        <span class="hero__proof-divider">|</span>
        <div class="hero__proof-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="12" cy="12" r="10"/>
            <polyline points="12 6 12 12 16 14"/>
          </svg>
          2,400+ Sessions
        </div>
      </div>
    </div>
    <div class="hero__scroll-indicator">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <polyline points="6 9 12 15 18 9"/>
      </svg>
    </div>
  </section>

  <section class="stats-bar">
    <div class="stats-grid">
      <div class="stat-item">
        <div class="stat-item__icon">
          <svg viewBox="0 0 32 32" fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="16" cy="16" r="14"/>
            <path d="M16 8v8l6 4"/>
          </svg>
        </div>
        <c:choose>
          <c:when test="${not empty requestScope.totalSessions}">
            <div class="stat-item__number" data-target="${totalSessions}"><fmt:formatNumber value="${totalSessions}" pattern="#" /><span class="suffix">+</span></div>
          </c:when>
          <c:otherwise>
            <div class="stat-item__number" data-target="2400">2,400<span class="suffix">+</span></div>
          </c:otherwise>
        </c:choose>
        <div class="stat-item__label">Sessions Completed</div>
      </div>
      <div class="stat-item">
        <div class="stat-item__icon">
          <svg viewBox="0 0 32 32" fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="16" cy="10" r="6"/>
            <path d="M4 28c0-6.6 5.4-12 12-12s12 5.4 12 12"/>
          </svg>
        </div>
        <c:choose>
          <c:when test="${not empty requestScope.totalExperts}">
            <div class="stat-item__number">${totalExperts}<span class="suffix">+</span></div>
          </c:when>
          <c:otherwise>
            <div class="stat-item__number" data-count="300"><span class="suffix">+</span></div>
          </c:otherwise>
        </c:choose>
        <div class="stat-item__label">Verified Experts</div>
      </div>
      <div class="stat-item">
        <div class="stat-item__icon">
          <svg viewBox="0 0 32 32" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M16 2L20 12H30L22 18L26 28L16 22L6 28L10 18L2 12H12L16 2Z"/>
          </svg>
        </div>
        <c:choose>
          <c:when test="${not empty requestScope.averageRating}">
            <div class="stat-item__number">${averageRating}<span class="suffix"></span></div>
          </c:when>
          <c:otherwise>
            <div class="stat-item__number" data-count="4"><span class="suffix">.9</span></div>
          </c:otherwise>
        </c:choose>
        <div class="stat-item__label">Average Rating</div>
      </div>
      <div class="stat-item">
        <div class="stat-item__icon">
          <svg viewBox="0 0 32 32" fill="none" stroke="currentColor" stroke-width="2">
            <rect x="4" y="8" width="24" height="16" rx="2"/>
            <path d="M12 8V6a4 4 0 0 1 8 0v2"/>
            <path d="M16 14v4"/>
          </svg>
        </div>
        <c:choose>
          <c:when test="${not empty requestScope.totalBuyers}">
            <div class="stat-item__number"><fmt:formatNumber value="${totalBuyers}" pattern="#,###" /><span class="suffix">K+</span></div>
          </c:when>
          <c:otherwise>
            <div class="stat-item__number" data-count="10"><span class="suffix">K+</span></div>
          </c:otherwise>
        </c:choose>
        <div class="stat-item__label">Happy Clients</div>
      </div>
    </div>
  </section>

  <section class="how-it-works">
    <div class="section-header">
      <span class="label-chip label-chip--gold">Simple Process</span>
      <h2>How It Works</h2>
      <p>Whether you're seeking guidance or offering your expertise, our streamlined process makes mentorship effortless.</p>
    </div>
    <div class="how-it-works__grid">
      <div class="process-panel process-panel--buyers">
        <div class="process-panel__header">
          <span class="process-panel__dot"></span>
          <h4 class="process-panel__title">For Buyers</h4>
        </div>
        <div class="step-row">
          <div class="step-row__number">1</div>
          <div class="step-row__content">
            <h5>Browse Experts</h5>
            <p>Search by industry, expertise, or availability to find your perfect mentor match.</p>
          </div>
        </div>
        <div class="step-row">
          <div class="step-row__number">2</div>
          <div class="step-row__content">
            <h5>Book a Session</h5>
            <p>Schedule a 30-minute intro call to discuss your goals and see if it's a fit.</p>
          </div>
        </div>
        <div class="step-row">
          <div class="step-row__number">3</div>
          <div class="step-row__content">
            <h5>Get Guidance</h5>
            <p>Receive personalized advice from seasoned professionals who've walked your path.</p>
          </div>
        </div>
      </div>
      <div class="process-panel process-panel--experts">
        <div class="process-panel__header">
          <span class="process-panel__dot"></span>
          <h4 class="process-panel__title">For Experts</h4>
        </div>
        <div class="step-row">
          <div class="step-row__number">1</div>
          <div class="step-row__content">
            <h5>Create Profile</h5>
            <p>Sign up and showcase your experience, expertise areas, and availability.</p>
          </div>
        </div>
        <div class="step-row">
          <div class="step-row__number">2</div>
          <div class="step-row__content">
            <h5>Get Verified</h5>
            <p>Our team reviews your credentials to ensure quality and trust on the platform.</p>
          </div>
        </div>
        <div class="step-row">
          <div class="step-row__number">3</div>
          <div class="step-row__content">
            <h5>Start Earning</h5>
            <p>Accept bookings, share your knowledge, and turn your retirement into revenue.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="domains">
    <div class="section-header">
      <span class="label-chip label-chip--gold">Expertise Areas</span>
      <h2>Browse by Domain</h2>
      <p>Find mentors across ten core business domains, from finance to real estate.</p>
    </div>
    <div class="domains__grid stagger-container">
      <c:choose>
        <c:when test="${not empty requestScope.domainList}">
          <c:forEach var="domain" items="${domainList}">
            <a href="experts.jsp?domainId=${domain.domainId}" class="domain-card">
              <div class="domain-card__icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                  <path d="M22 12h-4l-3 4L12 3L2 12h4l3-4"/>
                </svg>
              </div>
              <h3 class="domain-card__name">${domain.name}</h3>
              <p class="domain-card__count">${domain.expertCount} experts</p>
            </a>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <%-- Fallback static domains for when no data is provided --%>
          <a href="experts.jsp?domainId=finance" class="domain-card">
            <div class="domain-card__icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 2v20M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
            </div>
            <h3 class="domain-card__name">Finance</h3>
            <p class="domain-card__count">45 experts</p>
          </a>
          <a href="experts.jsp?domainId=technology" class="domain-card">
            <div class="domain-card__icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M16 18l6-6-6-6M8 6l-6 6 6 6"/></svg>
            </div>
            <h3 class="domain-card__name">Technology</h3>
            <p class="domain-card__count">38 experts</p>
          </a>
          <a href="experts.jsp?domainId=sales" class="domain-card">
            <div class="domain-card__icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M16 4h6v6M8 20H2v-6M20 4L4 20"/></svg>
            </div>
            <h3 class="domain-card__name">Sales</h3>
            <p class="domain-card__count">32 experts</p>
          </a>
          <a href="experts.jsp?domainId=operations" class="domain-card">
            <div class="domain-card__icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="3"/><path d="M12 1v4M12 19v4M4.22 4.22l2.83 2.83M16.95 16.95l2.83 2.83M1 12h4M19 12h4"/></svg>
            </div>
            <h3 class="domain-card__name">Operations</h3>
            <p class="domain-card__count">28 experts</p>
          </a>
          <a href="experts.jsp?domainId=marketing" class="domain-card">
            <div class="domain-card__icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>
            </div>
            <h3 class="domain-card__name">Marketing</h3>
            <p class="domain-card__count">25 experts</p>
          </a>
          <a href="experts.jsp?domainId=hr" class="domain-card">
            <div class="domain-card__icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/></svg>
            </div>
            <h3 class="domain-card__name">HR</h3>
            <p class="domain-card__count">22 experts</p>
          </a>
          <a href="experts.jsp?domainId=legal" class="domain-card">
            <div class="domain-card__icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
            </div>
            <h3 class="domain-card__name">Legal</h3>
            <p class="domain-card__count">18 experts</p>
          </a>
          <a href="experts.jsp?domainId=healthcare" class="domain-card">
            <div class="domain-card__icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 12h-4l-3 4L12 3L2 12h4l3-4"/></svg>
            </div>
            <h3 class="domain-card__name">Healthcare</h3>
            <p class="domain-card__count">15 experts</p>
          </a>
          <a href="experts.jsp?domainId=supply_chain" class="domain-card">
            <div class="domain-card__icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="1" y="3" width="15" height="13"/><polygon points="16 8 20 8 23 11 23 16 16 16 16 8"/><circle cx="5.5" cy="18.5" r="2.5"/><circle cx="18.5" cy="18.5" r="2.5"/></svg>
            </div>
            <h3 class="domain-card__name">Supply Chain</h3>
            <p class="domain-card__count">12 experts</p>
          </a>
          <a href="experts.jsp?domainId=real_estate" class="domain-card">
            <div class="domain-card__icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
            </div>
            <h3 class="domain-card__name">Real Estate</h3>
            <p class="domain-card__count">10 experts</p>
          </a>
        </c:otherwise>
      </c:choose>
    </div>
  </section>

  <section class="featured-experts">
    <div class="section-header">
      <span class="label-chip">Featured Experts</span>
      <h2>Meet Our Top Mentors</h2>
      <p>Handpicked professionals with decades of experience ready to guide your journey.</p>
    </div>
    <div class="experts-scroll-container">
      <div class="experts-row">
        <c:choose>
          <c:when test="${not empty requestScope.featuredExperts}">
            <c:forEach var="expert" items="${featuredExperts}" varStatus="status">
              <div class="expert-card-mini">
                <div class="expert-card-mini__photo">
                  <c:choose>
                    <c:when test="${not empty expert.photoPath}">
                      <img src="${expert.photoPath}" alt="${expert.fullName}" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 80 80%22><circle cx=%2240%22 cy=%2240%22 r=%2240%22 fill=%22%23F5A623%22/><text x=%2250%25%22 y=%2255%25%22 text-anchor=%22middle%22 fill=%22%230A1628%22 font-size=%2224%22>${expert.firstName.substring(0,1)}${expert.lastName.substring(0,1)}</text></svg>'">
                    </c:when>
                    <c:otherwise>
                      <div class="expert-card-mini__placeholder">${expert.firstName.substring(0,1)}${expert.lastName.substring(0,1)}</div>
                    </c:otherwise>
                  </c:choose>
                </div>
                <h4 class="expert-card-mini__name">${expert.fullName}</h4>
                <p class="expert-card-mini__title">${expert.jobTitle}<c:if test="${not empty expert.company}"> at ${expert.company}</c:if></p>
                <div class="expert-card-mini__rating">
                  <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
                  <span>${expert.rating}</span>
                </div>
                <a href="profile.jsp?id=${expert.id}" class="expert-card-mini__link">View Profile</a>
              </div>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <%-- Fallback static cards when no data --%>
            <div class="expert-card-mini">
              <div class="expert-card-mini__photo">
                <img src="assets/experts/expert-1.jpg" alt="Rajesh Kumar" onerror="this.style.display='none'">
              </div>
              <h4 class="expert-card-mini__name">Rajesh Kumar</h4>
              <p class="expert-card-mini__title">Former CFO at Flipkart</p>
              <div class="expert-card-mini__rating">
                <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
                <span>4.9</span>
              </div>
              <a href="profile.jsp?id=1" class="expert-card-mini__link">View Profile</a>
            </div>
            <div class="expert-card-mini">
              <div class="expert-card-mini__photo">
                <img src="assets/experts/expert-2.jpg" alt="Anita Sharma" onerror="this.style.display='none'">
              </div>
              <h4 class="expert-card-mini__name">Anita Sharma</h4>
              <p class="expert-card-mini__title">Ex-VP Sales at Uber</p>
              <div class="expert-card-mini__rating">
                <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
                <span>4.8</span>
              </div>
              <a href="profile.jsp?id=2" class="expert-card-mini__link">View Profile</a>
            </div>
            <div class="expert-card-mini">
              <div class="expert-card-mini__photo">
                <img src="assets/experts/expert-3.jpg" alt="Vikram Malhotra" onerror="this.style.display='none'">
              </div>
              <h4 class="expert-card-mini__name">Vikram Malhotra</h4>
              <p class="expert-card-mini__title">Ex-CTO at Paytm</p>
              <div class="expert-card-mini__rating">
                <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
                <span>4.9</span>
              </div>
              <a href="profile.jsp?id=3" class="expert-card-mini__link">View Profile</a>
            </div>
            <div class="expert-card-mini">
              <div class="expert-card-mini__photo">
                <img src="assets/experts/expert-4.jpg" alt="Priya Patel" onerror="this.style.display='none'">
              </div>
              <h4 class="expert-card-mini__name">Priya Patel</h4>
              <p class="expert-card-mini__title">Former CHRO at Infosys</p>
              <div class="expert-card-mini__rating">
                <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
                <span>4.7</span>
              </div>
              <a href="profile.jsp?id=4" class="expert-card-mini__link">View Profile</a>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
      <button class="experts-nav-btn experts-nav-btn--prev" aria-label="Previous">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <polyline points="15 18 9 12 15 6"/>
        </svg>
      </button>
      <button class="experts-nav-btn experts-nav-btn--next" aria-label="Next">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <polyline points="9 18 15 12 9 6"/>
        </svg>
      </button>
    </div>
  </section>

  <section class="testimonials">
    <div class="section-header">
      <span class="label-chip label-chip--gold">Success Stories</span>
      <h2>What Our Clients Say</h2>
      <p>Real stories from professionals who've transformed their careers with MentorMarket.</p>
    </div>
    <div class="testimonials__grid">
      <div class="testimonial-card">
        <span class="testimonial-card__quote">"</span>
        <div class="testimonial-card__stars">
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        </div>
        <p class="testimonial-card__text">Working with Dr. Chen transformed how I think about investment strategy. Her insights from Goldman Sachs gave me the confidence to make my first major portfolio move. The ROI on these sessions has been incredible.</p>
        <div class="testimonial-card__divider"></div>
        <div class="testimonial-card__reviewer">
          <img src="assets/testimonials/buyer-1.jpg" alt="Marcus Webb" class="testimonial-card__photo" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 52 52%22><circle cx=%2226%22 cy=%2226%22 r=%2226%22 fill=%22%23E8E8E8%22/><text x=%2250%%22 y=%2258%%22 text-anchor=%22middle%22 fill=%22%234A5568%22 font-size=%2220%22>MW</text></svg>'">
          <div class="testimonial-card__info">
            <h5>Marcus Webb</h5>
            <p>Startup Founder, Austin TX</p>
          </div>
        </div>
      </div>
      <div class="testimonial-card">
        <span class="testimonial-card__quote">"</span>
        <div class="testimonial-card__stars">
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        </div>
        <p class="testimonial-card__text">As a retired CFO, I thought my knowledge would fade into retirement. MentorMarket connected me with ambitious founders who needed exactly what I had to offer. It's fulfilling and financially rewarding.</p>
        <div class="testimonial-card__divider"></div>
        <div class="testimonial-card__reviewer">
          <img src="assets/testimonials/buyer-2.jpg" alt="Richard Thornton" class="testimonial-card__photo" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 52 52%22><circle cx=%2226%22 cy=%2226%22 r=%2226%22 fill=%22%23E8E8E8%22/><text x=%2250%%22 y=%2258%%22 text-anchor=%22middle%22 fill=%22%234A5568%22 font-size=%2220%22>RT</text></svg>'">
          <div class="testimonial-card__info">
            <h5>Richard Thornton</h5>
            <p>Verified Expert, Former CFO</p>
          </div>
        </div>
      </div>
      <div class="testimonial-card">
        <span class="testimonial-card__quote">"</span>
        <div class="testimonial-card__stars">
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        </div>
        <p class="testimonial-card__text">I was skeptical at first, but within two weeks I had my first client. Now I run a thriving part-time consulting practice from my home. The platform handles everything — I just focus on what I love.</p>
        <div class="testimonial-card__divider"></div>
        <div class="testimonial-card__reviewer">
          <img src="assets/testimonials/buyer-3.jpg" alt="Diana Morales" class="testimonial-card__photo" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 52 52%22><circle cx=%2226%22 cy=%2226%22 r=%2226%22 fill=%22%23E8E8E8%22/><text x=%2250%%22 y=%2258%%22 text-anchor=%22middle%22 fill=%22%234A5568%22 font-size=%2220%22>DM</text></svg>'">
          <div class="testimonial-card__info">
            <h5>Diana Morales</h5>
            <p>Expert in Supply Chain</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="cta-banner">
    <img src="assets/cta-background.jpg" alt="" class="cta-banner__bg" onerror="this.style.display='none'">
    <div class="cta-banner__overlay"></div>
    <div class="cta-banner__glow"></div>
    <div class="cta-banner__content">
      <span class="cta-banner__chip">Are You Retiring Soon?</span>
      <h2>Turn Your Retirement Into Revenue</h2>
      <p>Your decades of experience are worth more than a pension. Join hundreds of retired executives sharing their wisdom and earning on their own terms.</p>
      <a href="register-expert.jsp" class="btn btn--primary">Become an Expert</a>
    </div>
    <div class="cta-banner__decoration">
      <img src="assets/video-call.jpg" alt="Expert on video call" onerror="this.style.display='none'">
    </div>
  </section>

<%-- Include footer fragment --%>
<jsp:include page="/WEB-INF/includes/footer.jsp" />

  <script src="js/main.js"></script>
  <script src="js/landing.js"></script>
</body>
</html>
