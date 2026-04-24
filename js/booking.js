const expert = {
  id: 1,
  name: 'Dr. Sarah Chen',
  title: 'Former VP at Goldman Sachs',
  domain: 'Finance',
  rating: 4.9,
  rate: 29000
};

const sessionTypes = [
  { id: 'hourly', label: 'Hourly Call', rate: 29000, desc: 'Perfect for quick questions and follow-ups', duration: '1 hour' },
  { id: 'monthly', label: 'Monthly Retainer', rate: 150000, desc: 'Ongoing support with monthly calls', duration: '4 sessions/mo' },
  { id: 'project', label: 'Scoped Project', rate: 0, desc: 'Custom engagement for specific goals', duration: 'Custom scope' }
];

let currentSessionType = 'hourly';
let selectedDate = null;
let selectedSlot = null;
let currentMonth = new Date().getMonth();
let currentYear = new Date().getFullYear();

function initBooking() {
  renderExpertBanner();
  renderSessionTypes();
  renderOrderSummary();
  initCalendar();
  renderTimeSlots();
  initFormInteractions();
}

function renderExpertBanner() {
  const banner = document.querySelector('.expert-banner');
  if (!banner) return;

  banner.innerHTML = `
    <img src="assets/experts/expert-1.jpg" alt="${expert.name}" class="expert-banner__photo" width="48" height="48" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 48 48%22><circle cx=%2224%22 cy=%2224%22 r=%2224%22 fill=%22%23112240%22/><text x=%2250%%22 y=%2255%%22 text-anchor=%22middle%22 fill=%22%23F5A623%22 font-size=%2220%22>SC</text></svg>'">
    <div class="expert-banner__info">
      <div class="expert-banner__name">${expert.name}</div>
      <div class="expert-banner__meta">
        <span class="expert-banner__domain">${expert.domain}</span>
        <span class="expert-banner__rating">
          <svg viewBox="0 0 24 24" fill="currentColor">
            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
          </svg>
          ${expert.rating} Rating
        </span>
      </div>
    </div>
    <span class="expert-banner__change">Change Expert</span>
  `;
}

function renderSessionTypes() {
  const container = document.querySelector('.session-type-cards');
  if (!container) return;

  container.innerHTML = sessionTypes.map(type => `
    <label class="session-type-card ${type.id === currentSessionType ? 'active' : ''}">
      <input type="radio" name="sessionType" value="${type.id}" ${type.id === currentSessionType ? 'checked' : ''}>
      <div class="session-type-card__icon">
        ${type.id === 'hourly' ? '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>' : type.id === 'monthly' ? '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>' : '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/></svg>'}
      </div>
      <div class="session-type-card__title">${type.label}</div>
      <div class="session-type-card__desc">${type.desc}</div>
      <div class="session-type-card__radio"></div>
    </label>
  `).join('');

  container.querySelectorAll('.session-type-card').forEach(card => {
    card.addEventListener('click', () => {
      container.querySelectorAll('.session-type-card').forEach(c => c.classList.remove('active'));
      card.classList.add('active');
      card.querySelector('input').checked = true;
      currentSessionType = card.querySelector('input').value;
      renderOrderSummary();
    });
  });
}

function renderOrderSummary() {
  const summary = document.querySelector('.order-summary');
  if (!summary) return;

  const type = sessionTypes.find(t => t.id === currentSessionType);
  const platformFee = type.rate > 0 ? Math.round(type.rate * 0.22) : 0;
  const total = type.rate > 0 ? type.rate + platformFee : 0;

  summary.innerHTML = `
    <h3>Order Summary</h3>
    <div class="order-summary__expert">
      <img src="assets/experts/expert-1.jpg" alt="${expert.name}" class="order-summary__expert-photo" width="56" height="56" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 56 56%22><circle cx=%2228%22 cy=%2228%22 r=%2228%22 fill=%22%23112240%22/><text x=%2250%%22 y=%2255%%22 text-anchor=%22middle%22 fill=%22%23F5A623%22 font-size=%2224%22>SC</text></svg>'">
      <div class="order-summary__expert-info">
        <h4>${expert.name}</h4>
        <p>
          <svg viewBox="0 0 24 24" fill="currentColor">
            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
          </svg>
          ${expert.rating} · ${expert.domain} Expert
        </p>
      </div>
    </div>
    <div class="order-summary__divider"></div>
    <div class="order-line">
      <span>Session Type</span>
      <span>${type.label}</span>
    </div>
    <div class="order-line">
      <span>${type.id === 'project' ? 'Project Rate' : 'Rate'}</span>
      <span>${type.rate > 0 ? formatINR(type.rate) : 'TBD'}</span>
    </div>
    <div class="order-line">
      <span>Duration</span>
      <span>${type.duration}</span>
    </div>
    ${type.rate > 0 ? `
    <div class="order-line">
      <span>
        Platform Fee
        <span class="order-line__tooltip">
          <svg class="order-line__tooltip-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="12" cy="12" r="10"/>
            <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/>
            <line x1="12" y1="17" x2="12.01" y2="17"/>
          </svg>
          <span class="order-line__tooltip-content">
            MentorMarket's 22% fee covers platform maintenance, payment processing, video infrastructure, and expert verification costs.
          </span>
        </span>
      </span>
      <span>$${platformFee}</span>
    </div>
    <div class="order-line order-line--total">
      <span>Total</span>
      <span class="order-price">$${total}</span>
    </div>
    ` : ''}
    <div class="razorpay-badge">
      <svg viewBox="0 0 24 24" fill="currentColor">
        <rect width="24" height="24" rx="4" fill="#0066FF"/>
        <path d="M12 6L8 12H11V18H16L12 6Z" fill="white"/>
      </svg>
      <span>Secure payment via Razorpay</span>
    </div>
    <button class="pay-btn" id="payBtn" ${type.rate === 0 ? 'disabled' : ''}>
      ${type.rate === 0 ? 'Contact for Pricing' : 'Pay Now'}
    </button>
    <div class="order-summary__trust">
      <div class="order-summary__trust-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
        </svg>
        Verified expert guarantee
      </div>
      <div class="order-summary__trust-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <circle cx="12" cy="12" r="10"/>
          <polyline points="12 6 12 12 16 14"/>
        </svg>
        Free cancellation up to 24h before
      </div>
      <div class="order-summary__trust-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <circle cx="12" cy="12" r="10"/>
          <polygon points="10 8 16 12 10 16 10 8"/>
        </svg>
        Session recording provided
      </div>
    </div>
  `;
}

const availableDates = [1, 2, 3, 8, 9, 10, 15, 16, 17, 22, 23, 24, 29, 30];

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
      const isAvailable = availableDates.includes(day);
      const isSelected = selectedDate && selectedDate.getDate() === day && selectedDate.getMonth() === currentMonth && selectedDate.getFullYear() === currentYear;

      html += `
        <div class="calendar-day ${isPast || !isAvailable ? 'disabled' : ''} ${isToday ? 'today' : ''} ${isSelected ? 'selected' : ''}" data-day="${day}">
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
        renderTimeSlots();
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

function renderTimeSlots() {
  const container = document.querySelector('.time-slots-grid');
  if (!container) return;

  selectedSlot = null;

  const slots = [
    { time: '9:00 AM', available: true },
    { time: '10:00 AM', available: true },
    { time: '11:00 AM', available: true },
    { time: '12:00 PM', available: false },
    { time: '2:00 PM', available: true },
    { time: '3:00 PM', available: false },
    { time: '4:00 PM', available: true },
    { time: '5:00 PM', available: false }
  ];

  container.innerHTML = slots.map(slot => `
    <div class="time-slot ${!slot.available ? 'disabled' : ''} ${selectedSlot === slot.time ? 'selected' : ''}" data-time="${slot.time}">
      <div class="time-slot__time">${slot.time}</div>
      <div class="time-slot__status">${slot.available ? 'Available' : 'Booked'}</div>
    </div>
  `).join('');

  container.querySelectorAll('.time-slot:not(.disabled)').forEach(slot => {
    slot.addEventListener('click', () => {
      container.querySelectorAll('.time-slot').forEach(s => s.classList.remove('selected'));
      slot.classList.add('selected');
      selectedSlot = slot.dataset.time;
    });
  });
}

function animatePriceChange(selector) {
  const el = document.querySelector(selector);
  if (!el) return;
  el.style.transform = 'scale(1.1)';
  setTimeout(() => {
    el.style.transform = 'scale(1)';
  }, 100);
}

function renderOrderSummary() {
  const summary = document.querySelector('.order-summary');
  if (!summary) return;

  const type = sessionTypes.find(t => t.id === currentSessionType);
  const platformFee = type.rate > 0 ? Math.round(type.rate * 0.22) : 0;
  const total = type.rate > 0 ? type.rate + platformFee : 0;

  summary.innerHTML = `
    <h3>Order Summary</h3>
    <div class="order-summary__expert">
      <img src="assets/experts/expert-1.jpg" alt="${expert.name}" class="order-summary__expert-photo" width="56" height="56" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 56 56%22><circle cx=%2228%22 cy=%2228%22 r=%2228%22 fill=%22%23112240%22/><text x=%2250%%22 y=%2255%%22 text-anchor=%22middle%22 fill=%22%23F5A623%22 font-size=%2224%22>SC</text></svg>'">
      <div class="order-summary__expert-info">
        <h4>${expert.name}</h4>
        <p>
          <svg viewBox="0 0 24 24" fill="currentColor">
            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
          </svg>
          ${expert.rating} · ${expert.domain} Expert
        </p>
      </div>
    </div>
    <div class="order-summary__divider"></div>
    <div class="order-line">
      <span>Session Type</span>
      <span>${type.label}</span>
    </div>
    <div class="order-line">
      <span>${type.id === 'project' ? 'Project Rate' : 'Rate'}</span>
      <span class="order-price" data-price="rate">${type.rate > 0 ? formatINR(type.rate) : 'TBD'}</span>
    </div>
    <div class="order-line">
      <span>Duration</span>
      <span>${type.duration}</span>
    </div>
    ${type.rate > 0 ? `
    <div class="order-line">
      <span>
        Platform Fee
        <span class="order-line__tooltip">
          <svg class="order-line__tooltip-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="12" cy="12" r="10"/>
            <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/>
            <line x1="12" y1="17" x2="12.01" y2="17"/>
          </svg>
          <span class="order-line__tooltip-content">
            MentorMarket's 22% fee covers platform maintenance, payment processing, video infrastructure, and expert verification costs.
          </span>
        </span>
      </span>
      <span class="order-price" data-price="fee">${formatINR(platformFee)}</span>
    </div>
    <div class="order-line order-line--total">
      <span>Total</span>
      <span class="order-price" data-price="total">${formatINR(total)}</span>
    </div>
    ` : ''}
    <div class="razorpay-badge">
      <svg viewBox="0 0 24 24" fill="currentColor">
        <rect width="24" height="24" rx="4" fill="#0066FF"/>
        <path d="M12 6L8 12H11V18H16L12 6Z" fill="white"/>
      </svg>
      <span>Secure payment via Razorpay</span>
    </div>
    <button class="pay-btn" id="payBtn" ${type.rate === 0 ? 'disabled' : ''}>
      ${type.rate === 0 ? 'Contact for Pricing' : 'Pay Now'}
    </button>
    <div class="order-summary__trust">
      <div class="order-summary__trust-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
        </svg>
        Verified expert guarantee
      </div>
      <div class="order-summary__trust-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <circle cx="12" cy="12" r="10"/>
          <polyline points="12 6 12 12 16 14"/>
        </svg>
        Free cancellation up to 24h before
      </div>
      <div class="order-summary__trust-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <circle cx="12" cy="12" r="10"/>
          <polygon points="10 8 16 12 10 16 10 8"/>
        </svg>
        Session recording provided
      </div>
    </div>
  `;

  if (type.rate > 0) {
    animatePriceChange('[data-price="rate"]');
    animatePriceChange('[data-price="fee"]');
    animatePriceChange('[data-price="total"]');
  }
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

function initTimeSlots() {
  const container = document.querySelector('.time-slots-grid');
  if (!container) return;

  const slots = [
    { time: '9:00 AM', available: true },
    { time: '10:00 AM', available: true },
    { time: '11:00 AM', available: true },
    { time: '12:00 PM', available: false },
    { time: '2:00 PM', available: true },
    { time: '3:00 PM', available: true },
    { time: '4:00 PM', available: true },
    { time: '5:00 PM', available: false }
  ];

  container.innerHTML = slots.map(slot => `
    <div class="time-slot ${!slot.available ? 'disabled' : ''} ${selectedSlot === slot.time ? 'selected' : ''}" data-time="${slot.time}">
      <div class="time-slot__time">${slot.time}</div>
      <div class="time-slot__status">${slot.available ? 'Available' : 'Booked'}</div>
    </div>
  `).join('');

  container.querySelectorAll('.time-slot:not(.disabled)').forEach(slot => {
    slot.addEventListener('click', () => {
      container.querySelectorAll('.time-slot').forEach(s => s.classList.remove('selected'));
      slot.classList.add('selected');
      selectedSlot = slot.dataset.time;
    });
  });
}

function initFormInteractions() {
  document.addEventListener('click', (e) => {
    const payBtn = e.target.closest('#payBtn');
    if (payBtn && currentSessionType !== 'project') {
      window.location.href = 'booking-confirmation.html';
    }

    const changeExpert = e.target.closest('.expert-banner__change');
    if (changeExpert) {
      window.location.href = 'experts.html';
    }
  });
}

document.addEventListener('DOMContentLoaded', initBooking);