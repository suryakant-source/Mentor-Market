const successStories = [
  { id: 1, category: 'finance', headline: 'From 18 Months of Financial Chaos to a Clean Series A in 6 Weeks', excerpt: 'A bootstrapped edtech company was drowning in books with no clear picture of its own revenue. Their retired CFO mentor introduced monthly financial reviews that transformed their investor readiness.', impacts: ['₹3.2 Cr Saved', '6 Weeks', 'Series A Closed'], expert: 'Dr. Sarah Chen', expertImage: 'assets/experts/expert-1.jpg', buyer: 'EduGrow Technologies', image: 'assets/success-stories/story-1.jpg', featured: false, views: 3420 },
  { id: 2, category: 'legal', headline: 'The Legal Clause That Could Have Killed the Deal — and the Expert Who Found It', excerpt: 'During due diligence for a ₹50 crore acquisition, a critical IP clause went unnoticed by the buying team. A retired IP attorney with 30 years of experience spotted it in the first review session.', impacts: ['Zero Disputes', '₹50 Cr Deal', 'Clean Exit'], expert: 'Michael Roberts', expertImage: 'assets/experts/expert-2.jpg', buyer: 'Nexus Acquisitions', image: 'assets/success-stories/story-2.jpg', featured: false, views: 2890 },
  { id: 3, category: 'operations', headline: 'How a Retired COO Cut Operational Costs by 40% Without Laying Off a Single Employee', excerpt: 'A mid-sized manufacturing company was bleeding money on inefficient processes. Their mentor helped redesign the production workflow, resulting in significant savings while preserving every job.', impacts: ['40% Cost Cut', '0 Layoffs', '3 Months'], expert: 'Jennifer Walsh', expertImage: 'assets/experts/expert-3.jpg', buyer: 'Apex Manufacturing', image: 'assets/success-stories/story-3.jpg', featured: false, views: 4150 },
  { id: 4, category: 'healthcare', headline: 'Rethinking Go-to-Market Strategy: A Health-tech Startup Finds Its Way', excerpt: 'A health-tech startup with a brilliant product had no idea how to reach hospitals. Their retired hospital COO mentor connected them with the right decision-makers and reshaped their entire GTM approach.', impacts: ['12 Hospital Partners', '₹2.4 Cr ARR', '6 Months'], expert: 'Robert Kim', expertImage: 'assets/experts/expert-4.jpg', buyer: 'MediChain Solutions', image: 'assets/success-stories/story-4.jpg', featured: false, views: 1980 },
  { id: 5, category: 'technology', headline: 'From Technical Founder to Tech Leader: A Journey of 18 Months', excerpt: 'A brilliant engineer with no management experience was promoted to CTO. Three months with a former SVP at Google helped him hire his first engineering managers, build a career ladder, and lead his team to ship faster.', impacts: ['Team of 25 Built', '3x Velocity', '18 Months'], expert: 'Amanda Foster', expertImage: 'assets/experts/expert-5.jpg', buyer: 'TechNova Labs', image: 'assets/success-stories/story-5.jpg', featured: false, views: 5230 },
  { id: 6, category: 'hr', headline: 'Turning a Toxic Culture Around: One HR Expert, One Startup at a Time', excerpt: 'A fast-growing startup was losing top talent every quarter due to a toxic work environment. Their HR mentor conducted anonymous surveys, introduced structured 1-on-1s, and implemented an async-first culture shift.', impacts: ['85% Retention', 'Toxicity Reduced', 'Top Glassdoor Rating'], expert: 'Lisa Park', expertImage: 'assets/experts/expert-2.jpg', buyer: 'ScaleUp Ventures', image: 'assets/success-stories/story-6.jpg', featured: false, views: 3670 },
  { id: 7, category: 'sales', headline: 'Building a Sales Machine: How a Startup Went from ₹0 to ₹5 Cr in 90 Days', excerpt: 'A product-led startup had no sales process and relied entirely on inbound. With guidance from a former Oracle VP of Sales, they built an outbound playbook that generated ₹5 crore in new ARR within three months.', impacts: ['₹5 Cr ARR', '90 Days', 'Outbound Playbook'], expert: 'David Mitchell', expertImage: 'assets/experts/expert-1.jpg', buyer: 'CloudFirst Solutions', image: 'assets/success-stories/story-7.jpg', featured: false, views: 4890 },
  { id: 8, category: 'supply_chain', headline: 'The Supply Chain Overhaul That Saved a Retail Startup from Collapse', excerpt: 'With supplier delays causing weeks of stockouts and growing customer complaints, a D2C brand was on the verge of collapse. Their supply chain expert restructured vendor relationships and introduced real-time inventory tracking.', impacts: ['₹1.8 Cr Saved', 'Zero Stockouts', '2 Months'], expert: 'James Wilson', expertImage: 'assets/experts/expert-3.jpg', buyer: 'D2C Essentials Co.', image: 'assets/success-stories/story-8.jpg', featured: false, views: 2340 },
  { id: 9, category: 'marketing', headline: 'Rebranding from Scratch: How a Legacy Brand Reconnected with a New Generation', excerpt: 'A 30-year-old consumer brand was losing market share to newer competitors. A former CMO with global experience helped them craft a brand repositioning strategy that resonated with younger audiences without alienating loyal customers.', impacts: ['35% Brand Lift', 'Gen Z Reach', '2x Revenue'], expert: 'Rachel Green', expertImage: 'assets/experts/expert-4.jpg', buyer: 'Heritage Consumer Goods', image: 'assets/success-stories/story-9.jpg', featured: false, views: 3020 },
  { id: 10, category: 'real_estate', headline: 'From ₹50 Lakh to ₹5 Crore: The Commercial Property Play That Changed Everything', excerpt: 'A first-time real estate developer wanted to get into commercial properties but had no track record and no bank relationships. Their mentor connected them with private equity partners and co-investors for a mixed-use project.', impacts: ['₹5 Crore Deal', 'Private Equity', 'Landmark Project'], expert: 'Thomas Reed', expertImage: 'assets/experts/expert-5.jpg', buyer: 'UrbanSpace Developers', image: 'assets/success-stories/story-10.jpg', featured: false, views: 1760 },
  { id: 11, category: 'finance', headline: 'When Your Books Are a Mess and Your Investor Deadline Is in 30 Days', excerpt: 'A startup founder preparing for a seed round discovered their cap table was broken and their financial statements were incomprehensible. Three intensive sessions with a finance expert got everything investor-ready in record time.', impacts: ['Seed Round Closed', '30 Days', 'Cap Table Fixed'], expert: 'Elena Rodriguez', expertImage: 'assets/experts/expert-1.jpg', buyer: 'FinScale India', image: 'assets/success-stories/story-11.jpg', featured: false, views: 2780 },
  { id: 12, category: 'legal', headline: 'Navigating GDPR Compliance: What Every Indian SaaS Company Gets Wrong', excerpt: 'A fast-growing Indian SaaS company was signing enterprise contracts with European clients and had no idea their data handling was non-compliant. A compliance expert session identified five critical gaps that could have resulted in fines.', impacts: ['GDPR Compliant', '5 Gaps Fixed', 'Enterprise Deals Won'], expert: 'Mark Thompson', expertImage: 'assets/experts/expert-2.jpg', buyer: 'DataFlow SaaS', image: 'assets/success-stories/story-12.jpg', featured: false, views: 3910 }
];

let currentCategory = 'all';
let currentSort = 'recent';
let visibleCount = 9;
let searchQuery = '';

function initCategoryFilters() {
  const pills = document.querySelectorAll('.filter-pill');
  pills.forEach(pill => {
    pill.addEventListener('click', () => {
      pills.forEach(p => p.classList.remove('active'));
      pill.classList.add('active');
      currentCategory = pill.dataset.category;
      visibleCount = 9;
      renderStories();
      renderMostRead();
    });
  });
}

function initSort() {
  const select = document.getElementById('sortSelect');
  if (!select) return;
  select.addEventListener('change', () => {
    currentSort = select.value;
    visibleCount = 9;
    renderStories();
  });
}

function initSearch() {
  const input = document.getElementById('storiesSearch');
  if (!input) return;
  let timer;
  input.addEventListener('input', () => {
    clearTimeout(timer);
    timer = setTimeout(() => {
      searchQuery = input.value.toLowerCase();
      visibleCount = 9;
      renderStories();
    }, 300);
  });
}

function initLoadMore() {
  const btn = document.getElementById('loadMoreBtn');
  if (!btn) return;
  btn.addEventListener('click', () => {
    btn.disabled = true;
    btn.textContent = 'Loading...';
    setTimeout(() => {
      visibleCount += 9;
      renderStories();
      btn.disabled = false;
      btn.textContent = 'Load More Stories';
    }, 400);
  });
}

function getFilteredStories() {
  let stories = successStories;

  if (currentCategory !== 'all') {
    stories = stories.filter(s => s.category === currentCategory);
  }

  if (searchQuery) {
    stories = stories.filter(s =>
      s.headline.toLowerCase().includes(searchQuery) ||
      s.excerpt.toLowerCase().includes(searchQuery) ||
      s.category.toLowerCase().includes(searchQuery) ||
      s.buyer.toLowerCase().includes(searchQuery) ||
      s.expert.toLowerCase().includes(searchQuery)
    );
  }

  if (currentSort === 'recent') {
    stories = [...stories].reverse();
  } else if (currentSort === 'viewed') {
    stories = [...stories].sort((a, b) => b.views - a.views);
  } else if (currentSort === 'impact') {
    stories = stories.sort((a, b) => b.impacts.length - a.impacts.length);
  }

  return stories;
}

function renderStories() {
  const grid = document.getElementById('storiesGrid');
  if (!grid) return;

  const filtered = getFilteredStories();
  const visible = filtered.slice(0, visibleCount);

  grid.innerHTML = visible.map((story, i) => `
    <div class="story-card" data-stagger style="animation-delay: ${i * 80}ms" onclick="window.location.href='success-stories-single.html?id=${story.id}'">
      <div class="story-card__image">
        <img src="${story.image}" alt="${story.headline}" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 400 220%22><rect fill=%22%23112240%22 width=%22400%22 height=%22220%22/><text x=%2250%%22 y=%2255%%22 text-anchor=%22middle%22 fill=%22%23F5A623%22 font-size=%2224%22>Story</text></svg>'">
        <span class="story-card__domain-badge">${story.category.replace('_', ' & ')}</span>
      </div>
      <div class="story-card__body">
        <div class="story-card__category">${story.category.replace('_', ' & ')}</div>
        <h3 class="story-card__headline">${story.headline}</h3>
        <p class="story-card__excerpt">${story.excerpt}</p>
        <div class="story-card__impact-chips">
          ${story.impacts.map(impact => `<span class="story-card__impact-chip">${impact}</span>`).join('')}
        </div>
        <div class="story-card__divider"></div>
        <div class="story-card__footer">
          <div class="story-card__expert">
            <img src="${story.expertImage}" alt="${story.expert}" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 32 32%22><circle cx=%2216%22 cy=%2216%22 r=%2216%22 fill=%22%23F5A623%22/><text x=%2250%%22 y=%2255%%22 text-anchor=%22middle%22 fill=%22%230A1628%22 font-size=%2212%22>${story.expert.charAt(0)}</text></svg>'">
            <div>
              <div class="story-card__expert-name">${story.expert}</div>
            </div>
          </div>
          <a href="#" class="story-card__read-link" onclick="event.stopPropagation(); window.location.href='success-stories-single.html?id=${story.id}'">Read Story</a>
        </div>
      </div>
    </div>
  `).join('');

  const countEl = document.getElementById('storiesCount');
  if (countEl) {
    countEl.textContent = `Showing ${visible.length} of ${filtered.length} stories`;
  }

  const btn = document.getElementById('loadMoreBtn');
  if (btn) {
    btn.style.display = visibleCount >= filtered.length ? 'none' : 'inline-flex';
  }
}

function renderMostRead() {
  const list = document.getElementById('mostReadList');
  if (!list) return;

  const top = [...successStories]
    .sort((a, b) => b.views - a.views)
    .slice(0, 5);

  list.innerHTML = top.map(story => `
    <div class="most-read-item" onclick="window.location.href='success-stories-single.html?id=${story.id}'">
      <img src="${story.image}" alt="${story.headline}" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 40 40%22><rect fill=%22%23E8ECF0%22 width=%2240%22 height=%2240%22/><text x=%2250%%22 y=%2255%%22 text-anchor=%22middle%22 fill=%22%234A5568%22 font-size=%2210%22>Story</text></svg>'">
      <div class="most-read-item-content">
        <div class="most-read-item-title">${story.headline}</div>
        <div class="most-read-item-views">${story.views.toLocaleString()} reads this month</div>
      </div>
    </div>
  `).join('');
}

function initFeaturedStory() {
  const featured = document.getElementById('featuredStory');
  if (!featured) return;

  featured.addEventListener('click', () => {
    window.location.href = 'success-stories-single.html?id=featured';
  });
}

function initCountUp() {
  const counters = document.querySelectorAll('.stories-hero .impact-number .number[data-count]');
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const el = entry.target;
        const target = parseInt(el.dataset.count);
        let current = 0;
        const step = target / 40;
        const timer = setInterval(() => {
          current += step;
          if (current >= target) {
            current = target;
            clearInterval(timer);
          }
          el.textContent = el.textContent.includes('₹')
            ? '₹' + Math.floor(current) + ' Crore'
            : Math.floor(current) + '%';
        }, 30);
        observer.unobserve(el);
      }
    });
  }, { threshold: 0.5 });

  counters.forEach(c => observer.observe(c));
}

document.addEventListener('DOMContentLoaded', () => {
  initCategoryFilters();
  initSort();
  initSearch();
  initLoadMore();
  initFeaturedStory();
  renderStories();
  renderMostRead();
  initCountUp();
});