// The copy buttons of the useful commands page (Flutter's CommandTile):
// writes data-copy to the clipboard, marks the button as copied for two
// seconds and announces it through the page's live region.
(function () {
  document.addEventListener('click', function (event) {
    var button = event.target.closest('[data-copy]');
    if (!button || !navigator.clipboard) return;
    navigator.clipboard.writeText(button.dataset.copy).then(function () {
      var label = button.getAttribute('aria-label');
      button.classList.add('is-copied');
      button.setAttribute('aria-label', button.dataset.labelCopied);
      var status = document.querySelector('[data-copy-status]');
      if (status) status.textContent = button.dataset.labelCopied;
      clearTimeout(button._copyTimer);
      button._copyTimer = setTimeout(function () {
        button.classList.remove('is-copied');
        button.setAttribute('aria-label', label);
        if (status) status.textContent = '';
      }, 2000);
    });
  });
})();
