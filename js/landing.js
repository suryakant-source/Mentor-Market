function createRipple(event, element) {
  const ripple = document.createElement('div');
  ripple.className = 'ripple-effect';

  const rect = element.getBoundingClientRect();
  const size = Math.max(rect.width, rect.height);
  ripple.style.width = ripple.style.height = size + 'px';
  ripple.style.left = (event.clientX - rect.left - size / 2) + 'px';
  ripple.style.top = (event.clientY - rect.top - size / 2) + 'px';

  element.appendChild(ripple);

  requestAnimationFrame(() => {
    ripple.classList.add('ripple-active');
  });

  setTimeout(() => ripple.remove(), 400);
}

function initDomainsGrid() {
  const grid = document.querySelector('.domains__grid');
  if (!grid) return;

  grid.addEventListener('click', (e) => {
    const card = e.target.closest('.domain-card');
    if (!card) return;

    createRipple(e, card);

    setTimeout(() => {
      const domainId = card.dataset.domainId || card.querySelector('a')?.href?.split('domainId=')[1];
      if (domainId) {
        window.location.href = `experts.jsp?domainId=${domainId}`;
      }
    }, 200);
  });
}

function initExpertsNav() {
  const container = document.querySelector('.experts-row');
  const prevBtn = document.querySelector('.experts-nav-btn--prev');
  const nextBtn = document.querySelector('.experts-nav-btn--next');

  if (!container || !prevBtn || !nextBtn) return;

  const cardWidth = 290;

  function updateArrows() {
    const maxScroll = container.scrollWidth - container.clientWidth;
    prevBtn.style.opacity = container.scrollLeft <= 10 ? '0.3' : '1';
    nextBtn.style.opacity = container.scrollLeft >= maxScroll - 10 ? '0.3' : '1';
  }

  prevBtn.addEventListener('click', () => {
    container.scrollBy({ left: -cardWidth, behavior: 'smooth' });
  });

  nextBtn.addEventListener('click', () => {
    container.scrollBy({ left: cardWidth, behavior: 'smooth' });
  });

  container.addEventListener('scroll', updateArrows);
  updateArrows();
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
  initExpertsNav();
  initHowItWorks();
  initTestimonialCards();
});