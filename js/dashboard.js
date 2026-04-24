const userData = {
  firstName: 'Marcus',
  lastName: 'Webb',
  avatar: 'assets/testimonials/buyer-1.jpg',
  sessions: [
    { id: 1, expert: 'Dr. Sarah Chen', expertPhoto: 'assets/experts/expert-1.jpg', domain: 'Finance', date: 'Apr 28, 2026', time: '10:00 AM', type: '1 Hour Session', amount: 350, status: 'confirmed', nextSession: true },
    { id: 2, expert: 'Dr. Sarah Chen', expertPhoto: 'assets/experts/expert-1.jpg', domain: 'Finance', date: 'Apr 15, 2026', time: '2:00 PM', type: '1 Hour Session', amount: 350, status: 'completed', rating: 0 },
    { id: 3, expert: 'Jennifer Walsh', expertPhoto: 'assets/experts/expert-3.jpg', domain: 'Operations', date: 'Apr 8, 2026', time: '11:00 AM', type: '30 Min Session', amount: 175, status: 'completed', rating: 5 },
    { id: 4, expert: 'Michael Roberts', expertPhoto: 'assets/experts/expert-2.jpg', domain: 'Legal', date: 'Mar 28, 2026', time: '3:00 PM', type: '1 Hour Session', amount: 400, status: 'completed', rating: 4 },
    { id: 5, expert: 'Amanda Foster', expertPhoto: 'assets/experts/expert-5.jpg', domain: 'Technology', date: 'Mar 20, 2026', time: '10:00 AM', type: '90 Min Session', amount: 500, status: 'cancelled', rating: 0 }
  ]
};

let currentTab = 'overview';
let currentRating = 0;
let hoveredRating = 0;

function getGreeting() {
  const hour = new Date().getHours();
  if (hour < 12) return 'Good morning';
  if (hour < 17) return 'Good afternoon';
  return 'Good evening';
}

function getFormattedDate() {
  return new Date().toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric', year: 'numeric' });
}

function getDaysUntil(dateStr) {
  const date = new Date(dateStr + 'T10:00:00');
  const now = new Date();
  const diff = date - now;
  const days = Math.floor(diff / (1000 * 60 * 60 * 24));
  const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  if (days > 0) return `In ${days} day${days > 1 ? 's' : ''}, ${hours} hours`;
  if (hours > 0) return `In ${hours} hours`;
  return 'Starting soon';
}

function initSidebar() {
  const navItems = document.querySelectorAll('.sidebar__nav-item');
  navItems.forEach(item => {
    item.addEventListener('click', () => {
      navItems.forEach(i => i.classList.remove('active'));
      item.classList.add('active');

      const tab = item.dataset.tab;
      currentTab = tab;

      document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
      document.getElementById(`${tab}-tab`)?.classList.add('active');
    });
  });

  document.querySelectorAll('.mobile-tabs__item').forEach(item => {
    item.addEventListener('click', () => {
      document.querySelectorAll('.mobile-tabs__item').forEach(i => i.classList.remove('active'));
      item.classList.add('active');

      const tab = item.dataset.tab;
      currentTab = tab;

      document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
      document.getElementById(`${tab}-tab`)?.classList.add('active');
    });
  });
}

function renderOverview() {
  const tab = document.getElementById('overview-tab');
  if (!tab) return;

  const nextSession = userData.sessions.find(s => s.nextSession);
  const completedSessions = userData.sessions.filter(s => s.status === 'completed');
  const uniqueExperts = [...new Set(completedSessions.map(s => s.expert))];
  const totalHours = completedSessions.reduce((sum, s) => {
    const type = s.type;
    if (type.includes('90')) return sum + 1.5;
    if (type.includes('30')) return sum + 0.5;
    return sum + 1;
  }, 0);

  tab.innerHTML = `
    <div class="welcome-header">
      <h1>${getGreeting()}, ${userData.firstName}</h1>
      <p>${getFormattedDate()}</p>
    </div>

    ${nextSession ? `
    <div class="next-session-card">
      <div class="next-session-card__label">NEXT SESSION</div>
      <div class="next-session-card__content">
        <div class="next-session-card__expert">
          <img src="${nextSession.expertPhoto}" alt="${nextSession.expert}" class="next-session-card__photo" width="48" height="48">
          <div>
            <div class="next-session-card__name">${nextSession.expert}</div>
            <div class="next-session-card__domain">${nextSession.domain} Expert</div>
          </div>
        </div>
        <div class="next-session-card__details">
          <div class="next-session-card__datetime">${nextSession.date} at ${nextSession.time}</div>
          <div class="next-session-card__countdown">${getDaysUntil(nextSession.date)}</div>
        </div>
        <div class="next-session-card__action">
          <button class="btn btn--primary" disabled>Join Session</button>
        </div>
      </div>
    </div>
    ` : ''}

    <div class="quick-stats">
      <div class="stat-card">
        <div class="stat-card__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
            <line x1="16" y1="2" x2="16" y2="6"/>
            <line x1="8" y1="2" x2="8" y2="6"/>
            <line x1="3" y1="10" x2="21" y2="10"/>
          </svg>
        </div>
        <div class="stat-card__content">
          <h4>${userData.sessions.length}</h4>
          <p>Sessions Booked</p>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-card__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
            <circle cx="9" cy="7" r="4"/>
            <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
            <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
          </svg>
        </div>
        <div class="stat-card__content">
          <h4>${uniqueExperts.length}</h4>
          <p>Experts Consulted</p>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-card__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="12" cy="12" r="10"/>
            <polyline points="12 6 12 12 16 14"/>
          </svg>
        </div>
        <div class="stat-card__content">
          <h4>${totalHours.toFixed(1)}</h4>
          <p>Hours of Advice</p>
        </div>
      </div>
    </div>

    <div class="recent-sessions">
      <div class="recent-sessions__header">
        <h3>Recent Sessions</h3>
        <button class="btn btn--secondary" style="padding: 8px 16px; font-size: 13px;">View All</button>
      </div>
      ${userData.sessions.slice(0, 3).map(session => `
        <div class="session-row" data-session-id="${session.id}">
          <img src="${session.expertPhoto}" alt="${session.expert}" class="session-row__photo" width="40" height="40">
          <div class="session-row__info">
            <div class="session-row__name">${session.expert}</div>
            <div class="session-row__meta">
              <span class="session-row__domain">${session.domain}</span>
            </div>
          </div>
          <div class="session-row__date">${session.date}</div>
          <span class="status-badge status-badge--${session.status}">${session.status}</span>
          ${session.status === 'completed' && session.rating === 0 ? `
            <button class="btn btn--primary" style="padding: 8px 16px; font-size: 13px;" data-action="rate" data-session="${session.id}">Rate Session</button>
          ` : session.status === 'confirmed' ? `
            <button class="btn btn--secondary" style="padding: 8px 16px; font-size: 13px;">View Details</button>
          ` : session.status === 'cancelled' ? `
            <button class="btn btn--ghost" style="padding: 8px 16px; font-size: 13px;">Rebook</button>
          ` : ''}
        </div>
      `).join('')}
    </div>
  `;
}

function renderMySessions() {
  const tab = document.getElementById('sessions-tab');
  if (!tab) return;

  tab.innerHTML = `
    <div class="welcome-header">
      <h1>My Sessions</h1>
      <p>Manage all your mentorship sessions</p>
    </div>

    <div class="sessions-filters">
      <div class="form-select-wrapper">
        <select class="form-input" id="statusFilter">
          <option value="">All Status</option>
          <option value="pending">Pending</option>
          <option value="confirmed">Confirmed</option>
          <option value="completed">Completed</option>
          <option value="cancelled">Cancelled</option>
        </select>
      </div>
      <div class="form-input-wrapper">
        <input type="text" class="form-input" placeholder="Search by expert name..." id="sessionSearch">
      </div>
    </div>

    <div class="sessions-table">
      <div class="sessions-table__header">
        <span>Expert</span>
        <span>Domain</span>
        <span>Date & Time</span>
        <span>Type</span>
        <span>Amount</span>
        <span>Status</span>
        <span>Action</span>
      </div>
      ${userData.sessions.map(session => `
        <div class="sessions-table__row" data-session-id="${session.id}">
          <div class="sessions-table__expert">
            <img src="${session.expertPhoto}" alt="${session.expert}" width="32" height="32">
            <span class="sessions-table__expert-name">${session.expert}</span>
          </div>
          <div class="sessions-table__cell">${session.domain}</div>
          <div class="sessions-table__cell">${session.date}<br><small>${session.time}</small></div>
          <div class="sessions-table__cell">${session.type}</div>
          <div class="sessions-table__cell sessions-table__cell--amount">$${session.amount}</div>
          <div><span class="status-badge status-badge--${session.status}">${session.status}</span></div>
          <div>
            ${session.status === 'completed' && session.rating === 0 ? `
              <button class="btn btn--primary" style="padding: 8px 16px; font-size: 13px;" data-action="rate" data-session="${session.id}">Rate</button>
            ` : session.status === 'confirmed' ? `
              <button class="btn btn--secondary" style="padding: 8px 16px; font-size: 13px;">Details</button>
            ` : session.status === 'completed' && session.rating > 0 ? `
              <div style="display: flex; gap: 2px;">
                ${[1,2,3,4,5].map(i => `
                  <svg width="14" height="14" viewBox="0 0 24 24" fill="${i <= session.rating ? '#F5A623' : '#E8E8E8'}">
                    <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                  </svg>
                `).join('')}
              </div>
            ` : session.status === 'cancelled' ? `
              <button class="btn btn--ghost" style="padding: 8px 16px; font-size: 13px;">Rebook</button>
            ` : ''}
          </div>
        </div>
      `).join('')}
    </div>
  `;
}

function initRateModal() {
  const modal = document.getElementById('rateModal');

  document.addEventListener('click', (e) => {
    const rateBtn = e.target.closest('[data-action="rate"]');
    if (rateBtn) {
      const sessionId = parseInt(rateBtn.dataset.session);
      const session = userData.sessions.find(s => s.id === sessionId);
      if (session) {
        modal.querySelector('.modal-card__expert img').src = session.expertPhoto;
        modal.querySelector('.modal-card__expert h4').textContent = session.expert;
        modal.querySelector('.modal-card__expert p').textContent = `${session.domain} Expert · ${session.date}`;
        modal.classList.add('active');
        currentRating = 0;
        updateStarDisplay();
      }
    }

    const closeBtn = e.target.closest('.modal-overlay');
    if (modal === e.target) {
      closeModal();
    }

    const submitBtn = e.target.closest('.submit-review');
    if (submitBtn && currentRating > 0) {
      const sessionId = parseInt(modal.dataset.sessionId);
      const session = userData.sessions.find(s => s.id === sessionId);
      if (session) {
        session.rating = currentRating;
        closeModal();
        renderOverview();
        renderMySessions();
      }
    }

    const skipBtn = e.target.closest('.modal-card__skip');
    if (skipBtn) {
      closeModal();
    }

    const star = e.target.closest('.star-rating__star');
    if (star) {
      currentRating = parseInt(star.dataset.rating);
      updateStarDisplay();
    }
  });

  const starContainer = document.querySelector('.star-rating');
  starContainer?.addEventListener('mouseover', (e) => {
    const star = e.target.closest('.star-rating__star');
    if (star) {
      hoveredRating = parseInt(star.dataset.rating);
      updateStarDisplay();
    }
  });

  starContainer?.addEventListener('mouseleave', () => {
    hoveredRating = 0;
    updateStarDisplay();
  });

  function updateStarDisplay() {
    const stars = document.querySelectorAll('.star-rating__star');
    stars.forEach((star, i) => {
      const rating = hoveredRating || currentRating;
      star.classList.toggle('active', i < rating);
    });
  }

  function closeModal() {
    modal.classList.remove('active');
  }
}

function initDashboard() {
  initSidebar();
  renderOverview();
  renderMySessions();
  initRateModal();
}

document.addEventListener('DOMContentLoaded', initDashboard);