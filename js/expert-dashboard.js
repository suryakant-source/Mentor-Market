const expertData = {
  firstName: 'Sarah',
  lastName: 'Chen',
  avatar: 'assets/experts/expert-1.jpg',
  status: 'pending',
  profileCompleteness: 72,
  earnings: {
    thisMonth: 2100,
    allTime: 28400,
    pending: 700
  },
  monthlyEarnings: [1800, 2400, 3200, 2800, 3600, 2100],
  todaySessions: [
    { id: 1, buyer: 'Marcus Webb', buyerPhoto: 'assets/testimonials/buyer-1.jpg', time: '10:00 AM', duration: '1 hour' },
    { id: 2, buyer: 'Priya Sharma', buyerPhoto: 'assets/testimonials/buyer-2.jpg', time: '2:00 PM', duration: '30 min' }
  ],
  sessions: [
    { id: 1, buyer: 'Marcus Webb', buyerPhoto: 'assets/testimonials/buyer-1.jpg', date: 'Apr 28, 2026', time: '10:00 AM', type: '1 Hour Session', amount: 350, status: 'confirmed' },
    { id: 2, buyer: 'Priya Sharma', buyerPhoto: 'assets/testimonials/buyer-2.jpg', date: 'Apr 28, 2026', time: '2:00 PM', type: '30 Min Session', amount: 175, status: 'confirmed' },
    { id: 3, buyer: 'James Liu', buyerPhoto: 'assets/testimonials/buyer-3.jpg', date: 'Apr 22, 2026', time: '11:00 AM', type: '1 Hour Session', amount: 350, status: 'completed' },
    { id: 4, buyer: 'Elena Rodriguez', buyerPhoto: 'assets/testimonials/buyer-1.jpg', date: 'Apr 15, 2026', time: '3:00 PM', type: '90 Min Session', amount: 500, status: 'completed' },
    { id: 5, buyer: 'Robert Kim', buyerPhoto: 'assets/testimonials/buyer-2.jpg', date: 'Apr 8, 2026', time: '10:00 AM', type: '1 Hour Session', amount: 350, status: 'completed' }
  ]
};

let currentTab = 'overview';
let animateRings = false;

function getGreeting() {
  const hour = new Date().getHours();
  if (hour < 12) return 'Good morning';
  if (hour < 17) return 'Good afternoon';
  return 'Good evening';
}

function getFormattedDate() {
  return new Date().toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric', year: 'numeric' });
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
      const tabEl = document.getElementById(`${tab}-tab`);
      if (tabEl) {
        tabEl.classList.add('active');
        if (tab === 'overview') {
          animateRings = true;
          renderProfileRing();
        }
        if (tab === 'earnings') {
          animateEarningsChart();
        }
      }
    });
  });

  document.querySelectorAll('.mobile-tabs__item').forEach(item => {
    item.addEventListener('click', () => {
      document.querySelectorAll('.mobile-tabs__item').forEach(i => i.classList.remove('active'));
      item.classList.add('active');

      const tab = item.dataset.tab;
      currentTab = tab;

      document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
      const tabEl = document.getElementById(`${tab}-tab`);
      if (tabEl) {
        tabEl.classList.add('active');
        if (tab === 'overview') {
          animateRings = true;
          renderProfileRing();
        }
        if (tab === 'earnings') {
          animateEarningsChart();
        }
      }
    });
  });
}

function renderVerificationBanner() {
  const container = document.querySelector('.main-content');
  const existing = document.querySelector('.verification-banner');
  if (existing) existing.remove();

  if (expertData.status === 'pending') {
    const banner = document.createElement('div');
    banner.className = 'verification-banner verification-banner--pending';
    banner.innerHTML = `
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="12" cy="12" r="10"/>
        <polyline points="12 6 12 12 16 14"/>
      </svg>
      Your profile is under review. Our team typically completes verification within 48 hours.
    `;
    container.insertBefore(banner, document.querySelector('.main-content__header'));
  } else if (expertData.status === 'rejected') {
    const banner = document.createElement('div');
    banner.className = 'verification-banner verification-banner--rejected';
    banner.innerHTML = `
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="12" cy="12" r="10"/>
        <line x1="15" y1="9" x2="9" y2="15"/>
        <line x1="9" y1="9" x2="15" y2="15"/>
      </svg>
      Your profile verification was rejected. Please review the feedback and resubmit.
      <button class="btn btn--primary" style="margin-left: 16px; padding: 8px 20px; font-size: 13px;">Resubmit Application</button>
    `;
    container.insertBefore(banner, document.querySelector('.main-content__header'));
  }
}

function renderProfileRing() {
  const ring = document.querySelector('.profile-ring');
  if (!ring || !animateRings) return;

  const progress = ring.querySelector('.profile-ring__progress');
  const percent = ring.querySelector('.profile-ring__percent');
  const circumference = 2 * Math.PI * 54;
  const offset = circumference - (expertData.profileCompleteness / 100) * circumference;

  setTimeout(() => {
    progress.style.strokeDashoffset = offset;
    animateCounter(percent, expertData.profileCompleteness, '%');
  }, 300);
}

function animateCounter(element, target, suffix) {
  let current = 0;
  const duration = 1000;
  const startTime = performance.now();

  function update(currentTime) {
    const elapsed = currentTime - startTime;
    const progress = Math.min(elapsed / duration, 1);
    const eased = 1 - Math.pow(1 - progress, 4);
    current = Math.round(eased * target);
    element.textContent = current + suffix;
    if (progress < 1) requestAnimationFrame(update);
  }
  requestAnimationFrame(update);
}

function animateEarningsChart() {
  const bars = document.querySelectorAll('.earnings-bar');
  const maxEarning = Math.max(...expertData.monthlyEarnings);

  bars.forEach((bar, i) => {
    const earning = parseInt(bar.dataset.earning);
    const heightPercent = (earning / maxEarning) * 100;
    bar.style.setProperty('--bar-height', heightPercent + '%');
    bar.style.height = '0';

    setTimeout(() => {
      bar.style.animation = `barGrow 600ms var(--ease-spring) forwards`;
    }, 100 + (i * 100));
  });
}

function renderOverview() {
  const tab = document.getElementById('overview-tab');
  if (!tab) return;

  const hasTodaySessions = expertData.todaySessions.length > 0;
  const completedSessions = expertData.sessions.filter(s => s.status === 'completed');
  const totalHours = completedSessions.reduce((sum, s) => {
    const type = s.type;
    if (type.includes('90')) return sum + 1.5;
    if (type.includes('30')) return sum + 0.5;
    return sum + 1;
  }, 0);

  tab.innerHTML = `
    <div class="welcome-header">
      <h1>${getGreeting()}, ${expertData.firstName}</h1>
      <p>${getFormattedDate()}</p>
    </div>

    ${hasTodaySessions ? `
    <div class="today-sessions-card">
      <div class="today-sessions-card__header">
        <span class="today-sessions-card__label">TODAY'S SESSIONS</span>
      </div>
      ${expertData.todaySessions.map(session => `
        <div class="today-session-row">
          <img src="${session.buyerPhoto}" alt="${session.buyer}" class="today-session-row__photo">
          <div class="today-session-row__info">
            <div class="today-session-row__name">${session.buyer}</div>
            <div class="today-session-row__meta">${session.time} · ${session.duration}</div>
          </div>
          <button class="btn btn--primary">Start Session</button>
        </div>
      `).join('')}
    </div>
    ` : ''}

    <div class="dashboard-grid">
      <div class="profile-ring-card">
        <h3>Profile Strength</h3>
        <div class="profile-ring">
          <svg viewBox="0 0 120 120">
            <circle cx="60" cy="60" r="54" fill="none" stroke="#E8E8E8" stroke-width="8"/>
            <circle class="profile-ring__progress" cx="60" cy="60" r="54" fill="none" stroke="#F5A623" stroke-width="8" stroke-linecap="round" stroke-dasharray="${2 * Math.PI * 54}" stroke-dashoffset="${2 * Math.PI * 54}" style="transform: rotate(-90deg); transform-origin: center;"/>
          </svg>
          <div class="profile-ring__percent">0%</div>
        </div>
        <div class="profile-checklist">
          <div class="profile-checklist__item">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
              <polyline points="22 4 12 14.01 9 11.01"/>
            </svg>
            <span>Profile photo uploaded</span>
          </div>
          <div class="profile-checklist__item profile-checklist__item--pending">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"/>
              <line x1="12" y1="8" x2="12" y2="12"/>
              <line x1="12" y1="16" x2="12.01" y2="16"/>
            </svg>
            <span>Add your LinkedIn profile</span>
          </div>
          <div class="profile-checklist__item profile-checklist__item--pending">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"/>
              <line x1="12" y1="8" x2="12" y2="12"/>
              <line x1="12" y1="16" x2="12.01" y2="16"/>
            </svg>
            <span>Write your career highlights</span>
          </div>
        </div>
      </div>

      <div class="earnings-preview-card">
        <h3>This Month's Earnings</h3>
        <div class="earnings-preview__amount">
          <span class="currency">$</span>${expertData.earnings.thisMonth.toLocaleString()}
        </div>
        <p class="earnings-preview__subtitle">${expertData.sessions.filter(s => s.status === 'completed').length} sessions completed</p>
        <a href="#" class="btn btn--secondary" style="margin-top: 16px; width: 100%;" data-action="view-earnings">View Earnings Dashboard</a>
      </div>

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
            <h4>${expertData.sessions.filter(s => s.status === 'completed').length}</h4>
            <p>Total Sessions</p>
          </div>
        </div>
        <div class="stat-card">
          <div class="stat-card__icon">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"/>
            </svg>
          </div>
          <div class="stat-card__content">
            <h4>4.9</h4>
            <p>Average Rating</p>
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
            <p>Hours Taught</p>
          </div>
        </div>
      </div>
    </div>

    <div class="recent-sessions">
      <div class="recent-sessions__header">
        <h3>Upcoming Sessions</h3>
        <button class="btn btn--secondary" style="padding: 8px 16px; font-size: 13px;">View All</button>
      </div>
      ${expertData.sessions.filter(s => s.status !== 'completed').map(session => `
        <div class="session-row">
          <img src="${session.buyerPhoto}" alt="${session.buyer}" class="session-row__photo">
          <div class="session-row__info">
            <div class="session-row__name">${session.buyer}</div>
            <div class="session-row__meta">${session.time}</div>
          </div>
          <div class="session-row__date">${session.date}</div>
          <span class="status-badge status-badge--${session.status}">${session.status}</span>
          <button class="btn btn--secondary" style="padding: 8px 16px; font-size: 13px;">View Details</button>
        </div>
      `).join('')}
    </div>
  `;

  setTimeout(() => {
    animateRings = true;
    renderProfileRing();
  }, 100);
}

function renderEarnings() {
  const tab = document.getElementById('earnings-tab');
  if (!tab) return;

  const months = ['Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mar'];
  const maxEarning = Math.max(...expertData.monthlyEarnings);

  tab.innerHTML = `
    <div class="welcome-header">
      <h1>Earnings</h1>
      <p>Track your revenue and payouts</p>
    </div>

    <div class="quick-stats" style="margin-bottom: 40px;">
      <div class="stat-card">
        <div class="stat-card__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <line x1="12" y1="1" x2="12" y2="23"/>
            <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
          </svg>
        </div>
        <div class="stat-card__content">
          <h4>$${expertData.earnings.thisMonth.toLocaleString()}</h4>
          <p>This Month</p>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-card__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"/>
          </svg>
        </div>
        <div class="stat-card__content">
          <h4>$${expertData.earnings.allTime.toLocaleString()}</h4>
          <p>All Time</p>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-card__icon" style="background: rgba(59, 130, 246, 0.15);">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="color: var(--blue-info);">
            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
            <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
          </svg>
        </div>
        <div class="stat-card__content">
          <h4>$${expertData.earnings.pending.toLocaleString()}</h4>
          <p>Pending Payout</p>
        </div>
      </div>
    </div>

    <div class="earnings-chart-card">
      <div class="earnings-chart-card__header">
        <h3>Monthly Earnings</h3>
        <span class="earnings-chart-card__period">Last 6 months</span>
      </div>
      <div class="earnings-chart">
        <div class="earnings-chart__bars">
          ${expertData.monthlyEarnings.map((earning, i) => `
            <div class="earnings-bar-wrap">
              <div class="earnings-bar" data-earning="${earning}" style="height: 0;">
                <span class="earnings-bar__tooltip">$${earning.toLocaleString()}</span>
              </div>
              <span class="earnings-bar__label">${months[i]}</span>
            </div>
          `).join('')}
        </div>
      </div>
    </div>

    <div class="payout-card">
      <div class="payout-card__header">
        <h3>Next Payout</h3>
      </div>
      <div class="payout-card__amount">
        <span class="currency">$</span>${expertData.earnings.pending.toLocaleString()}
      </div>
      <p class="payout-card__date">Scheduled for May 1, 2026</p>
      <button class="btn btn--primary" style="margin-top: 16px;">Manage Payout Settings</button>
    </div>
  `;
}

function renderSchedule() {
  const tab = document.getElementById('schedule-tab');
  if (!tab) return;

  tab.innerHTML = `
    <div class="welcome-header">
      <h1>My Schedule</h1>
      <p>Manage your availability and upcoming sessions</p>
    </div>
    <div class="schedule-calendar-placeholder">
      <svg width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
        <line x1="16" y1="2" x2="16" y2="6"/>
        <line x1="8" y1="2" x2="8" y2="6"/>
        <line x1="3" y1="10" x2="21" y2="10"/>
      </svg>
      <p>Calendar view coming soon</p>
    </div>
  `;
}

function renderProfile() {
  const tab = document.getElementById('profile-tab');
  if (!tab) return;

  tab.innerHTML = `
    <div class="welcome-header">
      <h1>My Profile</h1>
      <p>Manage your expert profile</p>
    </div>
    <div style="text-align: center; padding: 80px 40px; background: var(--white); border-radius: var(--radius-lg);">
      <a href="profile.html" class="btn btn--primary" style="padding: 16px 32px; font-size: 16px;">Edit Profile</a>
    </div>
  `;
}

function renderSettings() {
  const tab = document.getElementById('settings-tab');
  if (!tab) return;

  tab.innerHTML = `
    <div class="welcome-header">
      <h1>Settings</h1>
      <p>Manage your account and preferences</p>
    </div>
    <div style="text-align: center; padding: 80px 40px; background: var(--white); border-radius: var(--radius-lg);">
      <p style="color: var(--gray-500);">Settings panel coming soon.</p>
    </div>
  `;
}

function initExpertDashboard() {
  renderVerificationBanner();
  initSidebar();
  renderOverview();
  renderEarnings();
  renderSchedule();
  renderProfile();
  renderSettings();

  document.addEventListener('click', (e) => {
    const earningsBtn = e.target.closest('[data-action="view-earnings"]');
    if (earningsBtn) {
      document.querySelector('.sidebar__nav-item[data-tab="earnings"]')?.click();
    }
  });
}

document.addEventListener('DOMContentLoaded', initExpertDashboard);