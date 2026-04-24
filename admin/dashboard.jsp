<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<jsp:include page="/WEB-INF/includes/session-check.jsp" />
<c:set var="pageTitleOverride" value="Admin Dashboard — MentorMarket" />
<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="admin/admin.css">
</head>
<body>

<div class="admin-page">
  <nav class="admin-navbar">
    <div class="admin-navbar__brand">
      <div class="admin-navbar__logo">
        <svg viewBox="0 0 28 28" fill="none">
          <rect width="28" height="28" rx="6" fill="#F5A623"/>
          <path d="M8 14L11 17L20 9" stroke="#0A1628" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        MentorMarket
        <span class="admin-navbar__badge">ADMIN</span>
      </div>
    </div>

    <div class="admin-navbar__tabs">
      <a href="?tab=pending" class="admin-navbar__tab ${activeTab == 'pending' ? 'active' : ''}">Pending Reviews</a>
      <a href="?tab=sessions" class="admin-navbar__tab ${activeTab == 'sessions' ? 'active' : ''}">All Sessions</a>
      <a href="?tab=earnings" class="admin-navbar__tab ${activeTab == 'earnings' ? 'active' : ''}">Earnings</a>
      <a href="?tab=users" class="admin-navbar__tab ${activeTab == 'users' ? 'active' : ''}">Users</a>
      <a href="?tab=messages" class="admin-navbar__tab ${activeTab == 'messages' ? 'active' : ''}">Messages</a>
    </div>

    <div class="admin-navbar__user">
      <span class="admin-navbar__user-name">${session.firstName}</span>
      <div class="admin-navbar__user-avatar">${session.initials}</div>
    </div>
  </nav>

  <main class="admin-content">
    <c:choose>
      <c:when test="${activeTab == 'pending'}">
        <div class="admin-tab active" id="pending-tab">
          <div class="admin-page-header">
            <h2>Pending Applications</h2>
            <span class="count-chip">
              <span class="count-chip__number">${pendingApplications.size()}</span> Applications Pending
            </span>
          </div>
          <c:choose>
            <c:when test="${empty pendingApplications}">
              <div class="admin-card" style="text-align: center; padding: 80px;">
                <p style="color: var(--gray-500);">No pending applications.</p>
              </div>
            </c:when>
            <c:otherwise>
              <div class="applications-list">
                <c:forEach items="${pendingApplications}" var="app">
                  <div class="application-card" onclick="openProfileDrawer('${app.expertId}')">
                    <img src="${app.avatarUrl}" alt="${app.name}" class="application-card__avatar">
                    <div class="application-card__info">
                      <h4>${app.name}</h4>
                      <p>${app.title}</p>
                    </div>
                    <div class="application-card__meta">
                      <span class="application-card__badge">${app.domain}</span>
                      <span class="application-card__date">Applied <fmt:formatDate value="${app.appliedDate}" pattern="MMM d" /></span>
                    </div>
                  </div>
                </c:forEach>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </c:when>

      <c:when test="${activeTab == 'sessions'}">
        <div class="admin-tab active" id="sessions-tab">
          <div class="admin-page-header">
            <h2>All Sessions</h2>
          </div>
          <form class="data-table-filters" action="" method="get">
            <input type="hidden" name="tab" value="sessions">
            <div class="form-select-wrapper">
              <select name="status" class="form-input" style="height: 44px; font-size: 14px;">
                <option value="">All Status</option>
                <option value="pending" ${param.status == 'pending' ? 'selected' : ''}>Pending</option>
                <option value="confirmed" ${param.status == 'confirmed' ? 'selected' : ''}>Confirmed</option>
                <option value="completed" ${param.status == 'completed' ? 'selected' : ''}>Completed</option>
                <option value="cancelled" ${param.status == 'cancelled' ? 'selected' : ''}>Cancelled</option>
              </select>
            </div>
            <div class="form-input-wrapper">
              <input type="date" name="fromDate" class="form-input" value="${param.fromDate}" style="height: 44px; font-size: 14px;">
            </div>
            <div class="form-input-wrapper">
              <input type="date" name="toDate" class="form-input" value="${param.toDate}" style="height: 44px; font-size: 14px;">
            </div>
            <div class="form-input-wrapper">
              <input type="text" name="search" class="form-input" placeholder="Search..." value="${param.search}" style="height: 44px; font-size: 14px;">
            </div>
            <button type="submit" class="btn btn--secondary" style="position: relative;">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <circle cx="11" cy="11" r="8"/>
                <line x1="21" y1="21" x2="16.65" y2="16.65"/>
              </svg>
              Search
            </button>
          </form>
          
          <c:choose>
            <c:when test="${empty allSessions}">
              <div class="admin-card" style="text-align: center; padding: 80px;">
                <p style="color: var(--gray-500);">No sessions found.</p>
              </div>
            </c:when>
            <c:otherwise>
              <div class="data-table">
                <table>
                  <thead>
                    <tr>
                      <th>Booking ID</th>
                      <th>Expert</th>
                      <th>Buyer</th>
                      <th>Date</th>
                      <th>Status</th>
                      <th>Amount</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${allSessions}" var="session">
                      <tr>
                        <td>#${session.bookingId}</td>
                        <td>${session.expertName}</td>
                        <td>${session.buyerName}</td>
                        <td><fmt:formatDate value="${session.sessionDate}" pattern="MMM d, yyyy" /></td>
                        <td><span class="status-badge status-badge--${session.status}">${session.status}</span></td>
                        <td><fmt:formatNumber value="${session.amount}" type="currency" currencySymbol="₹" locale="en-IN" maxFractionDigits="0"/></td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </c:when>

      <c:when test="${activeTab == 'earnings'}">
        <div class="admin-tab active" id="earnings-tab">
          <div class="admin-page-header">
            <h2>Platform Earnings</h2>
          </div>
          <div class="admin-stats-grid">
            <div class="admin-stat-card">
              <div class="admin-stat-card__value"><fmt:formatNumber value="${platformStats.totalGMV}" type="currency" currencySymbol="₹" locale="en-IN" maxFractionDigits="0"/></div>
              <div class="admin-stat-card__label">Total GMV</div>
              <div class="admin-stat-card__trend admin-stat-card__trend--up">↑ ${platformStats.gmvGrowth}% from last month</div>
            </div>
            <div class="admin-stat-card">
              <div class="admin-stat-card__value"><fmt:formatNumber value="${platformStats.totalRevenue}" type="currency" currencySymbol="₹" locale="en-IN" maxFractionDigits="0"/></div>
              <div class="admin-stat-card__label">Total Platform Revenue</div>
              <div class="admin-stat-card__trend admin-stat-card__trend--up">↑ ${platformStats.revenueGrowth}% from last month</div>
            </div>
            <div class="admin-stat-card">
              <div class="admin-stat-card__value"><fmt:formatNumber value="${platformStats.thisMonthRevenue}" type="currency" currencySymbol="₹" locale="en-IN" maxFractionDigits="0"/></div>
              <div class="admin-stat-card__label">This Month's Revenue</div>
              <div class="admin-stat-card__trend admin-stat-card__trend--up">↑ ${platformStats.monthGrowth}% from last month</div>
            </div>
          </div>
          <div class="admin-chart-card">
            <div class="admin-chart-card__header">
              <h3>Monthly Revenue</h3>
              <span class="admin-chart-card__period">Last 6 months</span>
            </div>
            <div class="admin-chart">
              <c:forEach items="${monthlyRevenue}" var="month">
                <div class="chart-bar" data-value="${month.value}">
                  <div class="chart-bar__value"><fmt:formatNumber value="${month.value}" type="currency" currencySymbol="₹" locale="en-IN" maxFractionDigits="0"/></div>
                  <div class="chart-bar__fill" style="height: ${month.percentage}%;"></div>
                  <div class="chart-bar__label">${month.label}</div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </c:when>

      <c:when test="${activeTab == 'users'}">
        <div class="admin-tab active" id="users-tab">
          <div class="admin-page-header">
            <h2>Users</h2>
          </div>
          <div class="admin-card" style="text-align: center; padding: 80px;">
            <p style="color: var(--gray-500);">Users management panel coming soon.</p>
          </div>
        </div>
      </c:when>

      <c:when test="${activeTab == 'messages'}">
        <div class="admin-tab active" id="messages-tab">
          <div class="admin-page-header">
            <h2>Messages</h2>
          </div>
          <div class="admin-card" style="text-align: center; padding: 80px;">
            <p style="color: var(--gray-500);">Messages panel coming soon.</p>
          </div>
        </div>
      </c:when>

      <c:otherwise>
        <div class="admin-tab active" id="pending-tab">
          <div class="admin-page-header">
            <h2>Pending Applications</h2>
          </div>
        </div>
      </c:otherwise>
    </c:choose>
  </main>
</div>

<div class="drawer-overlay"></div>
<div class="profile-drawer">
  <div class="profile-drawer__header">
    <h3>Expert Profile</h3>
    <div class="profile-drawer__close">
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <line x1="18" y1="6" x2="6" y2="18"/>
        <line x1="6" y1="6" x2="18" y2="18"/>
      </svg>
    </div>
  </div>
  <img src="" alt="" class="profile-drawer__photo">
  <div class="profile-drawer__content"></div>
  <div class="profile-drawer__actions">
    <form action="" method="post">
      <input type="hidden" name="action" value="approve">
      <input type="hidden" name="expertId" id="drawerExpertId">
      <button type="submit" class="btn btn--approve">Approve</button>
    </form>
    <form action="" method="post">
      <input type="hidden" name="action" value="reject">
      <input type="hidden" name="expertId" id="drawerExpertIdReject">
      <button type="submit" class="btn btn--reject">Reject</button>
    </form>
  </div>
</div>

<div class="admin-toast" id="admin-toast">
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
    <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
    <polyline points="22 4 12 14.01 9 11.01"/>
  </svg>
  <span></span>
</div>

<script src="js/utils.js"></script>
<script src="admin/admin.js"></script>
</body>
</html>
