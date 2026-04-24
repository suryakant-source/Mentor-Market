const expertData = {
  id: 1,
  name: 'Dr. Sarah Chen',
  title: 'Former VP at Goldman Sachs',
  domain: 'Finance',
  verified: true,
  rating: 4.9,
  reviews: 127,
  sessions: 340,
  responseTime: '4 hours',
  rate: 29000,
  linkedin: 'https://linkedin.com',
  bio: `With over 25 years of experience at Goldman Sachs, I've guided Fortune 500 companies through complex mergers and acquisitions, strategic restructuring, and capital markets transactions. My expertise spans corporate finance, private equity advisory, and international market expansion strategies.

I've led transactions worth over ₹16,600 Crore across Asia-Pacific markets and have deep experience working with startups transitioning through Series A to pre-IPO stages. My mentorship philosophy centers on practical, actionable guidance that combines theoretical frameworks with real-world implementation experience.

Beyond transaction work, I'm passionate about helping the next generation of finance professionals navigate career transitions, build financial acumen, and develop the strategic thinking skills that separate good analysts from great executives. Whether you're raising capital for the first time or managing a complex portfolio, I bring a wealth of institutional knowledge that simply isn't available through textbooks or online courses.`,
  highlights: [
    'Led ₹400 Cr cost reduction initiative across 12,000-person enterprise',
    'Structured ₹10,000 Cr merger between regional banking institutions',
    'Built fintech advisory practice generating ₹415 Cr annual revenue',
    'Mentored 50+ professionals through CFA and MBA programs',
    'Speaker at World Economic Forum on emerging market strategies'
  ],
  tags: ['M&A Advisory', 'Corporate Restructuring', 'Private Equity', 'IPO Preparation', 'Risk Management', 'Capital Markets', 'Financial Modeling', 'Venture Capital'],
  sessionTypes: [
    { id: '30min', label: '30 Min Session', desc: 'Quick consultation', price: 14500 },
    { id: '60min', label: '1 Hour Session', desc: 'Deep dive discussion', price: 29000 },
    { id: '90min', label: '90 Min Session', desc: 'Comprehensive strategy', price: 42000 }
  ],
  reviewsData: [
    { name: 'Marcus Webb', company: 'Startup Founder, Austin TX', date: 'Dec 15, 2025', rating: 5, text: 'Working with Dr. Chen transformed how I think about investment strategy. Her insights from Goldman Sachs gave me the confidence to make my first major portfolio move. The ROI on these sessions has been incredible.' },
    { name: 'Priya Sharma', company: 'CFO, TechVentures Inc', date: 'Nov 28, 2025', rating: 5, text: 'Sarah helped me navigate a complex acquisition that had us stuck for months. Her strategic clarity and deep market knowledge were invaluable. Highly recommend for any senior finance professional.' },
    { name: 'James Liu', company: 'Investment Analyst, Singapore', date: 'Nov 10, 2025', rating: 5, text: 'Exceptional mentorship. Dr. Chen provided actionable frameworks that I immediately applied to our due diligence process. The session paid for itself within the first week.' },
    { name: 'Elena Rodriguez', company: 'Finance Director, Tesla', date: 'Oct 22, 2025', rating: 5, text: 'I was preparing for my first CFO role and Dr. Chen\'s guidance was instrumental. She helped me structure my approach to investor relations and board presentations.' },
    { name: 'Robert Kim', company: 'Managing Partner, Apex Capital', date: 'Oct 5, 2025', rating: 5, text: 'Sarah\'s market insights are unmatched. Her understanding of how institutional investors think helped us reposition our fund strategy for better LP relations.' },
    { name: 'Amanda Foster', company: 'SVP Engineering, Google', date: 'Sep 18, 2025', rating: 4, text: 'Great session on financial planning for non-finance executives. Dr. Chen translated complex concepts into actionable strategies I could apply immediately.' },
    { name: 'Michael Chen', company: 'Founder, FinScale', date: 'Sep 2, 2025', rating: 5, text: 'Dr. Chen reviewed our Series B deck and provided feedback that helped us close our round at a 20% higher valuation than initially expected.' },
    { name: 'Sarah Mitchell', company: 'VP Finance, Boeing', date: 'Aug 15, 2025', rating: 5, text: 'Outstanding expertise in corporate finance strategy. Dr. Chen helped us restructure our APAC operations for better tax efficiency and operational effectiveness.' },
    { name: 'David Park', company: 'Private Equity Associate', date: 'Jul 30, 2025', rating: 5, text: 'Essential guidance for anyone transitioning from investment banking to private equity. Dr. Chen understands both worlds deeply.' },
    { name: 'Lisa Wang', company: 'Startup Advisor', date: 'Jul 12, 2025', rating: 5, text: 'Sarah\'s session on financial modeling best practices was exactly what my team needed. Her teaching style is engaging and highly practical.' }
  ]
};

let currentSessionType = '60min';
let selectedDate = null;
let selectedSlot = null;
let showAllReviews = false;

function initProfile() {
  renderIdentityPanel();
  renderContentPanel();
  renderBookingPanel();
  initReviewAnimations();
  initBioToggle();
  initSessionTypeCards();
  initBookingInteractions();
}

function renderIdentityPanel() {
  const panel = document.querySelector('.identity-panel');
  if (!panel) return;

  panel.innerHTML = `
    <div class="identity-panel__photo-wrap">
      <img src="${expertData.image || 'assets/experts/expert-1.jpg'}" alt="${expertData.name}" class="identity-panel__photo" width="120" height="120">
    </div>
    <h2 class="identity-panel__name">${expertData.name}</h2>
    <span class="identity-panel__domain">${expertData.domain}</span>
    <div class="identity-panel__verified ${expertData.verified ? 'visible' : ''}">
      <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
        <polyline points="20 6 9 17 4 12"/>
      </svg>
      Verified Expert
    </div>
    <button class="identity-panel__linkedin">
      <svg viewBox="0 0 24 24" fill="currentColor">
        <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
      </svg>
      View LinkedIn
    </button>
    <div class="identity-panel__rating">
      <span class="identity-panel__rating-number">${expertData.rating}</span>
      <div class="identity-panel__rating-stars">
        ${[1,2,3,4,5].map(i => `
          <svg viewBox="0 0 24 24" fill="currentColor">
            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
          </svg>
        `).join('')}
      </div>
      <span class="identity-panel__rating-count">(${expertData.reviews} reviews)</span>
    </div>
    <div class="identity-panel__divider"></div>
    <div class="identity-panel__stat">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
        <line x1="16" y1="2" x2="16" y2="6"/>
        <line x1="8" y1="2" x2="8" y2="6"/>
        <line x1="3" y1="10" x2="21" y2="10"/>
      </svg>
      ${expertData.sessions} sessions completed
    </div>
    <div class="identity-panel__stat">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="12" cy="12" r="10"/>
        <polyline points="12 6 12 12 16 14"/>
      </svg>
      Responds within ${expertData.responseTime}
    </div>
  `;
}

function renderContentPanel() {
  const panel = document.querySelector('.content-panel');
  if (!panel) return;

  const ratingBreakdown = [95, 3, 1, 1, 0];

  panel.innerHTML = `
    <div class="content-panel__header">
      <h1>${expertData.name}</h1>
      <p>${expertData.title}</p>
    </div>

    <section class="content-section">
      <div class="content-section__label">About</div>
      <p class="content-section__bio collapsed" id="bioText">${expertData.bio}</p>
      <span class="bio-toggle" id="bioToggle">Read More</span>
    </section>

    <section class="content-section">
      <div class="content-section__label">Career Highlights</div>
      <ul class="highlights-list">
        ${expertData.highlights.map(h => `<li class="highlights-list__item">${h}</li>`).join('')}
      </ul>
    </section>

    <section class="content-section">
      <div class="content-section__label">Expertise</div>
      <div class="expertise-tags">
        ${expertData.tags.map(tag => `
          <span class="expertise-tag" data-tag="${tag}">${tag}</span>
        `).join('')}
      </div>
    </section>

    <section class="content-section">
      <div class="content-section__label">Session Types</div>
      <div class="session-types-grid">
        ${expertData.sessionTypes.map(type => `
          <div class="session-type-card ${type.id === currentSessionType ? 'active' : ''}" data-type="${type.id}">
            <svg class="session-type-card__icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              ${type.id === '30min' ? '<circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/>' : type.id === '60min' ? '<rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/>' : '<path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/>'}
            </svg>
            <div class="session-type-card__label">${type.label}</div>
            <div class="session-type-card__desc">${type.desc}</div>
            <div class="session-type-card__price">${formatINR(type.price)}</div>
            <span class="session-type-card__select">Select</span>
          </div>
        `).join('')}
      </div>
    </section>

    <section class="content-section">
      <div class="content-section__label">Reviews</div>
      <div class="reviews-summary">
        <div class="reviews-summary__score">
          <div class="reviews-summary__score-number">${expertData.rating}</div>
          <div class="reviews-summary__score-label">out of 5</div>
          <div class="reviews-summary__score-stars">
            ${[1,2,3,4,5].map(i => `
              <svg viewBox="0 0 24 24" fill="currentColor">
                <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
              </svg>
            `).join('')}
          </div>
        </div>
        <div class="reviews-breakdown">
          ${[5,4,3,2,1].map((stars, i) => `
            <div class="reviews-breakdown__row">
              <div class="reviews-breakdown__stars">
                ${[1,2,3,4,5].map(s => `
                  <svg viewBox="0 0 24 24" fill="currentColor" style="color: ${s <= stars ? 'var(--gold-primary)' : 'var(--gray-400)'}">
                    <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                  </svg>
                `).join('')}
              </div>
              <div class="reviews-breakdown__bar">
                <div class="reviews-breakdown__fill" style="width: ${ratingBreakdown[i]}%"></div>
              </div>
              <span class="reviews-breakdown__count">${Math.round(expertData.reviews * ratingBreakdown[i] / 100)}</span>
            </div>
          `).join('')}
        </div>
      </div>
      <div class="reviews-list" id="reviewsList">
        ${expertData.reviewsData.slice(0, 4).map((review, i) => `
          <div class="review-card ${i >= 4 ? 'hidden-review' : ''}">
            <div class="review-card__header">
              <img src="assets/testimonials/buyer-${(i % 3) + 1}.jpg" alt="${review.name}" class="review-card__photo" width="40" height="40" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 40 40%22><circle cx=%2220%22 cy=%2220%22 r=%2220%22 fill=%22%23E8E8E8%22/><text x=%2250%%22 y=%2255%%22 text-anchor=%22middle%22 fill=%22%234A5568%22 font-size=%2216%22>${review.name.charAt(0)}</text></svg>'">
              <div class="review-card__info">
                <h5>${review.name}</h5>
                <p>${review.company} · ${review.date}</p>
              </div>
              <div class="review-card__stars">
                ${[1,2,3,4,5].map(s => `
                  <svg viewBox="0 0 24 24" fill="currentColor" style="color: ${s <= review.rating ? 'var(--gold-primary)' : 'var(--gray-200)'}">
                    <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                  </svg>
                `).join('')}
              </div>
            </div>
            <p class="review-card__text">${review.text}</p>
          </div>
        `).join('')}
      </div>
      ${expertData.reviewsData.length > 4 ? `
        <button class="show-more-reviews" id="showMoreReviews">Show ${expertData.reviewsData.length - 4} More Reviews</button>
      ` : ''}
    </section>
  `;
}

function renderBookingPanel() {
  const panel = document.querySelector('.booking-panel');
  if (!panel) return;

  const session = expertData.sessionTypes.find(s => s.id === currentSessionType);
  const platformFee = Math.round(session.price * 0.22);
  const total = session.price + platformFee;

  panel.innerHTML = `
    <div class="booking-panel__price">${formatINR(expertData.rate)}<span class="booking-panel__price-sub">/hour</span></div>

    <div class="booking-panel__sessions">
      <div class="session-tab__highlight ${currentSessionType === '30min' ? '' : currentSessionType === '60min' ? 'pos-2' : 'pos-3'}"></div>
      ${expertData.sessionTypes.map(type => `
        <div class="session-tab ${type.id === currentSessionType ? 'active' : ''}" data-type="${type.id}">
          ${type.id === '30min' ? '30 Min' : type.id === '60min' ? '1 Hour' : '90 Min'}
        </div>
      `).join('')}
    </div>

    <div class="booking-panel__calendar">
      <div class="calendar-header">
        <span class="calendar-header__title" id="calendarTitle"></span>
        <div class="calendar-header__nav">
          <button id="prevMonth">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <polyline points="15 18 9 12 15 6"/>
            </svg>
          </button>
          <button id="nextMonth">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <polyline points="9 18 15 12 9 6"/>
            </svg>
          </button>
        </div>
      </div>
      <div class="calendar-weekdays">
        <span class="calendar-weekday">Sun</span>
        <span class="calendar-weekday">Mon</span>
        <span class="calendar-weekday">Tue</span>
        <span class="calendar-weekday">Wed</span>
        <span class="calendar-weekday">Thu</span>
        <span class="calendar-weekday">Fri</span>
        <span class="calendar-weekday">Sat</span>
      </div>
      <div class="calendar-days" id="calendarDays"></div>
    </div>

    <div class="time-slots" id="timeSlots">
      ${['9:00 AM', '10:00 AM', '11:00 AM', '12:00 PM', '2:00 PM', '3:00 PM', '4:00 PM', '5:00 PM'].map((slot, i) => `
        <button class="time-slot ${[2, 5].includes(i) ? 'disabled' : ''}">${slot}</button>
      `).join('')}
    </div>

    <div class="booking-panel__order">
      <div class="order-line">
        <span>${currentSessionType === '30min' ? '30 Min' : currentSessionType === '60min' ? '1 Hour' : '90 Min'} Session</span>
        <span>${formatINR(session.price)}</span>
      </div>
      <div class="order-line">
        <span>Platform Fee</span>
        <span>${formatINR(platformFee)}</span>
      </div>
      <div class="order-line order-line--total">
        <span>Total</span>
        <span>${formatINR(total)}</span>
      </div>
    </div>

    <button class="booking-panel__btn" id="bookNowBtn">Book Now</button>

    <div class="booking-panel__trust">
      <div class="booking-panel__trust-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
          <polyline points="22 4 12 14.01 9 11.01"/>
        </svg>
        Verified Expert
      </div>
      <div class="booking-panel__trust-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
          <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
        </svg>
        Secure Razorpay Payment
      </div>
      <div class="booking-panel__trust-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <circle cx="12" cy="12" r="10"/>
          <polygon points="10 8 16 12 10 16 10 8"/>
        </svg>
        Session Recording Available
      </div>
    </div>
  `;

  initCalendar();
  updateMobileBookingBar();
}

let currentMonth = new Date().getMonth();
let currentYear = new Date().getFullYear();

function initCalendar() {
  const calendarDays = document.getElementById('calendarDays');
  const calendarTitle = document.getElementById('calendarTitle');

  function renderCalendar() {
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    calendarTitle.textContent = `${months[currentMonth]} ${currentYear}`;

    const firstDay = new Date(currentYear, currentMonth, 1).getDay();
    const daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate();
    const daysInPrevMonth = new Date(currentYear, currentMonth, 0).getDate();

    const today = new Date();
    const isCurrentMonth = currentMonth === today.getMonth() && currentYear === today.getFullYear();

    let html = '';

    for (let i = firstDay - 1; i >= 0; i--) {
      html += `<div class="calendar-day other-month">${daysInPrevMonth - i}</div>`;
    }

    for (let day = 1; day <= daysInMonth; day++) {
      const isToday = isCurrentMonth && day === today.getDate();
      const isPast = new Date(currentYear, currentMonth, day) < new Date(today.getFullYear(), today.getMonth(), today.getDate());
      const isSelected = selectedDate && selectedDate.getDate() === day && selectedDate.getMonth() === currentMonth && selectedDate.getFullYear() === currentYear;

      html += `
        <div class="calendar-day ${isPast ? 'disabled' : ''} ${isToday ? 'today' : ''} ${isSelected ? 'selected' : ''}" data-day="${day}">
          ${day}
        </div>
      `;
    }

    const remaining = 42 - firstDay - daysInMonth;
    for (let day = 1; day <= remaining; day++) {
      html += `<div class="calendar-day other-month">${day}</div>`;
    }

    calendarDays.innerHTML = html;

    calendarDays.querySelectorAll('.calendar-day:not(.disabled):not(.other-month)').forEach(dayEl => {
      dayEl.addEventListener('click', () => {
        calendarDays.querySelectorAll('.calendar-day').forEach(d => d.classList.remove('selected'));
        dayEl.classList.add('selected');
        selectedDate = new Date(currentYear, currentMonth, parseInt(dayEl.dataset.day));
        updateBookButton();
      });
    });
  }

  renderCalendar();

  document.getElementById('prevMonth').addEventListener('click', () => {
    currentMonth--;
    if (currentMonth < 0) {
      currentMonth = 11;
      currentYear--;
    }
    renderCalendar();
  });

  document.getElementById('nextMonth').addEventListener('click', () => {
    currentMonth++;
    if (currentMonth > 11) {
      currentMonth = 0;
      currentYear++;
    }
    renderCalendar();
  });
}

function updateBookButton() {
  const btn = document.getElementById('bookNowBtn');
  if (btn) {
    btn.disabled = !selectedDate || !selectedSlot;
    btn.textContent = selectedDate && selectedSlot ? 'Book Now' : 'Select Date & Time';
  }
}

function updateMobileBookingBar() {
  const bar = document.querySelector('.mobile-booking-bar');
  if (!bar) return;

  const session = expertData.sessionTypes.find(s => s.id === currentSessionType);
  bar.querySelector('.mobile-booking-bar__price').textContent = formatINR(session.price);
}

function initReviewAnimations() {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.2 });

  document.querySelectorAll('.review-card').forEach(card => observer.observe(card));
}

function initBioToggle() {
  const toggle = document.getElementById('bioToggle');
  const bio = document.getElementById('bioText');

  if (!toggle || !bio) return;

  toggle.addEventListener('click', () => {
    bio.classList.toggle('collapsed');
    toggle.textContent = bio.classList.contains('collapsed') ? 'Read More' : 'Show Less';
  });
}

function initSessionTypeCards() {
  document.addEventListener('click', (e) => {
    const card = e.target.closest('.session-type-card');
    if (card) {
      document.querySelectorAll('.session-type-card').forEach(c => c.classList.remove('active'));
      card.classList.add('active');
      currentSessionType = card.dataset.type;
      updateSessionTabs();
      renderBookingPanel();
    }

    const tab = e.target.closest('.session-tab');
    if (tab) {
      const type = tab.dataset.type;
      currentSessionType = type;
      updateSessionTabs();
      renderBookingPanel();
    }
  });
}

function updateSessionTabs() {
  const tabs = document.querySelectorAll('.session-tab');
  const highlight = document.querySelector('.session-tab__highlight');

  tabs.forEach(tab => {
    tab.classList.toggle('active', tab.dataset.type === currentSessionType);
  });

  if (highlight) {
    highlight.className = 'session-tab__highlight';
    if (currentSessionType === '60min') highlight.classList.add('pos-2');
    if (currentSessionType === '90min') highlight.classList.add('pos-3');
  }
}

function initBookingInteractions() {
  document.addEventListener('click', (e) => {
    const slot = e.target.closest('.time-slot:not(.disabled)');
    if (slot) {
      document.querySelectorAll('.time-slot').forEach(s => s.classList.remove('selected'));
      slot.classList.add('selected');
      selectedSlot = slot.textContent;
      updateBookButton();
    }

    const showMore = e.target.closest('#showMoreReviews');
    if (showMore) {
      const hiddenReviews = document.querySelectorAll('.review-card.hidden-review');
      showAllReviews = !showAllReviews;

      hiddenReviews.forEach(review => {
        review.classList.toggle('hidden-review', !showAllReviews);
      });

      showMore.textContent = showAllReviews ? 'Show Fewer Reviews' : `Show ${hiddenReviews.length} More Reviews`;
    }

    const tag = e.target.closest('.expertise-tag');
    if (tag) {
      window.location.href = `experts.html?search=${encodeURIComponent(tag.dataset.tag)}`;
    }

    const bookBtn = e.target.closest('#bookNowBtn');
    if (bookBtn && selectedDate && selectedSlot) {
      const session = expertData.sessionTypes.find(s => s.id === currentSessionType);
      const platformFee = Math.round(session.price * 0.22);
      const total = session.price + platformFee;

      const params = new URLSearchParams({
        expert: expertData.id,
        type: currentSessionType,
        date: selectedDate.toISOString(),
        slot: selectedSlot,
        total: total
      });

      window.location.href = `booking.html?${params.toString()}`;
    }

    const mobileBookBtn = e.target.closest('.mobile-booking-bar .btn');
    if (mobileBookBtn) {
      document.querySelector('.booking-panel').scrollIntoView({ behavior: 'smooth' });
    }
  });

  document.getElementById('prevMonth')?.addEventListener('click', initCalendar);
  document.getElementById('nextMonth')?.addEventListener('click', initCalendar);
}

document.addEventListener('DOMContentLoaded', initProfile);