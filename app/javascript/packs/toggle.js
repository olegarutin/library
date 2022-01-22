window.toggle = function() {
  let selectBox = document.querySelector(".js-toggle"),
      url = selectBox.dataset.path +'?published=' + Boolean(Number(selectBox.value));

  window.location.href = url;
};
