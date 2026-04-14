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
async function handleSubmit(e) {
  e.preventDefault();
  const btn  = document.getElementById('submit-btn');
  const form = e.target;
  btn.disabled    = true;
  btn.textContent = 'Envoi en cours…';

  const body = {
    prenom:    form.querySelector('[name=prenom]').value,
    nom:       form.querySelector('[name=nom]').value,
    email:     form.querySelector('[name=email]').value,
    telephone: form.querySelector('[name=telephone]').value,
    structure: form.querySelector('[name=structure]').value,
    message:   form.querySelector('[name=message]').value,
  };

  try {
    const res = await fetch('/contact', {
      method:  'POST',
      headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': csrfToken() },
      body:    JSON.stringify(body)
    });
    if (!res.ok) throw new Error();
    btn.textContent  = 'Merci\u00a0! J\'ai bien reçu votre demande ✓';
    btn.style.background = '#2a6b4a';
    setTimeout(() => {
      form.reset();
      btn.textContent      = 'Demander un devis →';
      btn.style.background = '';
      btn.disabled         = false;
    }, 3500);
  } catch {
    btn.textContent = '⚠ Erreur — réessayez';
    btn.disabled    = false;
  }
}

function csrfToken() {
  return document.querySelector('meta[name="csrf-token"]')?.content || '';
}
