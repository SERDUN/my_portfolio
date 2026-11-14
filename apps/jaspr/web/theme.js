// The theme switch of the header (Flutter's ThemeModeSwitcher): system ->
// light -> dark -> system. The choice is kept in localStorage; the inline
// script in <head> applies it before the first paint, this file answers the
// button. `data-theme` drives the palette (see the token stylesheet),
// `data-theme-preference` picks which icon the button shows.
(function () {
  var order = ['system', 'light', 'dark'];
  var root = document.documentElement;

  function current() {
    return root.dataset.themePreference || 'system';
  }

  function apply(preference) {
    if (preference === 'system') {
      delete root.dataset.theme;
      delete root.dataset.themePreference;
    } else {
      root.dataset.theme = preference;
      root.dataset.themePreference = preference;
    }
    try {
      if (preference === 'system') localStorage.removeItem('theme');
      else localStorage.setItem('theme', preference);
    } catch (e) {}
  }

  document.addEventListener('click', function (event) {
    var button = event.target.closest('[data-theme-toggle]');
    if (!button) return;
    apply(order[(order.indexOf(current()) + 1) % order.length]);
  });
})();
