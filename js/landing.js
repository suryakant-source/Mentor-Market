const domainIcons = {
  finance: `<svg viewBox="0 0 48 48" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 8h4l4-6h8l4 6h4c2.2 0 4 1.8 4 4v28c0 2.2-1.8 4-4 4H8c-2.2 0-4-1.8-4-4V12c0-2.2 1.8-4 4-4z"/><path d="M16 28v8"/><path d="M24 24v12"/><path d="M32 28v8"/></svg>`,
  legal: `<svg viewBox="0 0 48 48" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="8" y="8" width="32" height="32" rx="2"/><path d="M16 16h16"/><path d="M16 24h16"/><path d="M16 32h10"/></svg>`,
  operations: `<svg viewBox="0 0 48 48" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="24" cy="24" r="16"/><path d="M24 14v10l6 6"/></svg>`,
  healthcare: `<svg viewBox="0 0 48 48" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M24 4v40"/><path d="M4 24h40"/><rect x="8" y="8" width="32" height="32" rx="4"/></svg>`,
  technology: `<svg viewBox="0 0 48 48" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="4" y="12" width="40" height="24" rx="2"/><path d="M16 8v4"/><path d="M32 8v4"/><path d="M12 40h24"/></svg>`,
  hr: `<svg viewBox="0 0 48 48" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="24" cy="14" r="8"/><path d="M8 40c0-8.8 7.2-16 16-16s16 7.2 16 16"/></svg>`,
  sales: `<svg viewBox="0 0 48 48" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 40l10-16 8 12 10-20 12 24"/><circle cx="44" cy="8" r="4"/></svg>`,
  supply_chain: `<svg viewBox="0 0 48 48" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="4" y="24" width="12" height="12" rx="1"/><rect x="18" y="24" width="12" height="12" rx="1"/><rect x="32" y="24" width="12" height="12" rx="1"/><path d="M10 20V12h8v8"/><path d="M24 20V12h8v8"/><path d="M24 24l8-4 4 4"/></svg>`,
  marketing: `<svg viewBox="0 0 48 48" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M8 36V20l16-8 16 8v16"/><path d="M8 36h32"/><path d="M24 12v12"/></svg>`,
  real_estate: `<svg viewBox="0 0 48 48" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 20l20-12 20 12"/><path d="M8 20v20h32V20"/><path d="M20 40v-12h8v12"/></svg>`
};

const domains = [
  { id: 'finance', name: 'Finance', count: 28, icon: domainIcons.finance },
  { id: 'legal', name: 'Legal', count: 24, icon: domainIcons.legal },
  { id: 'operations', name: 'Operations', count: 31, icon: domainIcons.operations },
  { id: 'healthcare', name: 'Healthcare', count: 19, icon: domainIcons.healthcare },
  { id: 'technology', name: 'Technology', count: 36, icon: domainIcons.technology },
  { id: 'hr', name: 'HR', count: 22, icon: domainIcons.hr },
  { id: 'sales', name: 'Sales', count: 27, icon: domainIcons.sales },
  { id: 'supply_chain', name: 'Supply Chain', count: 15, icon: domainIcons.supply_chain },
  { id: 'marketing', name: 'Marketing', count: 29, icon: domainIcons.marketing },
  { id: 'real_estate', name: 'Real Estate', count: 18, icon: domainIcons.real_estate }
];

function initDomainsGrid() {
  const grid = document.querySelector('.domains__grid');
  if (!grid) return;

  grid.innerHTML = domains.map((domain, index) => `
    <div class="domain-card" data-domain="${domain.id}" data-stagger style="transition-delay: ${index * 60}ms">
      <div class="domain-card__icon">${domain.icon}</div>
      <div class="domain-card__name">${domain.name}</div>
      <div class="domain-card__count">${domain.count} Experts</div>
    </div>
  `).join('');

  grid.addEventListener('click', (e) => {
    const card = e.target.closest('.domain-card');
    if (!card) return;

    grid.querySelectorAll('.domain-card').forEach(c => c.classList.remove('domain-card--active'));
    card.classList.add('domain-card--active');

    const domainId = card.dataset.domain;
    setTimeout(() => {
      window.location.href = `experts.html?domain=${domainId}`;
    }, 300);
  });
}

function initExpertCards() {
  const container = document.querySelector('.experts-row');
  if (!container) return;

  const experts = [
    {
      name: 'Dr. Sarah Chen',
      title: 'Former VP at Goldman Sachs',
      domain: 'Finance',
      rating: 4.9,
      reviews: 127,
      rate: 350,
      image: 'assets/experts/expert-1.jpg'
    },
    {
      name: 'Michael Roberts',
      title: 'Partner at Davis & Co',
      domain: 'Legal',
      rating: 4.8,
      reviews: 94,
      rate: 400,
      image: 'assets/experts/expert-2.jpg'
    },
    {
      name: 'Jennifer Walsh',
      title: 'Ex-McKinsey Director',
      domain: 'Operations',
      rating: 4.9,
      reviews: 156,
      rate: 380,
      image: 'assets/experts/expert-3.jpg'
    },
    {
      name: 'Robert Kim',
      title: 'Former CTO, Siemens Health',
      domain: 'Healthcare',
      rating: 4.7,
      reviews: 82,
      rate: 320,
      image: 'assets/experts/expert-4.jpg'
    },
    {
      name: 'Amanda Foster',
      title: 'SVP Engineering, Google',
      domain: 'Technology',
      rating: 4.9,
      reviews: 143,
      rate: 420,
      image: 'assets/experts/expert-5.jpg'
    }
  ];

  container.innerHTML = experts.map(expert => `
    <div class="expert-card" onclick="window.location.href='profile.html?id=${expert.name.toLowerCase().replace(/\s/g, '-')}'">
      <img src="${expert.image}" alt="${expert.name}" class="expert-card__photo" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 96 96%22><circle cx=%2248%22 cy=%2248%22 r=%2248%22 fill=%22%23112240%22/><text x=%2250%%22 y=%2255%%22 text-anchor=%22middle%22 fill=%22%23F5A623%22 font-size=%2232%22>${expert.name.charAt(0)}</text></svg>'">
      <div class="expert-card__verified">✓ Verified</div>
      <div class="expert-card__name">${expert.name}</div>
      <div class="expert-card__title">${expert.title}</div>
      <span class="expert-card__domain">${expert.domain}</span>
      <div class="expert-card__rating">
        <div class="expert-card__stars">
          ${[1,2,3,4,5].map(i => `<svg class="${i <= Math.round(expert.rating) ? 'star--filled' : 'star--empty'}" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>`).join('')}
        </div>
        <span class="expert-card__rating-text">${expert.rating}</span>
        <span class="expert-card__reviews">(${expert.reviews})</span>
      </div>
      <div class="expert-card__price">$${expert.rate}<span>/hr</span></div>
      <button class="btn btn--ghost-light">View Profile</button>
    </div>
  `).join('');
}

function initExpertsNav() {
  const container = document.querySelector('.experts-row');
  const prevBtn = document.querySelector('.experts-nav-btn--prev');
  const nextBtn = document.querySelector('.experts-nav-btn--next');

  if (!container || !prevBtn || !nextBtn) return;

  const scrollAmount = 320;

  prevBtn.addEventListener('click', () => {
    container.scrollBy({ left: -scrollAmount, behavior: 'smooth' });
  });

  nextBtn.addEventListener('click', () => {
    container.scrollBy({ left: scrollAmount, behavior: 'smooth' });
  });
}

function initHowItWorks() {
  const section = document.querySelector('.how-it-works');
  if (!section) return;

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.2 });

  observer.observe(section);
}

function initTestimonialCards() {
  const cards = document.querySelectorAll('.testimonial-card');
  if (!cards.length) return;

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const card = entry.target;
        const delay = Array.from(cards).indexOf(card) * 120;
        setTimeout(() => {
          card.classList.add('visible');
        }, delay);
        observer.unobserve(card);
      }
    });
  }, { threshold: 0.2 });

  cards.forEach(card => observer.observe(card));
}

document.addEventListener('DOMContentLoaded', () => {
  initDomainsGrid();
  initExpertCards();
  initExpertsNav();
  initHowItWorks();
  initTestimonialCards();
});