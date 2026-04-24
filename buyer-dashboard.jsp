<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<jsp:include page="/WEB-INF/includes/session-check.jsp" />
<c:set var="pageTitleOverride" value="Dashboard — MentorMarket" />
<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/dashboard.css">
<style>
  @keyframes barGrow {
    from { height: 0 !important; }
    to { height: var(--bar-height); }
  }
</style>
</head>
<body>

<div class="dashboard">
  <aside class="sidebar">
    <div class="sidebar__logo">
      <svg viewBox="0 0 32 32" fill="none">
        <rect width="32" height="32" rx="6" fill="#F5A623"/>
        <path d="M9 16L13 20L23 11" stroke="#0A1628" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
      MentorMarket
    </div>

    <nav class="sidebar__nav">
      <a href="?tab=overview" class="sidebar__nav-item ${activeTab == 'overview' ? 'active' : ''}">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <rect x="3" y="3" width="7" height="7"/>
          <rect x="14" y="3" width="7" height="7"/>
          <rect x="14" y="14" width="7" height="7"/>
          <rect x="3" y="14" width="7" height="7"/>
        </svg>
        Overview
      </a>
      <a href="?tab=sessions" class="sidebar__nav-item ${activeTab == 'sessions' ? 'active' : ''}">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
          <line x1="16" y1="2" x2="16" y2="6"/>
          <line x1="8" y1="2" x2="8" y2="6"/>
          <line x1="3" y1="10" x2="21" y2="10"/>
        </svg>
        My Sessions
      </a>
      <a href="?tab=experts" class="sidebar__nav-item ${activeTab == 'experts' ? 'active' : ''}">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <circle cx="11" cy="11" r="8"/>
          <line x1="21" y1="21" x2="16.65" y2="16.65"/>
        </svg>
        Find an Expert
      </a>
      <a href="?tab=settings" class="sidebar__nav-item ${activeTab == 'settings' ? 'active' : ''}">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <circle cx="12" cy="12" r="3"/>
          <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"/>
        </svg>
        Account Settings
      </a>
    </nav>

    <div class="sidebar__user">
      <img src="${session.avatarUrl}" alt="${session.firstName}" class="sidebar__user-avatar">
      <div class="sidebar__user-info">
        <div class="sidebar__user-name">${session.firstName}</div>
        <a href="logout.jsp" class="sidebar__user-logout">Logout</a>
      </div>
    </div>
  </aside>

  <main class="main-content">
    <c:choose>
      <c:when test="${activeTab == 'overview'}">
        <div class="welcome-header">
          <h1>Welcome back, ${session.firstName}!</h1>
          <p>Here's your mentorship journey at a glance</p>
        </div>
        
        <div class="stats-grid">
          <div class="stat-card">
            <div class="stat-card__value">${dashboardStats.sessionsCompleted}</div>
            <div class="stat-card__label">Sessions Completed</div>
          </div>
          <div class="stat-card">
            <div class="stat-card__value">${dashboardStats.sessionsScheduled}</div>
            <div class="stat-card__label">Upcoming Sessions</div>
          </div>
          <div class="stat-card">
            <div class="stat-card__value"><fmt:formatNumber value="${dashboardStats.totalSpent}" type="currency" currencySymbol="₹" locale="en-IN" maxFractionDigits="0"/></div>
            <div class="stat-card__label">Total Invested</div>
          </div>
          <div class="stat-card">
            <div class="stat-card__value">${dashboardStats.expertsBooked}</div>
            <div class="stat-card__label">Experts Booked</div>
          </div>
        </div>

        <c:if test="${not empty dashboardStats.recentSessions}">
          <div class="dashboard-section">
            <h2>Recent Sessions</h2>
            <div class="sessions-list">
              <c:forEach items="${dashboardStats.recentSessions}" var="sessionItem">
                <div class="session-card">
                  <img src="${sessionItem.expertAvatar}" alt="${sessionItem.expertName}" class="session-card__avatar">
                  <div class="session-card__info">
                    <h4>${sessionItem.expertName}</h4>
                    <p>${sessionItem.expertTitle}</p>
                  </div>
                  <div class="session-card__meta">
                    <span class="session-card__date"><fmt:formatDate value="${sessionItem.sessionDate}" pattern="MMM d, yyyy" /></span>
                    <span class="session-card__status session-card__status--${sessionItem.status}">${sessionItem.status}</span>
                  </div>
                  <c:if test="${sessionItem.status == 'completed'}">
                    <button class="btn btn--secondary btn--sm" onclick="openReviewModal('${sessionItem.bookingId}')">Review</button>
                  </c:if>
                </div>
              </c:forEach>
            </div>
          </div>
        </c:if>
      </c:when>

      <c:when test="${activeTab == 'sessions'}">
        <div class="welcome-header">
          <h1>My Sessions</h1>
          <p>View and manage your mentorship sessions</p>
        </div>
        
        <div class="tabs">
          <a href="?tab=sessions&status=upcoming" class="tab ${sessionStatus == 'upcoming' ? 'active' : ''}">Upcoming</a>
          <a href="?tab=sessions&status=past" class="tab ${sessionStatus == 'past' ? 'active' : ''}">Past</a>
          <a href="?tab=sessions&status=cancelled" class="tab ${sessionStatus == 'cancelled' ? 'active' : ''}">Cancelled</a>
        </div>

        <c:choose>
          <c:when test="${empty allSessions}">
            <div class="empty-state">
              <p>No ${sessionStatus} sessions found.</p>
              <a href="experts.jsp" class="btn btn--primary">Find an Expert</a>
            </div>
          </c:when>
          <c:otherwise>
            <div class="sessions-list">
              <c:forEach items="${allSessions}" var="sessionItem">
                <div class="session-card">
                  <img src="${sessionItem.expertAvatar}" alt="${sessionItem.expertName}" class="session-card__avatar">
                  <div class="session-card__info">
                    <h4>${sessionItem.expertName}</h4>
                    <p>${sessionItem.expertTitle}</p>
                  </div>
                  <div class="session-card__meta">
                    <span class="session-card__date"><fmt:formatDate value="${sessionItem.sessionDate}" pattern="MMM d, yyyy" /> at ${sessionItem.startTime}</span>
                    <span class="session-card__status session-card__status--${sessionItem.status}">${sessionItem.status}</span>
                  </div>
                  <c:if test="${sessionItem.status == 'confirmed'}">
                    <a href="booking-confirmation.jsp?id=${sessionItem.bookingId}" class="btn btn--primary btn--sm">Join Session</a>
                  </c:if>
                </div>
              </c:forEach>
            </div>
          </c:otherwise>
        </c:choose>
      </c:when>

      <c:when test="${activeTab == 'experts'}">
        <div class="welcome-header">
          <h1>Find an Expert</h1>
          <p>Browse our verified industry experts</p>
        </div>
        <div style="text-align: center; padding: 80px 40px; background: var(--white); border-radius: var(--radius-lg);">
          <a href="experts.jsp" class="btn btn--primary" style="padding: 16px 32px; font-size: 16px;">Browse All Experts</a>
        </div>
      </c:when>

      <c:when test="${activeTab == 'settings'}">
        <div class="welcome-header">
          <h1>Account Settings</h1>
          <p>Manage your profile and preferences</p>
        </div>
        <div style="text-align: center; padding: 80px 40px; background: var(--white); border-radius: var(--radius-lg);">
          <p style="color: var(--gray-500);">Settings panel coming soon.</p>
        </div>
      </c:when>

      <c:otherwise>
        <div class="welcome-header">
          <h1>Welcome back, ${session.firstName}!</h1>
          <p>Here's your mentorship journey at a glance</p>
        </div>
      </c:otherwise>
    </c:choose>
  </main>

  <div class="mobile-tabs">
    <a href="?tab=overview" class="mobile-tabs__item ${activeTab == 'overview' ? 'active' : ''}">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <rect x="3" y="3" width="7" height="7"/>
        <rect x="14" y="3" width="7" height="7"/>
        <rect x="14" y="14" width="7" height="7"/>
        <rect x="3" y="14" width="7" height="7"/>
      </svg>
      Overview
    </a>
    <a href="?tab=sessions" class="mobile-tabs__item ${activeTab == 'sessions' ? 'active' : ''}">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
        <line x1="16" y1="2" x2="16" y2="6"/>
        <line x1="8" y1="2" x2="8" y2="6"/>
        <line x1="3" y1="10" x2="21" y2="10"/>
      </svg>
      Sessions
    </a>
    <a href="?tab=experts" class="mobile-tabs__item ${activeTab == 'experts' ? 'active' : ''}">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="11" cy="11" r="8"/>
        <line x1="21" y1="21" x2="16.65" y2="16.65"/>
      </svg>
      Experts
    </a>
    <a href="?tab=settings" class="mobile-tabs__item ${activeTab == 'settings' ? 'active' : ''}">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="12" cy="12" r="3"/>
        <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"/>
      </svg>
      Settings
    </a>
  </div>
</div>

<div class="modal-overlay" id="rateModal">
  <div class="modal-card">
    <div class="modal-card__header">
      <div class="modal-card__expert">
        <img src="" alt="">
        <div>
          <h4></h4>
          <p></p>
        </div>
      </div>
    </div>
    <h3>How was your session?</h3>
    <div class="star-rating">
      <c:forEach begin="1" end="5" var="i">
        <div class="star-rating__star" data-rating="${i}">
          <svg viewBox="0 0 24 24" fill="currentColor">
            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
          </svg>
        </div>
      </c:forEach>
    </div>
    <textarea class="form-input" placeholder="Share your experience (optional)..."></textarea>
    <div class="modal-card__actions">
      <button class="btn btn--primary submit-review">Submit Review</button>
      <span class="modal-card__skip">Skip for now</span>
    </div>
  </div>
</div>

<script src="js/utils.js"></script>
<script src="js/main.js"></script>
<script src="js/dashboard.js"></script>
</body>
</html>
