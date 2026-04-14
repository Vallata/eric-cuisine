/* ── Eric Cuisine — Inline Admin Editing ── */

let editMode = false;

function ecToggleEdit() {
  editMode = !editMode;
  const btn = document.getElementById('ec-toggle');
  btn.textContent = editMode ? 'Désactiver l\'édition' : 'Activer l\'édition';
  btn.classList.toggle('active', editMode);
  document.body.classList.toggle('ec-edit-mode', editMode);

  document.querySelectorAll('.ec-editable').forEach(el => {
    el.contentEditable = editMode ? 'true' : 'false';
  });

  document.querySelectorAll('[data-image-key]').forEach(el => {
    el.onclick = editMode ? () => ecPickImage(el.dataset.imageKey, el) : null;
  });
}

/* ── Auto-sauvegarde texte au blur ── */
document.addEventListener('blur', async (e) => {
  const el = e.target.closest('.ec-editable');
  if (!el || !editMode) return;

  const key   = el.dataset.key;
  const value = el.innerHTML;
  const ind   = document.getElementById('ec-save-indicator');
  if (ind) ind.textContent = '…';

  try {
    const res = await fetch('/admin/content_blocks/' + encodeURIComponent(key), {
      method:  'PATCH',
      headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': ecCsrf() },
      body:    JSON.stringify({ value })
    });
    if (!res.ok) throw new Error('HTTP ' + res.status);
    if (ind) { ind.textContent = '✓ Sauvegardé'; setTimeout(() => { ind.textContent = ''; }, 2000); }
  } catch (err) {
    if (ind) ind.textContent = '⚠ Erreur';
    console.error('Erreur sauvegarde bloc:', key, err);
  }
}, true);

/* ── Upload image ── */
function ecPickImage(key, containerEl) {
  const input = document.createElement('input');
  input.type   = 'file';
  input.accept = 'image/*';

  input.onchange = async () => {
    const ind = document.getElementById('ec-save-indicator');
    if (ind) ind.textContent = '…';

    const fd = new FormData();
    fd.append('image', input.files[0]);

    try {
      const res = await fetch('/admin/images/' + encodeURIComponent(key), {
        method:  'PATCH',
        headers: { 'X-CSRF-Token': ecCsrf() },
        body:    fd
      });
      if (!res.ok) throw new Error('HTTP ' + res.status);
      const { url } = await res.json();

      /* Mise à jour visuelle immédiate */
      if (containerEl.dataset.imageKey === 'hero.bg') {
        containerEl.style.backgroundImage    = `url('${url}')`;
        containerEl.style.backgroundSize     = 'cover';
        containerEl.style.backgroundPosition = 'center';
      } else {
        containerEl.innerHTML = `<img src="${url}" style="width:100%;height:100%;object-fit:cover;position:absolute;inset:0" alt="Photo">`;
      }

      if (ind) { ind.textContent = '✓ Image sauvegardée'; setTimeout(() => { ind.textContent = ''; }, 2000); }
    } catch (err) {
      if (ind) ind.textContent = '⚠ Erreur upload';
      console.error('Erreur upload image:', key, err);
    }
  };

  input.click();
}

/* ── CSRF token ── */
function ecCsrf() {
  return document.querySelector('meta[name="csrf-token"]')?.content || '';
}
