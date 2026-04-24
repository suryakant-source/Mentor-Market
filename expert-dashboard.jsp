<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<jsp:include page="/WEB-INF/includes/session-check.jsp" />
<c:set var="pageTitleOverride" value="Expert Dashboard — MentorMarket" />
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
      <a href="?tab=schedule" class="sidebar__nav-item ${activeTab == 'schedule' ? 'active' : ''}">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
          <line x1="16" y1="2" x2="16" y2="6"/>
          <line x1="8" y1="2" x2="8" y2="6"/>
          <line x1="3" y1="10" x2="21" y2="10"/>
        </svg>
        My Schedule
      </a>
      <a href="?tab=earnings" class="sidebar__nav-item ${activeTab == 'earnings' ? 'active' : ''}">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <line x1="12" y1="1" x2="12" y2="23"/>
          <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
        </svg>
        Earnings
      </a>
      <a href="?tab=profile" class="sidebar__nav-item ${activeTab == 'profile' ? 'active' : ''}">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
          <circle cx="12" cy="7" r="4"/>
        </svg>
        My Profile
      </a>
      <a href="?tab=settings" class="sidebar__nav-item ${activeTab == 'settings' ? 'active' : ''}">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <circle cx="12" cy="12" r="3"/>
          <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"/>
        </svg>
        Settings
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
    <div class="main-content__header"></div>
    <div class="main-content__body">
      <c:choose>
        <c:when test="${activeTab == 'overview'}">
          <div class="welcome-header">
            <h1>Welcome back, ${session.firstName}!</h1>
            <p>Here's how your mentorship practice is doing</p>
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
              <div class="stat-card__value"><fmt:formatNumber value="${dashboardStats.totalEarnings}" type="currency" currencySymbol="₹" locale="en-IN" maxFractionDigits="0"/></div>
              <div class="stat-card__label">Total Earnings</div>
            </div>
            <div class="stat-card">
              <div class="stat-card__value">${dashboardStats.averageRating}</div>
              <div class="stat-card__label">Average Rating</div>
            </div>
          </div>
        </c:when>

        <c:when test="${activeTab == 'schedule'}">
          <div class="welcome-header">
            <h1>My Schedule</h1>
            <p>Manage your availability and upcoming sessions</p>
          </div>
          
          <div class="calendar-view">
            <div class="calendar-header">
              <button class="btn btn--ghost" onclick="previousMonth()">&larr;</button>
              <h2><fmt:formatDate value="${currentMonth}" pattern="MMMM yyyy" /></h2>
              <button class="btn btn--ghost" onclick="nextMonth()">&rarr;</button>
            </div>
            <div class="calendar-grid">
              <c:forEach items="${calendarSlots}" var="slot">
                <div class="calendar-day ${slot.hasSession ? 'has-session' : ''} ${slot.isToday ? 'today' : ''}">
                  <span class="calendar-day__number">${slot.dayOfMonth}</span>
                  <c:if test="${slot.hasSession}">
                    <span class="calendar-day__dot"></span>
                  </c:if>
                </div>
              </c:forEach>
            </div>
          </div>
        </c:when>

        <c:when test="${activeTab == 'earnings'}">
          <div class="welcome-header">
            <h1>Earnings</h1>
            <p>Track your revenue and payouts</p>
          </div>
          
          <div class="stats-grid">
            <div class="stat-card">
              <div class="stat-card__value"><fmt:formatNumber value="${dashboardStats.totalEarnings}" type="currency" currencySymbol="₹" locale="en-IN" maxFractionDigits="0"/></div>
              <div class="stat-card__label">Total Earnings</div>
            </div>
            <div class="stat-card">
              <div class="stat-card__value"><fmt:formatNumber value="${dashboardStats.thisMonthEarnings}" type="currency" currencySymbol="₹" locale="en-IN" maxFractionDigits="0"/></div>
              <div class="stat-card__label">This Month</div>
            </div>
            <div class="stat-card">
              <div class="stat-card__value"><fmt:formatNumber value="${dashboardStats.pendingPayout}" type="currency" currencySymbol="₹" locale="en-IN" maxFractionDigits="0"/></div>
              <div class="stat-card__label">Pending Payout</div>
            </div>
            <div class="stat-card">
              <div class="stat-card__value"><fmt:formatNumber value="${dashboardStats.totalPayouts}" type="currency" currencySymbol="₹" locale="en-IN" maxFractionDigits="0"/></div>
              <div class="stat-card__label">Total Paid Out</div>
            </div>
          </div>

          <div class="dashboard-section">
            <h2>Monthly Earnings</h2>
            <div class="earnings-chart">
              <c:forEach items="${monthlyEarnings}" var="month" varStatus="idx">
                <div class="earnings-bar-wrapper">
                  <div class="earnings-bar" data-earning="${month.amount}" style="--bar-height: ${month.percentage}%;"></div>
                  <span class="earnings-bar__label">${month.label}</span>
                </div>
              </c:forEach>
            </div>
          </div>

          <div class="dashboard-section">
            <h2>Recent Sessions</h2>
            <div class="sessions-list">
              <c:forEach items="${recentSessions}" var="sessionItem">
                <div class="session-card">
                  <img src="${sessionItem.buyerAvatar}" alt="${sessionItem.buyerName}" class="session-card__avatar">
                  <div class="session-card__info">
                    <h4>${sessionItem.buyerName}</h4>
                    <p>${sessionItem.sessionType}</p>
                  </div>
                  <div class="session-card__meta">
                    <span class="session-card__date"><fmt:formatDate value="${sessionItem.sessionDate}" pattern="MMM d" /></span>
                    <span class="session-card__amount"><fmt:formatNumber value="${sessionItem.amount}" type="currency" currencySymbol="₹" locale="en-IN" maxFractionDigits="0"/></span>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </c:when>

        <c:when test="${activeTab == 'profile'}">
          <div class="welcome-header">
            <h1>My Profile</h1>
            <p>Your public expert profile</p>
          </div>
          <a href="experts.jsp?id=${session.expertId}" class="btn btn--secondary">View Public Profile</a>
        </c:when>

        <c:when test="${activeTab == 'settings'}">
          <div class="welcome-header">
            <h1>Settings</h1>
            <p>Manage your account and preferences</p>
          </div>
          <div style="text-align: center; padding: 80px 40px; background: var(--white); border-radius: var(--radius-lg);">
            <p style="color: var(--gray-500);">Settings panel coming soon.</p>
          </div>
        </c:when>

        <c:otherwise>
          <div class="welcome-header">
            <h1>Welcome back, ${session.firstName}!</h1>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
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
    <a href="?tab=schedule" class="mobile-tabs__item ${activeTab == 'schedule' ? 'active' : ''}">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
        <line x1="16" y1="2" x2="16" y2="6"/>
        <line x1="8" y1="2" x2="8" y2="6"/>
        <line x1="3" y1="10" x2="21" y2="10"/>
      </svg>
      Schedule
    </a>
    <a href="?tab=earnings" class="mobile-tabs__item ${activeTab == 'earnings' ? 'active' : ''}">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <line x1="12" y1="1" x2="12" y2="23"/>
        <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
      </svg>
      Earnings
    </a>
    <a href="?tab=profile" class="mobile-tabs__item ${activeTab == 'profile' ? 'active' : ''}">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
        <circle cx="12" cy="7" r="4"/>
      </svg>
      Profile
    </a>
  </div>
</div>

<script src="js/utils.js"></script>
<script src="js/main.js"></script>
<script src="js/expert-dashboard.js"></script>
<script>
  function animateEarningsBars() {
    const bars = document.querySelectorAll('.earnings-bar');
    if (bars.length === 0) return;
    
    const maxEarning = Math.max(...Array.from(bars).map(bar => parseInt(bar.dataset.earning)));
    
    bars.forEach((bar, i) => {
      const earning = parseInt(bar.dataset.earning);
      const heightPercent = (earning / maxEarning) * 100;
      bar.style.setProperty('--bar-height', heightPercent + '%');
      bar.style.height = '0';
      
      setTimeout(() => {
        bar.style.animation = 'barGrow 600ms var(--ease-spring) forwards';
      }, 100 + (i * 100));
    });
  }

  document.addEventListener('DOMContentLoaded', function() {
    if (window.location.search.includes('tab=earnings')) {
      setTimeout(animateEarningsBars, 100);
    }
  });
</script>
</body>
</html>
