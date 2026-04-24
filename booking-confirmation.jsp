<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="pageTitleOverride" value="Booking Confirmed — MentorMarket" />

<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/booking.css">
<style>
  .confirmation-page { max-width: 600px; margin: 0 auto; padding: 120px 24px 80px; text-align: center; }
  .confirmation-animation { margin-bottom: 32px; }
  .confirmation-circle { width: 120px; height: 120px; margin: 0 auto; position: relative; }
  .confirmation-circle svg { width: 100%; height: 100%; transform: rotate(-90deg); }
  .confirmation-circle__bg { fill: none; stroke: var(--gray-200); stroke-width: 4; }
  .confirmation-circle__progress { fill: none; stroke: var(--gold-primary); stroke-width: 4; stroke-dasharray: 352; stroke-dashoffset: 352; animation: circleProgress 1s ease-out 0.5s forwards; }
  @keyframes circleProgress { to { stroke-dashoffset: 0; } }
  .confirmation-circle__checkmark { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 50px; height: 50px; }
  .confirmation-circle__checkmark path { fill: none; stroke: var(--gold-primary); stroke-width: 3; stroke-linecap: round; stroke-linejoin: round; stroke-dasharray: 50; stroke-dashoffset: 50; animation: checkDraw 0.5s ease-out 1s forwards; }
  @keyframes checkDraw { to { stroke-dashoffset: 0; } }
  .confirmation-title { font-family: var(--font-heading); font-size: 36px; font-weight: 700; margin-bottom: 8px; }
  .confirmation-subtitle { font-size: 18px; color: var(--gray-600); margin-bottom: 32px; }
  .confirmation-card { background: var(--white); border-radius: var(--radius-xl); padding: 32px; border: 1px solid var(--gray-200); text-align: left; margin-bottom: 32px; }
  .confirmation-card h3 { font-size: 16px; font-weight: 600; margin-bottom: 20px; }
  .booking-details { display: flex; flex-direction: column; gap: 16px; }
  .booking-detail { display: flex; justify-content: space-between; align-items: flex-start; }
  .booking-detail__label { font-size: 14px; color: var(--gray-500); }
  .booking-detail__value { font-size: 14px; font-weight: 600; color: var(--gray-800); }
  .booking-detail__value--highlight { color: var(--gold-primary); font-size: 18px; }
  .meeting-link-row { display: flex; align-items: center; gap: 8px; }
  .meeting-link-row__url { font-family: monospace; font-size: 12px; color: var(--gold-primary); background: rgba(245,166,35,0.1); padding: 4px 8px; border-radius: 4px; }
  .copy-link-btn { font-size: 12px; padding: 4px 8px; border: 1px solid var(--gray-200); border-radius: 4px; background: var(--white); cursor: pointer; }
  .copy-link-btn:hover { border-color: var(--gold-primary); }
  .copy-link-btn.copied { background: var(--gold-primary); color: var(--navy-deep); border-color: var(--gold-primary); }
  .confirmation-actions { display: flex; flex-direction: column; gap: 12px; }
  .toast { position: fixed; bottom: 24px; left: 50%; transform: translateX(-50%) translateY(100px); background: var(--gray-800); color: var(--white); padding: 12px 24px; border-radius: var(--radius-lg); display: flex; align-items: center; gap: 12px; font-size: 14px; transition: transform 300ms; z-index: 1000; }
  .toast.show { transform: translateX(-50%) translateY(0); }
  .toast svg { width: 20px; height: 20px; stroke: var(--gold-primary); }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/includes/navbar.jsp" />

  <div class="confirmation-page">
    <div class="confirmation-animation">
      <div class="confirmation-circle">
        <svg viewBox="0 0 120 120">
          <circle class="confirmation-circle__bg" cx="60" cy="60" r="56"/>
          <circle class="confirmation-circle__progress" cx="60" cy="60" r="56"/>
        </svg>
        <svg class="confirmation-circle__checkmark" viewBox="0 0 50 50">
          <path d="M12 25 L22 35 L38 15"/>
        </svg>
      </div>
    </div>

    <h1 class="confirmation-title">Booking Confirmed!</h1>
    <p class="confirmation-subtitle">Your session with ${session.expertName} is ready.</p>

    <div class="confirmation-card">
      <h3>Session Details</h3>
      <div class="booking-details">
        <div class="booking-detail">
          <span class="booking-detail__label">Expert</span>
          <span class="booking-detail__value">${session.expertName}</span>
        </div>
        <div class="booking-detail">
          <span class="booking-detail__label">Session Type</span>
          <span class="booking-detail__value">${session.duration} Minute Session</span>
        </div>
        <div class="booking-detail">
          <span class="booking-detail__label">Date</span>
          <span class="booking-detail__value"><fmt:formatDate value="${session.sessionDate}" pattern="EEEE, MMMM d, yyyy" /></span>
        </div>
        <div class="booking-detail">
          <span class="booking-detail__label">Time</span>
          <span class="booking-detail__value">${session.startTime} - ${session.endTime}</span>
        </div>
        <div class="booking-detail">
          <span class="booking-detail__label">Amount Paid</span>
          <span class="booking-detail__value booking-detail__value--highlight"><fmt:formatNumber value="${session.totalAmount}" type="currency" currencySymbol="₹" locale="en-IN" /></span>
        </div>
        <div class="booking-detail">
          <span class="booking-detail__label">Booking ID</span>
          <span class="booking-detail__value">#${session.bookingId}</span>
        </div>
        <c:if test="${not empty session.meetingLink}">
          <div class="booking-detail">
            <span class="booking-detail__label">Meeting Link</span>
            <div class="meeting-link-row">
              <span class="meeting-link-row__url">${session.meetingLink}</span>
              <button type="button" class="copy-link-btn" onclick="copyLink('${session.meetingLink}')">Copy</button>
            </div>
          </div>
        </c:if>
      </div>
    </div>

    <div class="confirmation-actions">
      <a href="https://calendar.google.com/calendar/render?action=TEMPLATE&text=${session.expertName}+Mentorship+Session&dates=${session.gCalStart}/${session.gCalEnd}&details=Join+at+${session.meetingLink}" target="_blank" class="btn btn--secondary">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
        Add to Google Calendar
      </a>
      <a href="buyer-dashboard.jsp" class="btn btn--primary">View in Dashboard</a>
      <a href="experts.jsp" class="btn btn--secondary" style="border-color: var(--gold-primary); color: var(--gold-primary);">Book Another Expert</a>
    </div>
  </div>

  <div class="toast" id="toast">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
    <span>Meeting link copied to clipboard!</span>
  </div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

<script>
function copyLink(url) {
  navigator.clipboard.writeText(url).then(function() {
    var btn = event.target;
    btn.textContent = 'Copied!';
    btn.classList.add('copied');
    document.getElementById('toast').classList.add('show');
    setTimeout(function() {
      document.getElementById('toast').classList.remove('show');
    }, 2000);
    setTimeout(function() {
      btn.textContent = 'Copy';
      btn.classList.remove('copied');
    }, 3000);
  });
}
</script>
</body>
</html>
