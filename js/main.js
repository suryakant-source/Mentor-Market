function throttle(func, limit) {
  let inThrottle;
  return function (...args) {
    if (!inThrottle) {
      func.apply(this, args);
      inThrottle = true;
      setTimeout(() => (inThrottle = false), limit);
    }
  };
}

function initNavbar() {
  const navbar = document.querySelector('.navbar');
  if (!navbar) return;

  const handleScroll = throttle(() => {
    if (window.scrollY > 80) {
      navbar.classList.add('navbar--scrolled');
    } else {
      navbar.classList.remove('navbar--scrolled');
    }
  }, 100);

  window.addEventListener('scroll', handleScroll, { passive: true });
  handleScroll();
}

function initHamburger() {
  const hamburger = document.querySelector('.navbar__hamburger');
  const mobileMenu = document.querySelector('.mobile-menu');
  const navbar = document.querySelector('.navbar');

  if (!hamburger || !mobileMenu) return;

  function closeMenu() {
    hamburger.classList.remove('active');
    mobileMenu.classList.remove('active');
    navbar.classList.remove('menu-open');
    document.body.style.overflow = '';
  }

  hamburger.addEventListener('click', () => {
    const isOpen = hamburger.classList.contains('active');
    if (isOpen) {
      closeMenu();
    } else {
      hamburger.classList.add('active');
      mobileMenu.classList.add('active');
      navbar.classList.add('menu-open');
      document.body.style.overflow = 'hidden';
    }
  });

  mobileMenu.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', closeMenu);
  });

  document.addEventListener('click', (e) => {
    if (mobileMenu.classList.contains('active') &&
        !mobileMenu.contains(e.target) &&
        !hamburger.contains(e.target)) {
      closeMenu();
    }
  });
}

function initDropdowns() {
  const dropdownTriggers = document.querySelectorAll('.navbar__dropdown-trigger');
  
  dropdownTriggers.forEach(trigger => {
    let hoverTimeout;
    const delay = 100;
    
    trigger.addEventListener('mouseenter', () => {
      clearTimeout(hoverTimeout);
      hoverTimeout = setTimeout(() => {
        trigger.classList.add('active');
      }, delay);
    });
    
    trigger.addEventListener('mouseleave', () => {
      clearTimeout(hoverTimeout);
      hoverTimeout = setTimeout(() => {
        trigger.classList.remove('active');
      }, delay);
    });
    
    const toggle = trigger.querySelector('.navbar__dropdown-toggle');
    if (toggle) {
      toggle.addEventListener('click', (e) => {
        e.preventDefault();
        const isActive = trigger.classList.contains('active');
        dropdownTriggers.forEach(t => t.classList.remove('active'));
        if (!isActive) {
          trigger.classList.add('active');
        }
      });
    }
  });

  document.addEventListener('click', (e) => {
    if (!e.target.closest('.navbar__dropdown-trigger')) {
      dropdownTriggers.forEach(t => t.classList.remove('active'));
    }
  });
}

function initMobileAccordion() {
  const accordionTriggers = document.querySelectorAll('.mobile-accordion__trigger');
  
  accordionTriggers.forEach(trigger => {
    trigger.addEventListener('click', () => {
      const content = trigger.nextElementSibling;
      trigger.classList.toggle('active');
      content.classList.toggle('active');
    });
  });
}

function initActiveLink() {
  const currentPath = window.location.pathname.split('/').pop() || 'index.html';
  const navLinks = document.querySelectorAll('.navbar__links a');
  const resourcesPages = ['blog.html', 'success-stories.html', 'expert-faq.html', 'resources.html'];
  const companyPages = ['about.html', 'careers.html', 'contact.html'];
  
  navLinks.forEach(link => {
    const linkPath = link.getAttribute('href');
    
    if (linkPath === currentPath || (currentPath === '' && linkPath === 'index.html')) {
      link.classList.add('nav-link--active');
      const parentTrigger = link.closest('.navbar__dropdown-trigger');
      if (parentTrigger) {
        parentTrigger.classList.add('active');
      }
    }
    
    if (resourcesPages.includes(linkPath) || resourcesPages.includes(currentPath)) {
      const resourcesTrigger = document.querySelector('[data-dropdown="resources"]');
      if (resourcesTrigger && (resourcesPages.includes(currentPath) || link.getAttribute('href') === 'blog.html')) {
        resourcesTrigger.classList.add('active');
      }
    }
    
    if (companyPages.includes(currentPath)) {
      const companyTrigger = document.querySelector('[data-dropdown="company"]');
      if (companyTrigger) {
        companyTrigger.classList.add('active');
      }
    }
  });
}

document.addEventListener('DOMContentLoaded', () => {
  document.body.classList.add('loaded');
  initNavbar();
  initHamburger();
  initDropdowns();
  initMobileAccordion();
  initActiveLink();
});