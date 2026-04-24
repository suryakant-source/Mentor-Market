<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="expertName" value="${not empty expert ? expert.firstName : 'Expert'}" />
<c:set var="pageTitleOverride" value="${expertName} — MentorMarket" />

<jsp:include page="/WEB-INF/includes/head.jsp" />

<link rel="stylesheet" href="css/profile.css">
</head>
<body>

<jsp:include page="/WEB-INF/includes/navbar.jsp" />

  <div class="profile-page">
    <div class="profile-layout">
      <aside class="identity-panel">
        <c:choose>
          <c:when test="${not empty expert}">
            <div class="identity-panel__photo">
              <c:choose>
                <c:when test="${not empty expert.photoPath}">
                  <img src="${expert.photoPath}" alt="${expert.firstName}" onerror="this.style.display='none'">
                </c:when>
                <c:otherwise>
                  <div class="identity-panel__placeholder">${expert.firstName.substring(0,1)}${expert.lastName.substring(0,1)}</div>
                </c:otherwise>
              </c:choose>
              <c:if test="${expert.verified}">
                <span class="identity-panel__verified-badge">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
                </span>
              </c:if>
            </div>
            <h1 class="identity-panel__name">${expert.firstName} ${expert.lastName}</h1>
            <p class="identity-panel__title">${expert.jobTitle}<c:if test="${not empty expert.company}"> at ${expert.company}</c:if></p>
            <p class="identity-panel__domain">${not empty domain ? domain.name : 'Industry Expert'}</p>
            
            <div class="identity-panel__rating">
              <c:set var="fullStars" value="${Math.floor(averageRating)}" />
              <c:set var="hasHalfStar" value="${averageRating - fullStars >= 0.5}" />
              <div class="identity-panel__stars">
                <c:forEach begin="1" end="5" var="i">
                  <svg viewBox="0 0 24 24" fill="${i <= fullStars ? 'currentColor' : 'none'}" stroke="currentColor" stroke-width="2">
                    <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                  </svg>
                </c:forEach>
              </div>
              <span class="identity-panel__rating-value">${averageRating}</span>
              <span class="identity-panel__review-count">(${reviewCount} reviews)</span>
            </div>
            
            <div class="identity-panel__stats">
              <div class="identity-panel__stat">
                <span class="identity-panel__stat-value">${expert.yearsExperience}+</span>
                <span class="identity-panel__stat-label">Years Exp.</span>
              </div>
              <div class="identity-panel__stat">
                <span class="identity-panel__stat-value">${expert.sessionsCompleted}</span>
                <span class="identity-panel__stat-label">Sessions</span>
              </div>
              <div class="identity-panel__stat">
                <span class="identity-panel__stat-value">${expert.responseTime}</span>
                <span class="identity-panel__stat-label">Response</span>
              </div>
            </div>
          </c:when>
          <c:otherwise>
            <div class="identity-panel__photo">
              <div class="identity-panel__placeholder">E</div>
            </div>
            <h1 class="identity-panel__name">Expert Profile</h1>
            <p class="identity-panel__title">Expert</p>
          </c:otherwise>
        </c:choose>
      </aside>

      <main class="content-panel">
        <c:if test="${not empty expert}">
          <section class="content-section">
            <h2 class="content-section__title">About</h2>
            <div class="content-section__body">
              <p>${expert.bio}</p>
            </div>
          </section>

          <c:if test="${not empty expert.careerHighlights && fn:length(expert.careerHighlights) > 0}">
            <section class="content-section">
              <h2 class="content-section__title">Career Highlights</h2>
              <ul class="highlights-list">
                <c:forEach var="highlight" items="${expert.careerHighlights}">
                  <li class="highlights-list__item">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                      <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/>
                    </svg>
                    <span>${highlight}</span>
                  </li>
                </c:forEach>
              </ul>
            </section>
          </c:if>

          <c:if test="${not empty expert.expertiseAreas && fn:length(expert.expertiseAreas) > 0}">
            <section class="content-section">
              <h2 class="content-section__title">Areas of Expertise</h2>
              <div class="expertise-tags">
                <c:forEach var="area" items="${expert.expertiseAreas}">
                  <span class="expertise-tag">${area}</span>
                </c:forEach>
              </div>
            </section>
          </c:if>

          <c:if test="${not empty reviewsList && fn:length(reviewsList) > 0}">
            <section class="content-section">
              <h2 class="content-section__title">Reviews</h2>
              <div class="reviews-list">
<c:forEach var="review" items="${reviewsList}" varStatus="status">
                  <div class="review-card" style="${status.index >= 4 ? 'display:none' : ''}">
                    <div class="review-card__header">
                      <div class="review-card__author">
                        <div class="review-card__avatar">${review.reviewerFirstName} ${fn:substring(review.reviewerLastName, 0, 1)}.</div>
                        <div class="review-card__meta">
                          <span class="review-card__name">${review.reviewerFirstName} ${fn:substring(review.reviewerLastName, 0, 1)}.</span>
                          <span class="review-card__date"><fmt:formatDate value="${review.createdAt}" pattern="MMM yyyy" /></span>
                        </div>
                      </div>
                      <div class="review-card__rating">
                        <c:forEach begin="1" end="5" var="i">
                          <svg viewBox="0 0 24 24" fill="${i <= review.rating ? 'currentColor' : 'none'}" stroke="currentColor" stroke-width="2">
                            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                          </svg>
                        </c:forEach>
                      </div>
                    </div>
                    <p class="review-card__text">${review.feedback}</p>
                  </div>
                </c:forEach>
                <c:if test="${fn:length(reviewsList) > 4}">
                  <button class="reviews-show-more" onclick="this.previousElementSibling.querySelectorAll('.review-card').forEach(el => el.style.display = el.style.display === 'none' ? 'block' : 'none'); this.textContent = this.textContent.includes('Show') ? 'Show less' : 'Show ${fn:length(reviewsList) - 4} more'">
                    Show ${fn:length(reviewsList) - 4} more reviews
                  </button>
                </c:if>
              </div>
            </section>
          </c:if>
        </c:if>
      </main>

      <aside class="booking-panel">
        <c:if test="${not empty expert}">
          <div class="booking-panel__rate">
            <span class="booking-panel__rate-label">Starting at</span>
            <span class="booking-panel__rate-value">
              <fmt:formatNumber value="${expert.hourlyRate}" type="currency" currencySymbol="₹" locale="en-IN" />
            </span>
            <span class="booking-panel__rate-period">/ hour</span>
          </div>

          <c:if test="${expert.offersHourly}">
            <div class="session-type-card" onclick="window.location.href='booking.jsp?id=${expert.id}&type=hourly'">
              <div class="session-type-card__header">
                <span class="session-type-card__title">Hourly Session</span>
                <span class="session-type-card__price">
                  <fmt:formatNumber value="${expert.hourlyRate}" type="currency" currencySymbol="₹" locale="en-IN" />
                </span>
              </div>
              <p class="session-type-card__desc">1-on-1 video consultation</p>
            </div>
          </c:if>

          <c:if test="${expert.offersHalfDay}">
            <div class="session-type-card" onclick="window.location.href='booking.jsp?id=${expert.id}&type=halfday'">
              <div class="session-type-card__header">
                <span class="session-type-card__title">Half Day</span>
                <span class="session-type-card__price">
                  <fmt:formatNumber value="${expert.halfDayRate}" type="currency" currencySymbol="₹" locale="en-IN" />
                </span>
              </div>
              <p class="session-type-card__desc">3-hour deep dive session</p>
            </div>
          </c:if>

          <c:if test="${expert.offersFullDay}">
            <div class="session-type-card" onclick="window.location.href='booking.jsp?id=${expert.id}&type=fullday'">
              <div class="session-type-card__header">
                <span class="session-type-card__title">Full Day</span>
                <span class="session-type-card__price">
                  <fmt:formatNumber value="${expert.fullDayRate}" type="currency" currencySymbol="₹" locale="en-IN" />
                </span>
              </div>
              <p class="session-type-card__desc">6-hour intensive workshop</p>
            </div>
          </c:if>

          <c:if test="${expert.offersRetainer}">
            <div class="session-type-card session-type-card--highlighted" onclick="window.location.href='booking.jsp?id=${expert.id}&type=retainer'">
              <span class="session-type-card__badge">Most Popular</span>
              <div class="session-type-card__header">
                <span class="session-type-card__title">Monthly Retainer</span>
                <span class="session-type-card__price">
                  <fmt:formatNumber value="${expert.retainerRate}" type="currency" currencySymbol="₹" locale="en-IN" />
                </span>
              </div>
              <p class="session-type-card__desc">Ongoing advisory access</p>
            </div>
          </c:if>

          <div class="booking-panel__availability">
            <h4>Available Time Slots</h4>
            <div class="time-slots">
              <c:choose>
                <c:when test="${not empty availableSlots}">
                  <c:forEach var="slot" items="${availableSlots}">
                    <button class="time-slot" <c:if test="${!slot.available}">disabled</c:if>>${slot.time}</button>
                  </c:forEach>
                </c:when>
                <c:otherwise>
                  <button class="time-slot">9:00 AM</button>
                  <button class="time-slot">11:00 AM</button>
                  <button class="time-slot">2:00 PM</button>
                  <button class="time-slot">4:00 PM</button>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </c:if>
      </aside>
    </div>
  </div>

  <div class="mobile-booking-bar">
    <c:if test="${not empty expert}">
      <div>
        <div class="mobile-booking-bar__price">
          <fmt:formatNumber value="${expert.hourlyRate}" type="currency" currencySymbol="₹" locale="en-IN" />
        </div>
        <div class="mobile-booking-bar__label">per hour</div>
      </div>
      <button class="btn btn--primary" onclick="document.querySelector('.booking-panel').scrollIntoView({behavior: 'smooth'})">See Booking Options</button>
    </c:if>
  </div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />

  <script src="js/main.js"></script>
</body>
</html>
