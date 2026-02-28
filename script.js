/* =====================
   Navbar scroll effect
   ===================== */
const navbar = document.getElementById('navbar');

window.addEventListener('scroll', () => {
  if (window.scrollY > 30) {
    navbar.classList.add('scrolled');
  } else {
    navbar.classList.remove('scrolled');
  }
});

/* =====================
   Mobile nav toggle
   ===================== */
const navToggle = document.getElementById('navToggle');
const navLinks = document.getElementById('navLinks');

navToggle.addEventListener('click', () => {
  navLinks.classList.toggle('open');
  const isOpen = navLinks.classList.contains('open');
  navToggle.setAttribute('aria-expanded', isOpen);
});

// Close nav when a link is clicked
navLinks.querySelectorAll('a').forEach(link => {
  link.addEventListener('click', () => {
    navLinks.classList.remove('open');
    navToggle.setAttribute('aria-expanded', 'false');
  });
});

/* =====================
   Active nav link
   ===================== */
const sections = document.querySelectorAll('section[id]');
const navItems = document.querySelectorAll('.nav-links a');

const highlightNav = () => {
  const scrollY = window.scrollY + 100;
  sections.forEach(section => {
    const top = section.offsetTop;
    const height = section.offsetHeight;
    const id = section.getAttribute('id');
    if (scrollY >= top && scrollY < top + height) {
      navItems.forEach(link => {
        link.style.fontWeight = link.getAttribute('href') === `#${id}` ? '600' : '500';
        link.style.color = link.getAttribute('href') === `#${id}` ? 'var(--deep-brown)' : '';
      });
    }
  });
};

window.addEventListener('scroll', highlightNav);

/* =====================
   Fade-up animations
   ===================== */
const animTargets = document.querySelectorAll(
  '.section-label, .section-title, .highlight-card, .menu-category, .review-card, .info-card, .contact-card, .about-text, .about-highlights, .map-wrapper, .rating-summary, .price-card, .shift-header, .shift-intro'
);

animTargets.forEach(el => el.classList.add('fade-up'));

const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry, i) => {
      if (entry.isIntersecting) {
        setTimeout(() => {
          entry.target.classList.add('visible');
        }, (entry.target.dataset.delay || 0));
        observer.unobserve(entry.target);
      }
    });
  },
  { threshold: 0.12, rootMargin: '0px 0px -40px 0px' }
);

// Stagger children within grids
const staggerContainers = document.querySelectorAll(
  '.about-highlights, .reviews-grid, .contact-cards, .location-info, .price-grid'
);

staggerContainers.forEach(container => {
  [...container.children].forEach((child, i) => {
    child.dataset.delay = i * 80;
  });
});

animTargets.forEach(el => observer.observe(el));

/* =====================
   Smooth scroll for buttons
   ===================== */
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
    const href = this.getAttribute('href');
    if (href === '#') return;
    const target = document.querySelector(href);
    if (target) {
      e.preventDefault();
      const offset = parseInt(getComputedStyle(document.documentElement)
        .getPropertyValue('--nav-height')) || 68;
      const top = target.getBoundingClientRect().top + window.scrollY - offset;
      window.scrollTo({ top, behavior: 'smooth' });
    }
  });
});

/* =====================
   Review card tilt (subtle)
   ===================== */
document.querySelectorAll('.review-card').forEach(card => {
  card.addEventListener('mousemove', (e) => {
    const rect = card.getBoundingClientRect();
    const x = ((e.clientX - rect.left) / rect.width - 0.5) * 6;
    const y = ((e.clientY - rect.top) / rect.height - 0.5) * 6;
    card.style.transform = `translateY(-4px) rotateX(${-y}deg) rotateY(${x}deg)`;
    card.style.transition = 'transform 0.1s';
  });

  card.addEventListener('mouseleave', () => {
    card.style.transform = '';
    card.style.transition = 'transform 0.4s ease';
  });
});

/* =====================
   Hero badge pulsing glow
   ===================== */
const heroBadge = document.querySelector('.hero-badge');
if (heroBadge) {
  setInterval(() => {
    heroBadge.style.boxShadow = '0 0 12px rgba(200,149,108,0.5)';
    setTimeout(() => { heroBadge.style.boxShadow = ''; }, 800);
  }, 2500);
}
