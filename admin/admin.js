const pendingApplications = [
  { id: 1, name: 'Dr. Richard Thornton', domain: 'Finance', date: 'Apr 20, 2026', linkedin: 'https://linkedin.com', photo: 'assets/experts/expert-2.jpg', bio: 'Former CFO with 30 years of experience at Fortune 500 companies. Expertise in M&A, financial restructuring, and corporate governance.', company: 'Ex-Goldman Sachs', designation: 'Chief Financial Officer', yearsExp: 30 },
  { id: 2, name: 'Lisa Park', domain: 'HR', date: 'Apr 19, 2026', linkedin: 'https://linkedin.com', photo: 'assets/experts/expert-3.jpg', bio: 'HR transformation leader with deep expertise in organizational design and talent management. Built HR functions at three unicorn startups.', company: 'Ex-Boeing', designation: 'Chief HR Officer', yearsExp: 25 },
  { id: 3, name: 'James Wilson', domain: 'Supply Chain', date: 'Apr 18, 2026', linkedin: 'https://linkedin.com', photo: 'assets/experts/expert-1.jpg', bio: 'Supply chain optimization specialist. Led logistics transformation at Amazon resulting in 40% cost reduction across 12 distribution centers.', company: 'Ex-Amazon', designation: 'Supply Chain Director', yearsExp: 22 }
];

const allSessions = [
  { id: 1, expert: 'Dr. Sarah Chen', expertPhoto: 'assets/experts/expert-1.jpg', buyer: 'Marcus Webb', buyerPhoto: 'assets/testimonials/buyer-1.jpg', domain: 'Finance', date: 'Apr 28, 2026', time: '10:00 AM', type: '1 Hour', amount: 350, status: 'confirmed' },
  { id: 2, expert: 'Dr. Sarah Chen', expertPhoto: 'assets/experts/expert-1.jpg', buyer: 'Priya Sharma', buyerPhoto: 'assets/testimonials/buyer-2.jpg', domain: 'Finance', date: 'Apr 28, 2026', time: '2:00 PM', type: '30 Min', amount: 175, status: 'confirmed' },
  { id: 3, expert: 'Jennifer Walsh', expertPhoto: 'assets/experts/expert-3.jpg', buyer: 'James Liu', buyerPhoto: 'assets/testimonials/buyer-3.jpg', domain: 'Operations', date: 'Apr 22, 2026', time: '11:00 AM', type: '1 Hour', amount: 380, status: 'completed' },
  { id: 4, expert: 'Michael Roberts', expertPhoto: 'assets/experts/expert-2.jpg', buyer: 'Elena Rodriguez', buyerPhoto: 'assets/testimonials/buyer-1.jpg', domain: 'Legal', date: 'Apr 15, 2026', time: '3:00 PM', type: '90 Min', amount: 400, status: 'completed' },
  { id: 5, expert: 'Amanda Foster', expertPhoto: 'assets/experts/expert-5.jpg', buyer: 'Robert Kim', buyerPhoto: 'assets/testimonials/buyer-2.jpg', domain: 'Technology', date: 'Apr 8, 2026', time: '10:00 AM', type: '1 Hour', amount: 420, status: 'cancelled' }
];

const platformStats = {
  totalGMV: 892400,
  totalRevenue: 196328,
  thisMonthRevenue: 42800,
  monthlyRevenue: [28500, 31200, 35800, 29400, 38200, 42800]
};

let currentAdminTab = 'pending';
let sortColumn = 'date';
let sortDirection = 'desc';

function initAdminTabs() {
  const tabs = document.querySelectorAll('.admin-navbar__tab');
  tabs.forEach(tab => {
    tab.addEventListener('click', () => {
      tabs.forEach(t => t.classList.remove('active'));
      tab.classList.add('active');
      currentAdminTab = tab.dataset.tab;
      document.querySelectorAll('.admin-tab').forEach(t => t.classList.remove('active'));
      document.getElementById(`${currentAdminTab}-tab`).classList.add('active');
      renderCurrentTab();
    });
  });
}

function renderCurrentTab() {
  if (currentAdminTab === 'pending') renderPendingReviews();
  if (currentAdminTab === 'sessions') renderAllSessions();
  if (currentAdminTab === 'earnings') renderEarnings();
}

function renderPendingReviews() {
  const container = document.getElementById('pending-applications');
  const countEl = document.querySelector('.count-chip__number');
  countEl.textContent = pendingApplications.length;

  container.innerHTML = pendingApplications.map(app => `
    <div class="application-card" data-id="${app.id}">
      <img src="${app.photo}" alt="${app.name}" class="application-card__photo">
      <div class="application-card__info">
        <h4>${app.name}</h4>
        <p>${app.domain} Expert · ${app.company} · Applied ${app.date}</p>
        <a href="${app.linkedin}" target="_blank">View LinkedIn →</a>
      </div>
      <button class="btn btn--secondary" onclick="openDrawer(${app.id})">View Profile</button>
      <div class="application-card__actions" style="position: relative;">
        <button class="btn btn--approve" onclick="showApproveConfirm(this, ${app.id})">Approve</button>
        <button class="btn btn--reject" onclick="showRejectPopover(this, ${app.id})">Reject</button>
        <div class="confirm-tooltip" onclick="event.stopPropagation()">
          Confirm approval?
          <div class="confirm-tooltip__buttons">
            <button class="confirm-tooltip__btn confirm-tooltip__btn--yes" onclick="approveApplication(${app.id})">Yes</button>
            <button class="confirm-tooltip__btn confirm-tooltip__btn--no" onclick="hideConfirmTooltip(this)">No</button>
          </div>
        </div>
        <div class="reject-popover" onclick="event.stopPropagation()">
          <textarea placeholder="Reason for rejection (optional)..."></textarea>
          <button class="btn btn--primary" onclick="rejectApplication(${app.id})">Confirm Rejection</button>
        </div>
      </div>
    </div>
  `).join('');
}

function showApproveConfirm(btn, id) {
  hideAllPopovers();
  btn.closest('.application-card__actions').querySelector('.confirm-tooltip').classList.add('visible');
}

function showRejectPopover(btn, id) {
  hideAllPopovers();
  btn.closest('.application-card__actions').querySelector('.reject-popover').classList.add('visible');
}

function hideConfirmTooltip(btn) {
  btn.closest('.confirm-tooltip').classList.remove('visible');
}

function hideAllPopovers() {
  document.querySelectorAll('.confirm-tooltip, .reject-popover').forEach(p => p.classList.remove('visible'));
}

function approveApplication(id) {
  hideAllPopovers();
  const card = document.querySelector(`.application-card[data-id="${id}"]`);
  card.classList.add('exiting');

  setTimeout(() => {
    const index = pendingApplications.findIndex(a => a.id === id);
    if (index > -1) pendingApplications.splice(index, 1);
    renderPendingReviews();
    showToast('Application approved successfully', 'success');
  }, 300);
}

function rejectApplication(id) {
  hideAllPopovers();
  const card = document.querySelector(`.application-card[data-id="${id}"]`);
  card.classList.add('exiting');

  setTimeout(() => {
    const index = pendingApplications.findIndex(a => a.id === id);
    if (index > -1) pendingApplications.splice(index, 1);
    renderPendingReviews();
    showToast('Application rejected', 'error');
  }, 300);
}

function openDrawer(id) {
  const app = pendingApplications.find(a => a.id === id);
  if (!app) return;

  const drawer = document.querySelector('.profile-drawer');
  const overlay = document.querySelector('.drawer-overlay');

  drawer.querySelector('.profile-drawer__header h3').textContent = app.name;
  drawer.querySelector('.profile-drawer__photo').src = app.photo;
  drawer.querySelector('.profile-drawer__photo').alt = app.name;
  drawer.querySelector('.profile-drawer__content').innerHTML = `
    <div class="profile-drawer__section">
      <h4>Domain</h4>
      <p>${app.domain}</p>
    </div>
    <div class="profile-drawer__section">
      <h4>Background</h4>
      <p>${app.company} · ${app.designation} · ${app.yearsExp}+ Years Experience</p>
    </div>
    <div class="profile-drawer__section">
      <h4>Bio</h4>
      <p>${app.bio}</p>
    </div>
    <div class="profile-drawer__section">
      <h4>Applied</h4>
      <p>${app.date}</p>
    </div>
    <div class="profile-drawer__section">
      <h4>LinkedIn</h4>
      <p><a href="${app.linkedin}" target="_blank">${app.linkedin}</a></p>
    </div>
  `;
  drawer.querySelector('.btn--approve').onclick = () => { closeDrawer(); approveApplication(id); };
  drawer.querySelector('.btn--reject').onclick = () => { closeDrawer(); rejectApplication(id); };

  drawer.classList.add('active');
  overlay.classList.add('active');
}

function closeDrawer() {
  document.querySelector('.profile-drawer').classList.remove('active');
  document.querySelector('.drawer-overlay').classList.remove('active');
}

function renderAllSessions() {
  const table = document.getElementById('sessions-table');
  const sorted = [...allSessions].sort((a, b) => {
    let aVal = a[sortColumn];
    let bVal = b[sortColumn];
    if (sortColumn === 'amount') { aVal = parseInt(aVal); bVal = parseInt(bVal); }
    if (sortDirection === 'asc') return aVal > bVal ? 1 : -1;
    return aVal < bVal ? 1 : -1;
  });

  table.innerHTML = `
    <div class="data-table__header" style="grid-template-columns: 1.5fr 1fr 1.5fr 1fr 1fr 1fr 1fr;">
      <div class="data-table__header-cell" onclick="sortTable('expert')">
        Expert
        <span class="sort-indicator ${sortColumn === 'expert' ? 'active ' + sortDirection : ''}">
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M7 10l5-5 5 5z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M7 14l5 5 5-5z"/></svg>
        </span>
      </div>
      <div>Buyer</div>
      <div class="data-table__header-cell" onclick="sortTable('date')">
        Date & Time
        <span class="sort-indicator ${sortColumn === 'date' ? 'active ' + sortDirection : ''}">
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M7 10l5-5 5 5z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M7 14l5 5 5-5z"/></svg>
        </span>
      </div>
      <div>Type</div>
      <div class="data-table__header-cell" onclick="sortTable('amount')">
        Amount
        <span class="sort-indicator ${sortColumn === 'amount' ? 'active ' + sortDirection : ''}">
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M7 10l5-5 5 5z"/></svg>
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M7 14l5 5 5-5z"/></svg>
        </span>
      </div>
      <div>Status</div>
      <div>Actions</div>
    </div>
    ${sorted.map(session => `
      <div class="data-table__row" style="grid-template-columns: 1.5fr 1fr 1.5fr 1fr 1fr 1fr 1fr;">
        <div class="data-table__expert">
          <img src="${session.expertPhoto}" alt="${session.expert}">
          <span>${session.expert}</span>
        </div>
        <div>${session.buyer}</div>
        <div>${session.date}<br><small>${session.time}</small></div>
        <div>${session.type}</div>
        <div>$${session.amount}</div>
        <div><span class="status-badge status-badge--${session.status}">${session.status}</span></div>
        <div><button class="btn btn--secondary" style="padding: 6px 12px; font-size: 12px;">View</button></div>
      </div>
    `).join('')}
  `;
}

function sortTable(column) {
  if (sortColumn === column) {
    sortDirection = sortDirection === 'asc' ? 'desc' : 'asc';
  } else {
    sortColumn = column;
    sortDirection = 'desc';
  }
  renderAllSessions();
}

function renderEarnings() {
  const months = ['Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mar'];
  const maxRevenue = Math.max(...platformStats.monthlyRevenue);

  document.getElementById('total-gmv').textContent = '$' + platformStats.totalGMV.toLocaleString();
  document.getElementById('total-revenue').textContent = '$' + platformStats.totalRevenue.toLocaleString();
  document.getElementById('month-revenue').textContent = '$' + platformStats.thisMonthRevenue.toLocaleString();

  const chartBars = document.querySelector('.admin-chart');
  chartBars.innerHTML = platformStats.monthlyRevenue.map((rev, i) => `
    <div class="admin-chart__bar-wrap">
      <div class="admin-chart__bar" style="height: ${(rev / maxRevenue) * 100}%;">
        <span class="admin-chart__tooltip">$${rev.toLocaleString()}</span>
      </div>
      <span class="admin-chart__label">${months[i]}</span>
    </div>
  `).join('');
}

function showToast(message, type) {
  const toast = document.getElementById('admin-toast');
  toast.querySelector('span').textContent = message;
  toast.className = 'admin-toast admin-toast--' + type;
  toast.classList.add('show');

  setTimeout(() => {
    toast.classList.remove('show');
  }, 3000);
}

function initDownloadBtn() {
  const btn = document.querySelector('.download-btn');
  btn?.addEventListener('click', () => {
    btn.classList.add('loading');
    setTimeout(() => {
      btn.classList.remove('loading');
      showToast('CSV downloaded', 'success');
    }, 500);
  });
}

function initAdmin() {
  initAdminTabs();
  renderCurrentTab();
  initDownloadBtn();

  document.querySelector('.drawer-overlay')?.addEventListener('click', closeDrawer);
  document.querySelector('.profile-drawer__close')?.addEventListener('click', closeDrawer);

  document.addEventListener('click', (e) => {
    if (!e.target.closest('.application-card__actions')) {
      hideAllPopovers();
    }
  });
}

document.addEventListener('DOMContentLoaded', initAdmin);