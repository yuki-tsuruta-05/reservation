
window.onpageshow = function() {
  history.pushState(null, null, null);

  window.addEventListener("popstate", function (e) {
    history.pushState(null, null, null);
    return;
  });
};