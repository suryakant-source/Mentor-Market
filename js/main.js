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

function initActiveLink() {
  const currentPath = window.location.pathname.split('/').pop() || 'index.html';
  const navLinks = document.querySelectorAll('.navbar__links a');

  navLinks.forEach(link => {
    const linkPath = link.getAttribute('href');
    if (linkPath === currentPath || (currentPath === '' && linkPath === 'index.html')) {
      link.classList.add('nav-link--active');
    }
  });
}

document.addEventListener('DOMContentLoaded', () => {
  initNavbar();
  initHamburger();
  initActiveLink();
});