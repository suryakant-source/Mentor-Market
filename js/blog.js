const blogPosts = [
  { id: 1, title: 'Why Retired Executives Make the Best Mentors', excerpt: 'After decades of building companies, navigating crises, and hiring thousands of people, retired executives carry a kind of knowledge that no course can teach. Here\'s why that experience is uniquely valuable.', category: 'Industry Insights', author: 'Raj Patel', authorImage: 'assets/experts/expert-1.jpg', date: 'February 12, 2026', readTime: '6 min read', image: 'assets/blog/blog-1.jpg', featured: true, views: 8420 },
  { id: 2, title: 'How to Choose the Right Mentor for Your Startup Stage', excerpt: 'Early-stage founders need different guidance than Series B companies. Here\'s a framework for matching your company\'s current challenges with an expert who\'s actually been there.', category: 'Founder Tips', author: 'Sarah Mitchell', authorImage: 'assets/experts/expert-2.jpg', date: 'February 8, 2026', readTime: '5 min read', image: 'assets/blog/blog-2.jpg', featured: false, views: 5630 },
  { id: 3, title: 'The CFO Checklist: What Investors Look for in Your Financials', excerpt: 'A retired CFO breaks down the five things every investor checks first in a startup\'s financial model — and how to get each one right before you step into a pitch meeting.', category: 'Finance', author: 'Dr. Sarah Chen', authorImage: 'assets/experts/expert-1.jpg', date: 'January 30, 2026', readTime: '8 min read', image: 'assets/blog/blog-3.jpg', featured: false, views: 7340 },
  { id: 4, title: 'Building a Culture That Retains Top Talent After Growth', excerpt: 'Three companies scaled from 20 to 200 employees. Here\'s what they all got wrong about culture — and what the HR experts who fixed it had to say.', category: 'HR & Culture', author: 'Lisa Park', authorImage: 'assets/experts/expert-2.jpg', date: 'January 24, 2026', readTime: '7 min read', image: 'assets/blog/blog-4.jpg', featured: false, views: 4890 },
  { id: 5, title: 'Healthcare Compliance in 2026: What Health-tech Startups Must Know', excerpt: 'HIPAA, DPDP, and cross-border data regulations are converging. A former hospital COO explains what every health-tech founder needs to build compliance-ready from day one.', category: 'Healthcare', author: 'Robert Kim', authorImage: 'assets/experts/expert-4.jpg', date: 'January 18, 2026', readTime: '9 min read', image: 'assets/blog/blog-5.jpg', featured: false, views: 3210 },
  { id: 6, title: 'From Engineer to CTO: The Skills Nobody Taught You', excerpt: 'The technical interview gets you the job. But managing engineers, aligning with the board, and shipping on time require an entirely different set of skills. Here\'s how to build them.', category: 'Technology', author: 'Amanda Foster', authorImage: 'assets/experts/expert-5.jpg', date: 'January 12, 2026', readTime: '6 min read', image: 'assets/blog/blog-6.jpg', featured: false, views: 6780 },
  { id: 7, title: 'Supply Chain Lessons from Amazon: What Small Businesses Can Borrow', excerpt: 'Big companies spend millions building supply chain resilience. A former Amazon director shares the three principles that small businesses can implement for free.', category: 'Operations', author: 'James Wilson', authorImage: 'assets/experts/expert-3.jpg', date: 'January 5, 2026', readTime: '5 min read', image: 'assets/blog/blog-7.jpg', featured: false, views: 4120 },
  { id: 8, title: 'IP Protection Basics Every Startup Founder Must Know', excerpt: 'Most founders file patents too early or too late — and almost all of them miss at least one critical protection step. A veteran IP attorney explains the right sequence.', category: 'Legal', author: 'Mark Thompson', authorImage: 'assets/experts/expert-2.jpg', date: 'December 28, 2025', readTime: '7 min read', image: 'assets/blog/blog-8.jpg', featured: false, views: 5560 },
  { id: 9, title: 'The Real Estate Developer\'s Playbook for First-Time Projects', excerpt: 'Private equity, joint ventures, and bank financing — three paths to funding your first commercial project, explained by someone who\'s done all three.', category: 'Real Estate', author: 'Thomas Reed', authorImage: 'assets/experts/expert-5.jpg', date: 'December 20, 2025', readTime: '8 min read', image: 'assets/blog/blog-9.jpg', featured: false, views: 2870 },
  { id: 10, title: 'Enterprise Sales Playbook: From Cold Outreach to Closed Deal', excerpt: 'The playbook that generated ₹5 crore in new ARR for a cloud startup in 90 days. Step-by-step tactics from a former Oracle VP of Sales.', category: 'Sales', author: 'David Mitchell', authorImage: 'assets/experts/expert-1.jpg', date: 'December 15, 2025', readTime: '10 min read', image: 'assets/blog/blog-10.jpg', featured: false, views: 8920 },
  { id: 11, title: 'Marketing Repositioning: How Legacy Brands Win Young Customers', excerpt: 'When your brand is 30 years old, how do you connect with Gen Z without alienating your existing loyalists? A former Unilever CMO shares the playbook.', category: 'Marketing', author: 'Rachel Green', authorImage: 'assets/experts/expert-4.jpg', date: 'December 8, 2025', readTime: '6 min read', image: 'assets/blog/blog-11.jpg', featured: false, views: 3940 },
  { id: 12, title: 'Retiring from Corporate Life Without Retiring from Purpose', excerpt: 'You\'ve spent 30 years in corporate. The pension is set. But the part of you that loves solving problems and building things isn\'t ready to stop. Here\'s how mentorship can be the answer.', category: 'Expert Insights', author: 'Jennifer Walsh', authorImage: 'assets/experts/expert-3.jpg', date: 'December 1, 2025', readTime: '5 min read', image: 'assets/blog/blog-12.jpg', featured: false, views: 6230 }
];

let currentBlogCategory = 'all';
let currentBlogSort = 'recent';
let blogSearchQuery = '';
let visibleBlogCount = 9;

function initBlogFilters() {
  const pills = document.querySelectorAll('.filter-pill');
  pills.forEach(pill => {
    pill.addEventListener('click', () => {
      pills.forEach(p => p.classList.remove('active'));
      pill.classList.add('active');
      currentBlogCategory = pill.dataset.category;
      visibleBlogCount = 9;
      renderBlogPosts();
    });
  });
}

function initBlogSort() {
  const select = document.getElementById('blogSortSelect');
  if (!select) return;
  select.addEventListener('change', () => {
    currentBlogSort = select.value;
    visibleBlogCount = 9;
    renderBlogPosts();
  });
}

function initBlogSearch() {
  const input = document.getElementById('blogSearch');
  if (!input) return;
  let timer;
  input.addEventListener('input', () => {
    clearTimeout(timer);
    timer = setTimeout(() => {
      blogSearchQuery = input.value.toLowerCase();
      visibleBlogCount = 9;
      renderBlogPosts();
    }, 300);
  });
}

function initBlogLoadMore() {
  const btn = document.getElementById('blogLoadMoreBtn');
  if (!btn) return;
  btn.addEventListener('click', () => {
    btn.disabled = true;
    btn.textContent = 'Loading...';
    setTimeout(() => {
      visibleBlogCount += 9;
      renderBlogPosts();
      btn.disabled = false;
      btn.textContent = 'Load More Articles';
    }, 400);
  });
}

function getFilteredPosts() {
  let posts = blogPosts;

  if (currentBlogCategory !== 'all') {
    posts = posts.filter(p => p.category.toLowerCase().replace(/\s+/g, '_').includes(currentBlogCategory));
  }

  if (blogSearchQuery) {
    posts = posts.filter(p =>
      p.title.toLowerCase().includes(blogSearchQuery) ||
      p.excerpt.toLowerCase().includes(blogSearchQuery) ||
      p.category.toLowerCase().includes(blogSearchQuery) ||
      p.author.toLowerCase().includes(blogSearchQuery)
    );
  }

  if (currentBlogSort === 'popular') {
    posts = [...posts].sort((a, b) => b.views - a.views);
  }

  return posts;
}

function renderBlogPosts() {
  const grid = document.getElementById('blogGrid');
  if (!grid) return;

  const filtered = getFilteredPosts();
  const visible = filtered.slice(0, visibleBlogCount);

  if (visible.length === 0) {
    grid.innerHTML = `
      <div class="empty-state">
        <svg class="empty-state__icon" viewBox="0 0 120 120" fill="none">
          <circle cx="60" cy="60" r="50" stroke="#D1D8E0" stroke-width="2" stroke-dasharray="8 4"/>
          <path d="M40 50h40M40 60h40M40 70h25" stroke="#8A95A5" stroke-width="2" stroke-linecap="round"/>
        </svg>
        <h3>We couldn't find anything matching that search</h3>
        <p>Try different keywords, clear filters, or browse all articles.</p>
        <button class="btn btn--primary" onclick="document.getElementById('blogSearch').value=''; filterBlogPosts();">Clear Search</button>
      </div>
    `;
    document.getElementById('blogLoadMoreBtn').style.display = 'none';
    document.getElementById('blogCount').textContent = '';
    return;
  }

  grid.innerHTML = visible.map((post, i) => `
    <article class="blog-card" data-stagger style="animation-delay: ${i * 80}ms">
      <div class="blog-card__image">
        <img src="${post.image}" alt="${post.title}" width="400" height="220" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 400 220%22><rect fill=%22%23E8ECF0%22 width=%22400%22 height=%22220%22/><text x=%2250%%22 y=%2255%%22 text-anchor=%22middle%22 fill=%22%234A5568%22 font-size=%2224%22>Article</text></svg>'">
        <span class="blog-card__category">${post.category}</span>
      </div>
      <div class="blog-card__body">
        <h3 class="blog-card__title" onclick="window.location.href='blog-single.html?id=${post.id}'">${post.title}</h3>
        <p class="blog-card__excerpt">${post.excerpt}</p>
        <div class="blog-card__footer">
          <div class="blog-card__author">
            <img src="${post.authorImage}" alt="${post.author}" width="32" height="32" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 32 32%22><circle cx=%2216%22 cy=%2216%22 r=%2216%22 fill=%22%23F5A623%22/><text x=%2250%%22 y=%2255%%22 text-anchor=%22middle%22 fill=%22%230A1628%22 font-size=%2212%22>${post.author.charAt(0)}</text></svg>'">
            <span class="blog-card__author-name">${post.author}</span>
          </div>
          <div class="blog-card__meta">
            <span>${post.readTime}</span>
            <span>${post.views.toLocaleString()} reads</span>
          </div>
        </div>
        <a href="blog-single.html?id=${post.id}" class="blog-card__read-link">Read Article →</a>
      </div>
    </article>
  `).join('');

  const countEl = document.getElementById('blogCount');
  if (countEl) {
    countEl.textContent = `Showing ${visible.length} of ${filtered.length} articles`;
  }

  const btn = document.getElementById('blogLoadMoreBtn');
  if (btn) {
    btn.style.display = visibleBlogCount >= filtered.length ? 'none' : 'inline-flex';
  }
}

function renderFeaturedPost() {
  const featured = blogPosts.find(p => p.featured);
  if (!featured) return;

  document.getElementById('featuredImage').src = featured.image;
  document.getElementById('featuredImage').onerror = function() { this.src = 'data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 800 400%22><rect fill=%22%23112240%22 width=%22800%22 height=%22400%22/><text x=%2250%%22 y=%2255%%22 text-anchor=%22middle%22 fill=%22%23F5A623%22 font-size=%2232%22>Featured Article</text></svg>'; };
  document.getElementById('featuredCategory').textContent = featured.category;
  document.getElementById('featuredTitle').textContent = featured.title;
  document.getElementById('featuredExcerpt').textContent = featured.excerpt;
  document.getElementById('featuredAuthor').textContent = featured.author;
  document.getElementById('featuredAuthorImage').src = featured.authorImage;
  document.getElementById('featuredAuthorImage').onerror = function() { this.src = 'data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 40 40%22><circle cx=%2220%22 cy=%2220%22 r=%2220%22 fill=%22%23F5A623%22/><text x=%2250%%22 y=%2255%%22 text-anchor=%22middle%22 fill=%22%230A1628%22 font-size=%2214%22>' + featured.author.charAt(0) + '</text></svg>'; };
  document.getElementById('featuredReadTime').textContent = featured.readTime;
  document.getElementById('featuredDate').textContent = featured.date;
  const featuredLink = document.getElementById('featuredReadLink');
  if (featuredLink) featuredLink.href = 'blog-single.html?id=' + featured.id;
}

document.addEventListener('DOMContentLoaded', () => {
  initBlogFilters();
  initBlogSort();
  initBlogSearch();
  initBlogLoadMore();
  renderBlogPosts();
  renderFeaturedPost();
});