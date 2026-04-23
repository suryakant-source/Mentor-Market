function easeOutQuart(t) {
  return 1 - Math.pow(1 - t, 4);
}

function animateCountUp(element, target, duration, suffix = '') {
  const start = 0;
  const startTime = performance.now();
  
  function update(currentTime) {
    const elapsed = currentTime - startTime;
    const progress = Math.min(elapsed / duration, 1);
    const easedProgress = easeOutQuart(progress);
    const current = Math.round(start + (target - start) * easedProgress);
    
    element.textContent = current + suffix;
    
    if (progress < 1) {
      requestAnimationFrame(update);
    } else {
      element.textContent = target + suffix;
    }
  }
  
  requestAnimationFrame(update);
}

function initScrollAnimations() {
  const observerOptions = {
    threshold: 0.15,
    rootMargin: '0px 0px -50px 0px'
  };

  const fadeObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        fadeObserver.unobserve(entry.target);
      }
    });
  }, observerOptions);

  document.querySelectorAll('.fade-in-up').forEach(el => {
    fadeObserver.observe(el);
  });

  const staggerObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const cards = entry.target.querySelectorAll('[data-stagger]');
        cards.forEach((card, index) => {
          setTimeout(() => {
            card.classList.add('visible');
          }, index * 60);
        });
        staggerObserver.unobserve(entry.target);
      }
    });
  }, observerOptions);

  document.querySelectorAll('.stagger-container').forEach(el => {
    staggerObserver.observe(el);
  });
}

function initScrollIndicator() {
  const scrollIndicator = document.querySelector('.hero__scroll-indicator');
  if (scrollIndicator) {
    scrollIndicator.addEventListener('click', () => {
      document.querySelector('.stats-bar').scrollIntoView({ behavior: 'smooth' });
    });
  }
}

function initCountUp() {
  const statsObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const statItems = entry.target.querySelectorAll('.stat-item__number[data-count]');
        statItems.forEach(item => {
          const target = parseInt(item.dataset.count, 10);
          const suffix = item.querySelector('.suffix')?.textContent || '';
          animateCountUp(item, target, 2200, suffix);
        });
        statsObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.3 });

  const statsBar = document.querySelector('.stats-bar');
  if (statsBar) {
    statsObserver.observe(statsBar);
  }
}

function observeElements(selector, animationClass = 'visible') {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add(animationClass);
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.2 });

  document.querySelectorAll(selector).forEach(el => {
    observer.observe(el);
  });
  return observer;
}

function debounce(func, delay) {
  let timeoutId;
  return function (...args) {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => func.apply(this, args), delay);
  };
}

function formatCurrency(amount) {
  const num = Math.floor(amount);
  const str = num.toString();
  let result = '';
  let count = 0;

  for (let i = str.length - 1; i >= 0; i--) {
    if (count > 0 && count % 3 === 0) {
      result = ',' + result;
    }
    result = str[i] + result;
    count++;
  }

  return '₹' + result;
}

let toastQueue = [];
let isToastActive = false;

function showToast(message, type = 'info') {
  toastQueue.push({ message, type });

  if (!isToastActive) {
    processToastQueue();
  }
}

function processToastQueue() {
  if (toastQueue.length === 0) {
    isToastActive = false;
    return;
  }

  isToastActive = true;
  const { message, type } = toastQueue.shift();

  const toast = document.createElement('div');
  toast.className = `toast toast--${type}`;
  toast.innerHTML = `
    <span class="toast__icon"></span>
    <span class="toast__message">${message}</span>
  `;
  document.body.appendChild(toast);

  requestAnimationFrame(() => {
    toast.classList.add('toast--visible');
  });

  setTimeout(() => {
    toast.classList.remove('toast--visible');
    setTimeout(() => {
      toast.remove();
      processToastQueue();
    }, 300);
  }, 2500);
}

function smoothScrollTo(selector, offset = 80) {
  const element = document.querySelector(selector);
  if (element) {
    const top = element.getBoundingClientRect().top + window.scrollY - offset;
    window.scrollTo({ top, behavior: 'smooth' });
  }
}

document.addEventListener('DOMContentLoaded', () => {
  initScrollAnimations();
  initScrollIndicator();
  initCountUp();
});