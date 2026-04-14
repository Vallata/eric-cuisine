/* ════════════════════════════════════════════════════════════
   INTERACTIONS & ANIMATIONS
════════════════════════════════════════════════════════════ */

/* ── PROGRESS BAR ── */
const bar = document.getElementById('progress-bar');
window.addEventListener('scroll', () => {
  const pct = window.scrollY / (document.body.scrollHeight - window.innerHeight);
  if (bar) bar.style.transform = `scaleX(${pct})`;
}, { passive: true });

/* ── NAV SCROLL ── */
const navEl = document.getElementById('nav');
window.addEventListener('scroll', () => {
  navEl?.classList.toggle('scrolled', window.scrollY > 40);
}, { passive: true });

/* ── PARALLAX HERO ── */
window.addEventListener('scroll', () => {
  const bg = document.getElementById('hero-parallax');
  if (bg && window.scrollY < window.innerHeight) bg.style.transform = `translateY(${window.scrollY * 0.25}px)`;
}, { passive: true });

/* ── COUNTER ── */
function animateCounter(el, target, duration = 1800) {
  const start = performance.now();
  (function update(now) {
    const t = Math.min((now - start) / duration, 1);
    const ease = 1 - Math.pow(1 - t, 4);
    el.textContent = Math.round(ease * target) + (t === 1 ? '+' : '');
    if (t < 1) requestAnimationFrame(update);
    else el.dataset.animated = 'true';
  })(start);
}

function initCounter() {
  const counterEl = document.getElementById('counter-badge');
  if (!counterEl || counterEl.dataset.observing) return;
  counterEl.dataset.observing = '1';
  new IntersectionObserver((entries, obs) => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        animateCounter(e.target, parseInt(e.target.dataset.count) || 800);
        obs.unobserve(e.target);
      }
    });
  }, { threshold: 0.5 }).observe(counterEl);
}

document.addEventListener('DOMContentLoaded', () => { initCounter(); });

/* ── FORM SUBMIT ── */
function handleSubmit(e) {
  e.preventDefault();
  const btn = document.getElementById('submit-btn');
  btn.textContent = 'Merci ! J\'ai bien reçu votre demande ✓';
  btn.style.background = '#2a6b4a';
  btn.disabled = true;
  setTimeout(() => {
    e.target.reset();
    btn.textContent = 'Demander un devis →';
    btn.style.background = '';
    btn.disabled = false;
  }, 3500);
}
