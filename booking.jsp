<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="expertName" value="${not empty expert ? expert.firstName : 'Expert'}" />
<c:set var="pageTitleOverride" value="Book Session with ${expertName} — MentorMarket" />

<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/booking.css">
<style>
  .booking-page { max-width: 1200px; margin: 0 auto; padding: 120px 48px 80px; display: grid; grid-template-columns: 1fr 400px; gap: 64px; }
  .booking-sidebar { background: var(--white); border-radius: var(--radius-xl); padding: 32px; border: 1px solid var(--gray-200); height: fit-content; position: sticky; top: 100px; }
  .booking-sidebar__expert { display: flex; gap: 16px; padding-bottom: 24px; border-bottom: 1px solid var(--gray-200); margin-bottom: 24px; }
  .booking-sidebar__expert img { width: 64px; height: 64px; border-radius: 50%; object-fit: cover; }
  .booking-sidebar__expert-name { font-weight: 600; color: var(--gray-800); }
  .booking-sidebar__expert-title { font-size: 13px; color: var(--gray-500); }
  .booking-summary { display: flex; flex-direction: column; gap: 16px; }
  .booking-summary__row { display: flex; justify-content: space-between; font-size: 14px; }
  .booking-summary__total { font-weight: 700; font-size: 18px; padding-top: 16px; border-top: 1px solid var(--gray-200); }
  .session-type-card { border: 2px solid var(--gray-200); border-radius: var(--radius-lg); padding: 16px; cursor: pointer; transition: all 200ms; }
  .session-type-card:hover { border-color: var(--gold-primary); }
  .session-type-card--selected { border-color: var(--gold-primary); background: rgba(245,166,35,0.05); }
  .session-type-card input { display: none; }
  .session-type-card__header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 4px; }
  .session-type-card__title { font-weight: 600; color: var(--gray-800); }
  .session-type-card__price { font-size: 18px; font-weight: 700; color: var(--gray-800); }
  .session-type-card__desc { font-size: 13px; color: var(--gray-500); }
  .session-types-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 16px; margin-bottom: 32px; }
  .calendar-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px; }
  .calendar-grid { display: grid; grid-template-columns: repeat(7, 1fr); gap: 4px; margin-bottom: 24px; }
  .calendar-day { padding: 12px 8px; text-align: center; border-radius: var(--radius-md); cursor: pointer; transition: all 150ms; }
  .calendar-day:hover:not(.calendar-day--disabled) { background: rgba(245,166,35,0.1); }
  .calendar-day--selected { background: var(--gold-primary); color: var(--navy-deep); }
  .calendar-day--disabled { color: var(--gray-300); cursor: not-allowed; }
  .calendar-day--today { border: 2px solid var(--gold-primary); }
  .time-slots-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 8px; }
  .time-slot { padding: 12px; text-align: center; border: 1px solid var(--gray-200); border-radius: var(--radius-md); cursor: pointer; transition: all 150ms; font-size: 14px; }
  .time-slot:hover:not(.time-slot--disabled) { border-color: var(--gold-primary); }
  .time-slot--selected { background: var(--gold-primary); color: var(--navy-deep); border-color: var(--gold-primary); }
  .time-slot--disabled { color: var(--gray-300); cursor: not-allowed; }
  @media (max-width: 1024px) { .booking-page { grid-template-columns: 1fr; } .booking-sidebar { position: relative; top: 0; } }
  @media (max-width: 640px) { .session-types-grid { grid-template-columns: 1fr; } .time-slots-grid { grid-template-columns: repeat(2, 1fr); } }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/includes/navbar.jsp" />

  <div class="booking-page">
    <div class="booking-main">
      <h1 style="font-family: var(--font-heading); font-size: 32px; margin-bottom: 32px;">Book a Session</h1>
      
      <form action="book-session" method="POST" id="bookingForm">
        <input type="hidden" name="expertId" value="${param.id}">
        <input type="hidden" name="sessionType" id="selectedSessionType" value="">
        <input type="hidden" name="sessionDate" id="selectedSessionDate" value="">
        <input type="hidden" name="sessionTime" id="selectedSessionTime" value="">
        <input type="hidden" name="duration" id="selectedDuration" value="60">
        
        <section style="margin-bottom: 48px;">
          <h2 style="font-size: 20px; font-weight: 600; margin-bottom: 20px;">Select Session Type</h2>
          <div class="session-types-grid">
            <c:if test="${expert.offers30Min}">
              <label class="session-type-card" onclick="selectSessionType('30min', 1500, 30)">
                <input type="radio" name="sessionTypeRadio" value="30min">
                <div class="session-type-card__header">
                  <span class="session-type-card__title">30 Minutes</span>
                  <span class="session-type-card__price">₹<fmt:formatNumber value="${expert.hourlyRate * 0.5}" pattern="#" /></span>
                </div>
                <div class="session-type-card__desc">Quick consultation, Q&A</div>
              </label>
            </c:if>
            <c:if test="${expert.offers60Min}">
              <label class="session-type-card <c:if test='${expert.offers60Min && !expert.offers30Min}'>session-type-card--selected</c:if>" onclick="selectSessionType('60min', ${expert.hourlyRate}, 60)">
                <input type="radio" name="sessionTypeRadio" value="60min" <c:if test="${expert.offers60Min && !expert.offers30Min}">checked</c:if>>
                <div class="session-type-card__header">
                  <span class="session-type-card__title">60 Minutes</span>
                  <span class="session-type-card__price">₹<fmt:formatNumber value="${expert.hourlyRate}" pattern="#" /></span>
                </div>
                <div class="session-type-card__desc">Deep dive, strategy session</div>
              </label>
            </c:if>
            <c:if test="${expert.offers90Min}">
              <label class="session-type-card" onclick="selectSessionType('90min', ${expert.hourlyRate * 1.5}, 90)">
                <input type="radio" name="sessionTypeRadio" value="90min">
                <div class="session-type-card__header">
                  <span class="session-type-card__title">90 Minutes</span>
                  <span class="session-type-card__price">₹<fmt:formatNumber value="${expert.hourlyRate * 1.5}" pattern="#" /></span>
                </div>
                <div class="session-type-card__desc">Comprehensive review</div>
              </label>
            </c:if>
            <c:if test="${expert.offersHalfDay}">
              <label class="session-type-card" onclick="selectSessionType('halfday', ${expert.halfDayRate}, 180)">
                <input type="radio" name="sessionTypeRadio" value="halfday">
                <div class="session-type-card__header">
                  <span class="session-type-card__title">Half Day</span>
                  <span class="session-type-card__price">₹<fmt:formatNumber value="${expert.halfDayRate}" pattern="#" /></span>
                </div>
                <div class="session-type-card__desc">3-hour deep dive</div>
              </label>
            </c:if>
            <c:if test="${expert.offersFullDay}">
              <label class="session-type-card" onclick="selectSessionType('fullday', ${expert.fullDayRate}, 360)">
                <input type="radio" name="sessionTypeRadio" value="fullday">
                <div class="session-type-card__header">
                  <span class="session-type-card__title">Full Day</span>
                  <span class="session-type-card__price">₹<fmt:formatNumber value="${expert.fullDayRate}" pattern="#" /></span>
                </div>
                <div class="session-type-card__desc">6-hour workshop</div>
              </label>
            </c:if>
            <c:if test="${expert.offersRetainer}">
              <label class="session-type-card" onclick="selectSessionType('retainer', ${expert.retainerRate}, 0)">
                <input type="radio" name="sessionTypeRadio" value="retainer">
                <div class="session-type-card__header">
                  <span class="session-type-card__title">Retainer</span>
                  <span class="session-type-card__price">₹<fmt:formatNumber value="${expert.retainerRate}" pattern="#" /></span>
                </div>
                <div class="session-type-card__desc">Monthly access</div>
              </label>
            </c:if>
          </div>
        </section>
        
        <section style="margin-bottom: 48px;">
          <h2 style="font-size: 20px; font-weight: 600; margin-bottom: 20px;">Select Date & Time</h2>
          
          <div class="calendar-header">
            <button type="button" class="btn btn--ghost" onclick="changeMonth(-1)">&larr; Prev</button>
            <span id="calendarTitle" style="font-weight: 600;"><fmt:formatDate value="${currentMonth}" pattern="MMMM yyyy" /></span>
            <button type="button" class="btn btn--ghost" onclick="changeMonth(1)">Next &rarr;</button>
          </div>
          
          <div class="calendar-grid">
            <c:forEach begin="0" end="6" var="d"><div style="text-align: center; font-size: 12px; font-weight: 600; color: var(--gray-500); padding: 8px;"><c:set var="days" value="['Sun','Mon','Tue','Wed','Thu','Fri','Sat']" />${days[d]}</c:forEach>
            <div id="calendarDays" class="calendar-days"></div>
          </div>
          
          <div id="timeSlotsSection" style="display: none;">
            <h3 style="font-size: 16px; margin-bottom: 16px;">Available Time Slots</h3>
            <div id="timeSlotsGrid" class="time-slots-grid"></div>
          </div>
        </section>
        
        <section style="margin-bottom: 48px;">
          <h2 style="font-size: 20px; font-weight: 600; margin-bottom: 20px;">What would you like to discuss?</h2>
          <textarea name="notes" class="form-input" placeholder="Briefly describe what you'd like to discuss, any specific topics or questions..." rows="4"></textarea>
        </section>
      </form>
    </div>
    
    <aside class="booking-sidebar">
      <div class="booking-sidebar__expert">
        <c:choose>
          <c:when test="${not empty expert.photoPath}">
            <img src="${expert.photoPath}" alt="${expert.firstName}">
          </c:when>
          <c:otherwise>
            <div style="width: 64px; height: 64px; border-radius: 50%; background: var(--gold-primary); display: flex; align-items: center; justify-content: center; font-size: 24px; font-weight: 700; color: var(--navy-deep);">${expert.firstName.substring(0,1)}${expert.lastName.substring(0,1)}</div>
          </c:otherwise>
        </c:choose>
        <div>
          <div class="booking-sidebar__expert-name">${expert.firstName} ${expert.lastName}</div>
          <div class="booking-sidebar__expert-title">${expert.jobTitle}<c:if test="${not empty expert.company}"> at ${expert.company}</c:if></div>
          <div style="font-size: 12px; color: var(--gold-primary); margin-top: 4px;">
            <svg width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
            ${expert.rating} (${expert.reviewCount} sessions)
          </div>
        </div>
      </div>
      
      <div class="booking-summary">
        <div class="booking-summary__row">
          <span>Session Type</span>
          <span id="summaryType">60 Minute Session</span>
        </div>
        <div class="booking-summary__row">
          <span>Date</span>
          <span id="summaryDate">Select a date</span>
        </div>
        <div class="booking-summary__row">
          <span>Time</span>
          <span id="summaryTime">Select a time</span>
        </div>
        <div class="booking-summary__row">
          <span>Platform Fee (22%)</span>
          <span id="summaryPlatformFee">₹0</span>
        </div>
        <div class="booking-summary__row booking-summary__total">
          <span>Total</span>
          <span id="summaryTotal">₹<fmt:formatNumber value="${expert.hourlyRate * 1.22}" pattern="#" /></span>
        </div>
      </div>
      
      <button type="button" onclick="submitBooking()" class="btn btn--primary" style="width: 100%; height: 52px; margin-top: 24px;">
        Pay ₹<fmt:formatNumber value="${expert.hourlyRate * 1.22}" pattern="#" /> Securely
      </button>
      
      <p style="font-size: 12px; color: var(--gray-500); text-align: center; margin-top: 16px;">
        Secured by Razorpay. You won't be charged yet.
      </p>
    </aside>
  </div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

<script>
var basePrice = ${expert.hourlyRate};
var platformFeeRate = 0.22;
var selectedSessionType = '60min';
var selectedDuration = 60;
var selectedDate = null;
var selectedTime = null;

var currentMonth = new Date('<fmt:formatDate value="${currentMonth}" pattern="yyyy-MM-dd" />');

var availableDates = [
<c:choose>
  <c:when test="${not empty availableDatesList}">
    <c:forEach var="d" items="${availableDatesList}" varStatus="s"><c:if test="${s.index > 0}">, </c:if>'<fmt:formatDate value="${d}" pattern="yyyy-MM-dd" />'</c:forEach>
  </c:when>
  <c:otherwise>'2026-05-01', '2026-05-02', '2026-05-05', '2026-05-06', '2026-05-07', '2026-05-08', '2026-05-09', '2026-05-12', '2026-05-13', '2026-05-14', '2026-05-15', '2026-05-16', '2026-05-19', '2026-05-20', '2026-05-21', '2026-05-22', '2026-05-23', '2026-05-26', '2026-05-27', '2026-05-28', '2026-05-29', '2026-05-30'</c:otherwise>
</c:choose>
];

var timeSlots = [
<c:choose>
  <c:when test="${not empty timeSlotsList}">
    <c:forEach var="t" items="${timeSlotsList}" varStatus="s"><c:if test="${s.index > 0}">, </c:if>'${t}'</c:forEach>
  </c:when>
  <c:otherwise>'9:00 AM', '10:00 AM', '11:00 AM', '2:00 PM', '3:00 PM', '4:00 PM', '5:00 PM'</c:otherwise>
</c:choose>
];

function selectSessionType(type, price, duration) {
  selectedSessionType = type;
  selectedDuration = duration;
  basePrice = price;
  updateSummary();
  document.querySelectorAll('.session-type-card').forEach(c => c.classList.remove('session-type-card--selected'));
  event.currentTarget.classList.add('session-type-card--selected');
}

function updateSummary() {
  var platformFee = Math.round(basePrice * platformFeeRate);
  var total = basePrice + platformFee;
  
  document.getElementById('summaryType').textContent = selectedDuration + ' Minute Session';
  document.getElementById('summaryPlatformFee').textContent = '₹' + platformFee.toLocaleString('en-IN');
  document.getElementById('summaryTotal').textContent = '₹' + total.toLocaleString('en-IN');
  
  var btn = document.querySelector('.btn--primary');
  if (btn) btn.textContent = 'Pay ₹' + total.toLocaleString('en-IN') + ' Securely';
}

function renderCalendar() {
  var year = currentMonth.getFullYear();
  var month = currentMonth.getMonth();
  
  var firstDay = new Date(year, month, 1).getDay();
  var daysInMonth = new Date(year, month + 1, 0).getDate();
  var today = new Date();
  
  document.getElementById('calendarTitle').textContent = currentMonth.toLocaleDateString('en-IN', { month: 'long', year: 'numeric' });
  
  var html = '';
  for (var i = 0; i < firstDay; i++) html += '<div class="calendar-day"></div>';
  for (var d = 1; d <= daysInMonth; d++) {
    var date = new Date(year, month, d);
    var dateStr = date.toISOString().split('T')[0];
    var isAvailable = availableDates.includes(dateStr);
    var isPast = date < new Date(today.getFullYear(), today.getMonth(), today.getDate());
    var isToday = date.toDateString() === today.toDateString();
    var disabled = !isAvailable || isPast;
    
    html += '<div class="calendar-day' + (disabled ? ' calendar-day--disabled' : '') + (isToday ? ' calendar-day--today' : '') + '" ' +
            'onclick="' + (disabled ? '' : 'selectDate(\'' + dateStr + '\')') + '">' + d + '</div>';
  }
  document.getElementById('calendarDays').innerHTML = html;
}

function selectDate(dateStr) {
  selectedDate = dateStr;
  document.querySelectorAll('.calendar-day').forEach(d => d.classList.remove('calendar-day--selected'));
  event.target.classList.add('calendar-day--selected');
  document.getElementById('selectedSessionDate').value = dateStr;
  document.getElementById('summaryDate').textContent = new Date(dateStr).toLocaleDateString('en-IN', { weekday: 'short', month: 'short', day: 'numeric' });
  
  document.getElementById('timeSlotsSection').style.display = 'block';
  var slotsHtml = '';
  var usedSlots = ['9:00 AM', '10:00 AM', '11:00 AM', '2:00 PM'];
  timeSlots.forEach(function(slot) {
    var disabled = usedSlots.includes(slot);
    slotsHtml += '<div class="time-slot' + (disabled ? ' time-slot--disabled' : '') + '" ' +
                  'onclick="' + (disabled ? '' : 'selectTime(\'' + slot + '\')') + '">' + slot + '</div>';
  });
  document.getElementById('timeSlotsGrid').innerHTML = slotsHtml;
}

function selectTime(time) {
  selectedTime = time;
  document.querySelectorAll('.time-slot').forEach(s => s.classList.remove('time-slot--selected'));
  event.target.classList.add('time-slot--selected');
  document.getElementById('selectedSessionTime').value = time;
  document.getElementById('summaryTime').textContent = time;
}

function changeMonth(delta) {
  currentMonth.setMonth(currentMonth.getMonth() + delta);
  renderCalendar();
}

function submitBooking() {
  if (!selectedSessionType) { alert('Please select a session type'); return; }
  if (!selectedDate) { alert('Please select a date'); return; }
  if (!selectedTime) { alert('Please select a time'); return; }
  
  document.getElementById('selectedSessionType').value = selectedSessionType;
  document.getElementById('selectedDuration').value = selectedDuration;
  
  document.getElementById('bookingForm').submit();
}

renderCalendar();
updateSummary();
</script>
</body>
</html>
