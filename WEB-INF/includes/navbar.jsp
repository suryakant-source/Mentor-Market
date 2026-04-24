<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="userId" value="${sessionScope.userId}" />
<c:set var="userRole" value="${sessionScope.userRole}" />
<c:set var="userFirstName" value="${sessionScope.firstName}" />
<c:set var="userProfilePhoto" value="${sessionScope.profilePhoto}" />
<c:set var="expertStatus" value="${sessionScope.expertStatus}" />

<c:set var="currentUri" value="${pageContext.request.requestURI}" />
<c:set var="currentPage" value="${fn:substringAfter(currentUri, '/')}" />

<nav class="navbar">
  <a href="index.jsp" class="navbar__logo">
    <svg viewBox="0 0 36 36" fill="none">
      <rect width="36" height="36" rx="8" fill="#F5A623"/>
      <path d="M10 18L15 23L26 12" stroke="#0A1628" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
    MentorMarket
  </a>
  
  <ul class="navbar__links">
    <li><a href="how-it-works.html" class="${currentPage == 'how-it-works.html' ? 'active' : ''}">How It Works</a></li>
    <li><a href="experts.jsp" class="${currentPage == 'experts.jsp' ? 'active' : ''}">Browse Experts</a></li>
    <li class="navbar__dropdown-trigger" data-dropdown="resources">
      <a href="#" class="navbar__dropdown-toggle">Resources <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg></a>
      <div class="navbar__mega-menu" id="resources-dropdown">
        <div class="mega-menu__grid">
          <div class="mega-menu__links">
            <a href="blog.jsp" class="mega-menu__item">
              <div class="mega-menu__icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/><polyline points="10 9 9 9 8 9"/></svg>
              </div>
              <div class="mega-menu__text">
                <span class="mega-menu__title">Blog</span>
                <span class="mega-menu__desc">Expert perspectives, real-world frameworks, and hard-won knowledge</span>
              </div>
            </a>
            <a href="success-stories.jsp" class="mega-menu__item">
              <div class="mega-menu__icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"/><path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"/><path d="M4 22h16"/><path d="M10 14.66V17c0 .55-.47.98-.97 1.21C7.85 18.75 7 20.24 7 22"/><path d="M14 14.66V17c0 .55.47.98.97 1.21C16.15 18.75 17 20.24 17 22"/><path d="M18 2H6v7a6 6 0 0 0 12 0V2Z"/></svg>
              </div>
              <div class="mega-menu__text">
                <span class="mega-menu__title">Success Stories</span>
                <span class="mega-menu__desc">Real buyers, real experts, real results — measured in rupees and outcomes</span>
              </div>
            </a>
            <a href="expert-faq.jsp" class="mega-menu__item">
              <div class="mega-menu__icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
              </div>
              <div class="mega-menu__text">
                <span class="mega-menu__title">Expert FAQ</span>
                <span class="mega-menu__desc">Everything a retiring professional needs to know before applying</span>
              </div>
            </a>
            <a href="resources.jsp" class="mega-menu__item">
              <div class="mega-menu__icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
              </div>
              <div class="mega-menu__text">
                <span class="mega-menu__title">Free Resources</span>
                <span class="mega-menu__desc">Templates, checklists, video masterclasses, and frameworks. Always free.</span>
              </div>
            </a>
          </div>
          <div class="mega-menu__featured">
            <span class="mega-menu__featured-label">LATEST STORY</span>
            <h4 class="mega-menu__featured-title">How a Retired CFO Helped This Startup Raise &#x20b9;8 Crore</h4>
            <p class="mega-menu__featured-excerpt">When Priya Sharma's fintech startup needed capital to scale, she didn't know where to turn. Then she connected with Rajesh Kumar...</p>
            <a href="success-stories-single.jsp?id=featured" class="mega-menu__featured-link">Read Story &#x2192;</a>
          </div>
        </div>
      </div>
    </li>
    <li class="navbar__dropdown-trigger" data-dropdown="company">
      <a href="#" class="navbar__dropdown-toggle">Company <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg></a>
      <div class="navbar__mini-menu" id="company-dropdown">
        <a href="about.html" class="mini-menu__item">
          <span>About Us</span>
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
        </a>
        <a href="careers.jsp" class="mini-menu__item">
          <span>Careers</span>
          <span class="mini-menu__chip">We're Hiring</span>
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
        </a>
        <a href="contact.jsp" class="mini-menu__item">
          <span>Contact Us</span>
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
        </a>
      </div>
    </li>
    <li><a href="register-expert.jsp" class="navbar__link--expert">For Experts</a></li>
  </ul>
  
  <div class="navbar__actions">
    <c:choose>
      <c:when test="${empty userId}">
        <a href="login.jsp" class="btn btn--ghost">Login</a>
        <a href="register-buyer.jsp" class="btn btn--primary">Sign Up</a>
      </c:when>
      <c:when test="${userRole == 'BUYER'}">
        <div class="navbar__user-dropdown">
          <button class="navbar__user-trigger">
            <span class="navbar__user-name">${userFirstName}</span>
            <c:if test="${not empty userProfilePhoto}">
              <img src="${userProfilePhoto}" alt="${userFirstName}" class="navbar__user-avatar">
            </c:if>
            <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg>
          </button>
          <div class="navbar__user-menu">
            <a href="buyer-dashboard.jsp" class="user-menu__item">My Dashboard</a>
            <a href="#" class="user-menu__item">My Sessions</a>
            <a href="logout" class="user-menu__item user-menu__item--logout">Logout</a>
          </div>
        </div>
      </c:when>
      <c:when test="${userRole == 'EXPERT'}">
        <div class="navbar__user-dropdown">
          <button class="navbar__user-trigger">
            <span class="navbar__user-name">${userFirstName}</span>
            <c:if test="${expertStatus == 'PENDING'}">
              <span class="navbar__status-chip">Pending Verification</span>
            </c:if>
            <c:if test="${not empty userProfilePhoto}">
              <img src="${userProfilePhoto}" alt="${userFirstName}" class="navbar__user-avatar">
            </c:if>
            <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg>
          </button>
          <div class="navbar__user-menu">
            <a href="expert-dashboard.jsp" class="user-menu__item">My Dashboard</a>
            <a href="#" class="user-menu__item">My Schedule</a>
            <a href="#" class="user-menu__item">My Earnings</a>
            <a href="logout" class="user-menu__item user-menu__item--logout">Logout</a>
          </div>
        </div>
      </c:when>
      <c:when test="${userRole == 'ADMIN'}">
        <div class="navbar__admin-menu">
          <a href="admin/dashboard.jsp" class="${currentPage == 'dashboard.jsp' ? 'active' : ''}">Dashboard</a>
          <a href="#">Pending Reviews</a>
          <a href="#">All Sessions</a>
          <a href="#">Users</a>
          <a href="#">Messages</a>
          <div class="navbar__admin-user">
            <span>${userFirstName}</span>
            <a href="logout">Logout</a>
          </div>
        </div>
      </c:when>
    </c:choose>
  </div>
  
  <button class="navbar__hamburger" aria-label="Toggle menu">
    <span></span>
    <span></span>
    <span></span>
  </button>
</nav>

<div class="mobile-menu">
  <a href="how-it-works.html">How It Works</a>
  <a href="experts.jsp">Browse Experts</a>
  <div class="mobile-accordion">
    <button class="mobile-accordion__trigger" data-accordion="resources">
      <span>Resources</span>
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg>
    </button>
    <div class="mobile-accordion__content" id="resources-accordion">
      <a href="blog.jsp">Blog</a>
      <a href="success-stories.jsp">Success Stories</a>
      <a href="expert-faq.jsp">Expert FAQ</a>
      <a href="resources.jsp">Free Resources</a>
    </div>
  </div>
  <div class="mobile-accordion">
    <button class="mobile-accordion__trigger" data-accordion="company">
      <span>Company</span>
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg>
    </button>
    <div class="mobile-accordion__content" id="company-accordion">
      <a href="about.html">About Us</a>
      <a href="careers.jsp">Careers</a>
      <a href="contact.jsp">Contact Us</a>
    </div>
  </div>
  <a href="register-expert.jsp" class="mobile-menu__expert">For Experts</a>
  <c:choose>
    <c:when test="${empty userId}">
      <a href="login.jsp" class="btn btn--ghost">Login</a>
      <a href="register-buyer.jsp" class="btn btn--primary">Sign Up</a>
    </c:when>
    <c:otherwise>
      <c:choose>
        <c:when test="${userRole == 'BUYER'}">
          <a href="buyer-dashboard.jsp" class="btn btn--ghost">My Dashboard</a>
        </c:when>
        <c:when test="${userRole == 'EXPERT'}">
          <a href="expert-dashboard.jsp" class="btn btn--ghost">My Dashboard</a>
        </c:when>
        <c:when test="${userRole == 'ADMIN'}">
          <a href="admin/dashboard.jsp" class="btn btn--ghost">Admin Panel</a>
        </c:when>
      </c:choose>
      <a href="logout" class="btn btn--primary">Logout</a>
    </c:otherwise>
  </c:choose>
</div>
