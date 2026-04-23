const domains = [
  { id: 'finance', name: 'Finance', count: 28 },
  { id: 'legal', name: 'Legal', count: 24 },
  { id: 'operations', name: 'Operations', count: 31 },
  { id: 'healthcare', name: 'Healthcare', count: 19 },
  { id: 'technology', name: 'Technology', count: 36 },
  { id: 'hr', name: 'HR', count: 22 },
  { id: 'sales', name: 'Sales', count: 27 },
  { id: 'supply_chain', name: 'Supply Chain', count: 15 },
  { id: 'marketing', name: 'Marketing', count: 29 },
  { id: 'real_estate', name: 'Real Estate', count: 18 }
];

const experienceOptions = [
  { value: '15+', label: '15+ Years' },
  { value: '20+', label: '20+ Years' },
  { value: '25+', label: '25+ Years' },
  { value: '30+', label: '30+ Years' },
  { value: 'any', label: 'Any Experience' }
];

const ratingOptions = [4, 3, 2, 1];

const expertsData = [
  { id: 1, name: 'Dr. Sarah Chen', title: 'Former VP at Goldman Sachs', domain: 'Finance', rating: 4.9, reviews: 127, yearsExp: 25, sessions: 340, rate: 350, bio: 'Specialized in M&A advisory and corporate restructuring with 25 years of experience at top-tier financial institutions.', image: 'assets/experts/expert-1.jpg' },
  { id: 2, name: 'Michael Roberts', title: 'Partner at Davis & Co', domain: 'Legal', rating: 4.8, reviews: 94, yearsExp: 30, sessions: 280, rate: 400, bio: 'Corporate law expert focusing on startup funding, IP protection, and regulatory compliance for tech companies.', image: 'assets/experts/expert-2.jpg' },
  { id: 3, name: 'Jennifer Walsh', title: 'Ex-McKinsey Director', domain: 'Operations', rating: 4.9, reviews: 156, sessions: 420, yearsExp: 22, rate: 380, bio: 'Operations strategy specialist helping companies optimize supply chains and implement lean manufacturing principles.', image: 'assets/experts/expert-3.jpg' },
  { id: 4, name: 'Robert Kim', title: 'Former CTO, Siemens Health', domain: 'Healthcare', rating: 4.7, reviews: 82, yearsExp: 28, sessions: 195, rate: 320, bio: 'Healthcare technology consultant with expertise in HIPAA compliance, EHR systems, and digital transformation.', image: 'assets/experts/expert-4.jpg' },
  { id: 5, name: 'Amanda Foster', title: 'SVP Engineering, Google', domain: 'Technology', rating: 4.9, reviews: 143, yearsExp: 20, sessions: 310, rate: 420, bio: 'Technical leadership coach helping engineers transition into management and navigate big tech career paths.', image: 'assets/experts/expert-5.jpg' },
  { id: 6, name: 'David Mitchell', title: 'Former VP Sales, Oracle', domain: 'Sales', rating: 4.8, reviews: 118, yearsExp: 26, sessions: 260, rate: 290, bio: 'Enterprise sales strategist with a track record of building high-performing SaaS sales teams from scratch.', image: 'assets/experts/expert-1.jpg' },
  { id: 7, name: 'Lisa Park', title: 'Chief HR Officer, Boeing', domain: 'HR', rating: 4.9, reviews: 89, yearsExp: 24, sessions: 220, rate: 270, bio: 'HR transformation expert specializing in organizational design, talent management, and workplace culture.', image: 'assets/experts/expert-2.jpg' },
  { id: 8, name: 'James Wilson', title: 'Supply Chain Director, Amazon', domain: 'Supply Chain', rating: 4.6, reviews: 67, yearsExp: 22, sessions: 150, rate: 310, bio: 'Logistics optimization specialist helping businesses scale their supply chain operations for global expansion.', image: 'assets/experts/expert-3.jpg' },
  { id: 9, name: 'Rachel Green', title: 'CMO, Unilever', domain: 'Marketing', rating: 4.9, reviews: 132, yearsExp: 28, sessions: 380, rate: 340, bio: 'Brand strategy expert with deep experience in digital marketing, consumer psychology, and global market positioning.', image: 'assets/experts/expert-4.jpg' },
  { id: 10, name: 'Thomas Reed', title: 'Real Estate Developer', domain: 'Real Estate', rating: 4.7, reviews: 76, yearsExp: 32, sessions: 190, rate: 360, bio: 'Commercial real estate veteran specializing in mixed-use development and adaptive reuse projects.', image: 'assets/experts/expert-5.jpg' },
  { id: 11, name: 'Elena Rodriguez', title: 'Finance Director, Tesla', domain: 'Finance', rating: 4.8, reviews: 95, yearsExp: 18, sessions: 210, rate: 380, bio: 'Fintech and startup finance specialist with expertise in fundraising, valuation, and investor relations.', image: 'assets/experts/expert-1.jpg' },
  { id: 12, name: 'Mark Thompson', title: 'IP Attorney, Fenwick', domain: 'Legal', rating: 4.9, reviews: 108, yearsExp: 20, sessions: 245, rate: 450, bio: 'Intellectual property lawyer helping startups protect their innovations through patents, trademarks, and trade secrets.', image: 'assets/experts/expert-2.jpg' }
];

let currentFilters = {
  search: '',
  domains: [],
  minPrice: 0,
  maxPrice: 500,
  minRating: 0,
  experience: '',
  sort: 'best_match'
};

let currentPage = 1;
const itemsPerPage = 9;

function initQuickFilters() {
  const container = document.querySelector('.page-hero__quick-filters');
  if (!container) return;

  container.innerHTML = domains.slice(0, 5).map(domain => `
    <button class="quick-filter-chip" data-domain="${domain.id}">${domain.name}</button>
  `).join('');

  container.addEventListener('click', (e) => {
    const chip = e.target.closest('.quick-filter-chip');
    if (!chip) return;

    chip.classList.toggle('active');
    const domainId = chip.dataset.domain;

    if (chip.classList.contains('active')) {
      if (!currentFilters.domains.includes(domainId)) {
        currentFilters.domains.push(domainId);
      }
    } else {
      currentFilters.domains = currentFilters.domains.filter(d => d !== domainId);
    }

    currentPage = 1;
    renderExperts();
    updateSidebarFilters();
  });
}

function initFilterSidebar() {
  const sidebar = document.querySelector('.filter-sidebar');
  if (!sidebar) return;

  let html = `
    <div class="filter-section">
      <div class="filter-section__header">
        <h4>Domain</h4>
        <span class="filter-section__clear" data-filter="domains">Clear</span>
      </div>
      ${domains.map(domain => `
        <label class="checkbox-item">
          <input type="checkbox" value="${domain.id}">
          <span class="checkbox-item__custom">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
              <polyline points="20 6 9 17 4 12"/>
            </svg>
          </span>
          <span class="checkbox-item__label">${domain.name}</span>
          <span class="checkbox-item__count">${domain.count}</span>
        </label>
      `).join('')}
    </div>
  `;

  html += `
    <div class="filter-section">
      <div class="filter-section__header">
        <h4>Price Range</h4>
        <span class="filter-section__clear" data-filter="price">Clear</span>
      </div>
      <div class="price-range-slider" id="priceSlider">
        <div class="price-range-track"></div>
        <div class="price-range-fill"></div>
        <div class="price-range-thumb" data-thumb="min"></div>
        <div class="price-range-thumb" data-thumb="max"></div>
      </div>
      <div class="price-range-inputs">
        <input type="number" id="minPrice" value="0" min="0" max="500">
        <input type="number" id="maxPrice" value="500" min="0" max="500">
      </div>
    </div>
  `;

  html += `
    <div class="filter-section">
      <div class="filter-section__header">
        <h4>Experience</h4>
        <span class="filter-section__clear" data-filter="experience">Clear</span>
      </div>
      ${experienceOptions.map((opt, i) => `
        <label class="radio-item">
          <input type="radio" name="experience" value="${opt.value}">
          <span class="radio-item__custom"></span>
          <span class="radio-item__label">${opt.label}</span>
        </label>
      `).join('')}
    </div>
  `;

  html += `
    <div class="filter-section">
      <div class="filter-section__header">
        <h4>Minimum Rating</h4>
        <span class="filter-section__clear" data-filter="rating">Clear</span>
      </div>
      ${ratingOptions.map(rating => `
        <div class="rating-item" data-rating="${rating}">
          <div class="rating-item__stars">
            ${[1,2,3,4,5].map(i => `
              <svg class="${i <= rating ? 'star--filled' : 'star--empty'}" viewBox="0 0 24 24" fill="currentColor">
                <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
              </svg>
            `).join('')}
          </div>
          <span class="rating-item__label">& up</span>
        </div>
      `).join('')}
    </div>
  `;

  html += `
    <div class="filter-sidebar__apply">
      <button class="btn btn--primary" id="applyFilters">Apply Filters</button>
    </div>
  `;

  sidebar.innerHTML = html;

  initPriceSlider();
  initSidebarListeners();
}

function initPriceSlider() {
  const slider = document.getElementById('priceSlider');
  const minThumb = slider.querySelector('[data-thumb="min"]');
  const maxThumb = slider.querySelector('[data-thumb="max"]');
  const fill = slider.querySelector('.price-range-fill');
  const minInput = document.getElementById('minPrice');
  const maxInput = document.getElementById('maxPrice');

  const maxVal = 500;
  let isDragging = null;
  let startX = 0;
  let startVal = 0;

  function updateSlider() {
    const min = parseInt(minInput.value) || 0;
    const max = parseInt(maxInput.value) || 500;

    const minPercent = (min / maxVal) * 100;
    const maxPercent = (max / maxVal) * 100;

    minThumb.style.left = `${minPercent}%`;
    maxThumb.style.left = `${maxPercent}%`;
    fill.style.left = `${minPercent}%`;
    fill.style.width = `${maxPercent - minPercent}%`;

    currentFilters.minPrice = min;
    currentFilters.maxPrice = max;
  }

  function handleMouseDown(e) {
    isDragging = e.target.dataset.thumb;
    startX = e.clientX;
    startVal = isDragging === 'min' ? parseInt(minInput.value) : parseInt(maxInput.value);
    document.addEventListener('mousemove', handleMouseMove);
    document.addEventListener('mouseup', handleMouseUp);
  }

  function handleMouseMove(e) {
    if (!isDragging) return;

    const deltaX = e.clientX - startX;
    const trackWidth = slider.offsetWidth;
    const deltaVal = Math.round((deltaX / trackWidth) * maxVal);

    if (isDragging === 'min') {
      let newVal = Math.max(0, Math.min(startVal + deltaVal, parseInt(maxInput.value) - 50));
      minInput.value = newVal;
    } else {
      let newVal = Math.max(parseInt(minInput.value) + 50, Math.min(startVal + deltaVal, maxVal));
      maxInput.value = newVal;
    }

    updateSlider();
  }

  function handleMouseUp() {
    isDragging = null;
    document.removeEventListener('mousemove', handleMouseMove);
    document.removeEventListener('mouseup', handleMouseUp);
  }

  minThumb.addEventListener('mousedown', handleMouseDown);
  maxThumb.addEventListener('mousedown', handleMouseDown);

  minInput.addEventListener('input', updateSlider);
  maxInput.addEventListener('input', updateSlider);

  updateSlider();
}

function initSidebarListeners() {
  const sidebar = document.querySelector('.filter-sidebar');

  sidebar.addEventListener('change', (e) => {
    if (e.target.type === 'checkbox') {
      const value = e.target.value;
      if (e.target.checked) {
        currentFilters.domains.push(value);
      } else {
        currentFilters.domains = currentFilters.domains.filter(d => d !== value);
      }
      updateClearVisibility('domains');
    }

    if (e.target.type === 'radio' && e.target.name === 'experience') {
      currentFilters.experience = e.target.value;
      updateClearVisibility('experience');
    }
  });

  sidebar.addEventListener('click', (e) => {
    const ratingItem = e.target.closest('.rating-item');
    if (ratingItem) {
      document.querySelectorAll('.rating-item').forEach(item => item.classList.remove('active'));
      ratingItem.classList.add('active');
      currentFilters.minRating = parseInt(ratingItem.dataset.rating);
      updateClearVisibility('rating');
    }

    const clearBtn = e.target.closest('.filter-section__clear');
    if (clearBtn) {
      const filter = clearBtn.dataset.filter;
      clearFilter(filter);
    }

    const applyBtn = e.target.closest('#applyFilters');
    if (applyBtn) {
      currentPage = 1;
      renderExperts();
    }
  });

  document.querySelectorAll('.filter-section__clear').forEach(btn => {
    btn.addEventListener('click', () => {
      clearFilter(btn.dataset.filter);
    });
  });
}

function updateClearVisibility(filter) {
  const clearBtn = document.querySelector(`[data-filter="${filter}"]`);
  if (!clearBtn) return;

  let hasValue = false;
  if (filter === 'domains') hasValue = currentFilters.domains.length > 0;
  if (filter === 'price') hasValue = currentFilters.minPrice > 0 || currentFilters.maxPrice < 500;
  if (filter === 'experience') hasValue = currentFilters.experience !== '';
  if (filter === 'rating') hasValue = currentFilters.minRating > 0;

  clearBtn.classList.toggle('visible', hasValue);
}

function clearFilter(filter) {
  if (filter === 'domains') {
    currentFilters.domains = [];
    document.querySelectorAll('.filter-sidebar input[type="checkbox"]').forEach(cb => cb.checked = false);
  }
  if (filter === 'price') {
    currentFilters.minPrice = 0;
    currentFilters.maxPrice = 500;
    document.getElementById('minPrice').value = 0;
    document.getElementById('maxPrice').value = 500;
    const slider = document.getElementById('priceSlider');
    slider.querySelector('[data-thumb="min"]').style.left = '0%';
    slider.querySelector('[data-thumb="max"]').style.left = '100%';
    slider.querySelector('.price-range-fill').style.left = '0%';
    slider.querySelector('.price-range-fill').style.width = '100%';
  }
  if (filter === 'experience') {
    currentFilters.experience = '';
    document.querySelectorAll('.filter-sidebar input[name="experience"]').forEach(rb => rb.checked = false);
  }
  if (filter === 'rating') {
    currentFilters.minRating = 0;
    document.querySelectorAll('.rating-item').forEach(item => item.classList.remove('active'));
  }

  updateClearVisibility(filter);
}

function updateSidebarFilters() {
  document.querySelectorAll('.filter-sidebar input[type="checkbox"]').forEach(cb => {
    cb.checked = currentFilters.domains.includes(cb.value);
  });
  updateClearVisibility('domains');
}

function filterExperts() {
  return expertsData.filter(expert => {
    if (currentFilters.search && !expert.name.toLowerCase().includes(currentFilters.search.toLowerCase()) &&
        !expert.title.toLowerCase().includes(currentFilters.search.toLowerCase())) {
      return false;
    }

    if (currentFilters.domains.length > 0 && !currentFilters.domains.includes(expert.domain.toLowerCase().replace(' ', '_'))) {
      return false;
    }

    if (expert.rate < currentFilters.minPrice || expert.rate > currentFilters.maxPrice) {
      return false;
    }

    if (currentFilters.minRating > 0 && expert.rating < currentFilters.minRating) {
      return false;
    }

    if (currentFilters.experience) {
      const minYears = parseInt(currentFilters.experience);
      if (expert.yearsExp < minYears) return false;
    }

    return true;
  });
}

function sortExperts(experts) {
  const sortFns = {
    best_match: () => experts.sort((a, b) => b.rating - a.rating),
    highest_rated: () => experts.sort((a, b) => b.rating - a.rating),
    most_sessions: () => experts.sort((a, b) => b.sessions - a.sessions),
    price_low: () => experts.sort((a, b) => a.rate - b.rate),
    price_high: () => experts.sort((a, b) => b.rate - a.rate)
  };

  return sortFns[currentFilters.sort] ? sortFns[currentFilters.sort]() : experts;
}

function parseUrlParams() {
  const params = new URLSearchParams(window.location.search);

  if (params.has('domain')) {
    const domainId = params.get('domain');
    currentFilters.domains = [domainId];
    const chip = document.querySelector(`.quick-filter-chip[data-domain="${domainId}"]`);
    if (chip) chip.classList.add('active');
  }

  if (params.has('keyword')) {
    const keyword = params.get('keyword');
    currentFilters.search = keyword;
    const searchInput = document.querySelector('.page-hero__search-input');
    if (searchInput) searchInput.value = keyword;
  }
}

function updateUrlParams() {
  const params = new URLSearchParams();

  if (currentFilters.search) params.set('keyword', currentFilters.search);
  if (currentFilters.domains.length > 0) params.set('domain', currentFilters.domains[0]);
  if (currentFilters.sort !== 'best_match') params.set('sort', currentFilters.sort);

  const newUrl = params.toString() ? `?${params.toString()}` : window.location.pathname;
  history.pushState({}, '', newUrl);
}

function renderExperts() {
  const grid = document.querySelector('.expert-cards-grid');
  const countEl = document.querySelector('.results-header__count');

  grid.classList.add('loading');

  setTimeout(() => {
    const filtered = sortExperts(filterExperts());
    const total = filtered.length;
    const start = (currentPage - 1) * itemsPerPage;
    const pageExperts = filtered.slice(start, start + itemsPerPage);

    countEl.innerHTML = `Showing <strong>${pageExperts.length}</strong> of <strong>${total}</strong> experts`;

    grid.classList.remove('loading');

    if (pageExperts.length === 0) {
      grid.innerHTML = `
        <div style="grid-column: 1/-1; text-align: center; padding: 64px 24px;">
          <p style="font-size: 18px; color: var(--gray-600);">No experts found matching your criteria.</p>
          <button class="btn btn--primary" style="margin-top: 16px;" onclick="clearAllFilters()">Clear Filters</button>
        </div>
      `;
      return;
    }

    grid.innerHTML = pageExperts.map(expert => `
      <div class="expert-card" onclick="window.location.href='profile.html?id=${expert.id}'">
        <div class="expert-card__photo-wrap">
          <img src="${expert.image}" alt="${expert.name}" class="expert-card__photo" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 280 180%22><rect fill=%22%23112240%22 width=%22280%22 height=%22180%22/><text x=%2250%%22 y=%2255%%22 text-anchor=%22middle%22 fill=%22%23F5A623%22 font-size=%2248%22>${expert.name.charAt(0)}</text></svg>'">
          <div class="expert-card__photo-overlay"></div>
          <span class="expert-card__badge expert-card__badge--verified">✓ Verified</span>
          <span class="expert-card__badge expert-card__badge--domain">${expert.domain}</span>
        </div>
        <div class="expert-card__body">
          <h3 class="expert-card__name">${expert.name}</h3>
          <p class="expert-card__designation">${expert.title}</p>
          <div class="expert-card__rating">
            <div class="expert-card__rating-stars">
              ${[1,2,3,4,5].map(i => `
                <svg class="${i <= Math.round(expert.rating) ? 'star--filled' : 'star--empty'}" viewBox="0 0 24 24" fill="currentColor">
                  <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                </svg>
              `).join('')}
            </div>
            <span class="expert-card__rating-text">${expert.rating}</span>
            <span class="expert-card__rating-count">(${expert.reviews})</span>
          </div>
          <div class="expert-card__stats">
            <span class="expert-card__stat expert-card__stat--experience">${expert.yearsExp}+ Years</span>
            <span class="expert-card__stat expert-card__stat--sessions">${expert.sessions} Sessions</span>
          </div>
          <p class="expert-card__bio">${expert.bio}</p>
          <div class="expert-card__price">$${expert.rate}<span>/hr</span></div>
          <div class="expert-card__footer">
            <a href="profile.html?id=${expert.id}" class="btn btn--secondary">View Profile</a>
            <a href="booking.html?expert=${expert.id}" class="btn btn--primary">Book Now</a>
          </div>
        </div>
      </div>
    `).join('');

    renderPagination(total);
    updateUrlParams();
  }, 500);
}

function initSortDropdown() {
  const select = document.getElementById('sortSelect');
  if (!select) return;

  select.addEventListener('change', () => {
    currentFilters.sort = select.value;
    currentPage = 1;
    renderExperts();
  });
}

document.addEventListener('DOMContentLoaded', () => {
  renderSkeletons();
  parseUrlParams();
  initQuickFilters();
  initFilterSidebar();
  initSearch();
  initSortDropdown();
  initMobileFilters();

  setTimeout(() => {
    renderExperts();
  }, 800);
});

function renderPagination(total) {
  const container = document.querySelector('.pagination');
  if (!container) return;

  const totalPages = Math.ceil(total / itemsPerPage);
  if (totalPages <= 1) {
    container.innerHTML = '';
    return;
  }

  let html = '';
  if (currentPage > 1) {
    html += `<button class="pagination__btn" data-page="${currentPage - 1}">&laquo; Prev</button>`;
  }
  for (let i = 1; i <= totalPages; i++) {
    html += `<button class="pagination__btn ${i === currentPage ? 'active' : ''}" data-page="${i}">${i}</button>`;
  }
  if (currentPage < totalPages) {
    html += `<button class="pagination__btn" data-page="${currentPage + 1}">Next &raquo;</button>`;
  }

  container.innerHTML = html;

  container.addEventListener('click', (e) => {
    const btn = e.target.closest('.pagination__btn');
    if (!btn) return;
    currentPage = parseInt(btn.dataset.page);
    renderExperts();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
}

function initSearch() {
  const searchInput = document.querySelector('.page-hero__search-input');
  const searchBtn = document.querySelector('.page-hero__search-btn');
  if (!searchInput || !searchBtn) return;

  let debounceTimer;

  searchInput.addEventListener('input', () => {
    clearTimeout(debounceTimer);
    debounceTimer = setTimeout(() => {
      currentFilters.search = searchInput.value;
      currentPage = 1;
      renderExperts();
    }, 300);
  });

  searchBtn.addEventListener('click', () => {
    currentFilters.search = searchInput.value;
    currentPage = 1;
    renderExperts();
  });

  searchInput.addEventListener('keydown', (e) => {
    if (e.key === 'Enter') {
      currentFilters.search = searchInput.value;
      currentPage = 1;
      renderExperts();
    }
  });
}

function renderSkeletons() {
  const grid = document.querySelector('.expert-cards-grid');
  if (!grid) return;
  grid.classList.add('loading');

  grid.innerHTML = Array(9).fill(0).map(() => `
    <div class="skeleton-card">
      <div class="skeleton skeleton-card__photo"></div>
      <div class="skeleton-card__body">
        <div class="skeleton skeleton-card__line skeleton-card__line--medium"></div>
        <div class="skeleton skeleton-card__line skeleton-card__line--short"></div>
        <div class="skeleton skeleton-card__line skeleton-card__line--long"></div>
        <div class="skeleton skeleton-card__line skeleton-card__line--long"></div>
        <div class="skeleton skeleton-card__line skeleton-card__line--price"></div>
      </div>
    </div>
  `).join('');
}

function initMobileFilters() {
  const filterBtn = document.querySelector('[data-action="open-filter"]');
  const sortBtn = document.querySelector('[data-action="open-sort"]');
  const drawer = document.querySelector('.filter-drawer');
  const overlay = document.querySelector('.filter-drawer__overlay');
  const closeBtn = document.querySelector('.filter-drawer__close');
  const sortDropdown = document.querySelector('.sort-dropdown-mobile__content');
  const drawerContent = drawer?.querySelector('.filter-drawer__content');
  const sidebarContent = document.querySelector('.filter-sidebar');

  if (filterBtn && drawer && sidebarContent && drawerContent) {
    drawerContent.innerHTML = sidebarContent.innerHTML;

    drawerContent.querySelectorAll('input[type="checkbox"]').forEach(cb => {
      cb.addEventListener('change', () => {
        const value = cb.value;
        if (cb.checked) {
          if (!currentFilters.domains.includes(value)) currentFilters.domains.push(value);
        } else {
          currentFilters.domains = currentFilters.domains.filter(d => d !== value);
        }
      });
    });

    drawerContent.querySelectorAll('input[type="radio"]').forEach(rb => {
      rb.addEventListener('change', () => {
        if (rb.name === 'experience') currentFilters.experience = rb.value;
      });
    });

    drawerContent.querySelectorAll('.rating-item').forEach(item => {
      item.addEventListener('click', () => {
        drawerContent.querySelectorAll('.rating-item').forEach(i => i.classList.remove('active'));
        item.classList.add('active');
        currentFilters.minRating = parseInt(item.dataset.rating);
      });
    });

    filterBtn.addEventListener('click', () => {
      drawer.classList.add('active');
      overlay.classList.add('active');
      document.body.style.overflow = 'hidden';
    });

    closeBtn.addEventListener('click', closeDrawer);
    overlay.addEventListener('click', closeDrawer);

    function closeDrawer() {
      drawer.classList.remove('active');
      overlay.classList.remove('active');
      document.body.style.overflow = '';
    }

    const applyBtn = drawer.querySelector('#applyFilters');
    if (applyBtn) {
      applyBtn.addEventListener('click', () => {
        currentPage = 1;
        renderExperts();
        closeDrawer();
      });
    }
  }

  if (sortBtn && sortDropdown) {
    sortBtn.addEventListener('click', (e) => {
      e.stopPropagation();
      sortDropdown.classList.toggle('active');
    });

    document.addEventListener('click', () => {
      sortDropdown.classList.remove('active');
    });

    sortDropdown.querySelectorAll('.sort-dropdown-mobile__item').forEach(item => {
      item.addEventListener('click', () => {
        currentFilters.sort = item.dataset.sort;
        const selectEl = document.getElementById('sortSelect');
        if (selectEl) selectEl.value = currentFilters.sort;
        sortBtn.textContent = item.textContent;
        sortDropdown.classList.remove('active');
        currentPage = 1;
        renderExperts();
      });
    });
  }
}