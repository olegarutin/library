window.toggle = function() {
  let url = window.location.href.split('?')[0];
  let param = window.location.href.split('?')[1];

  if (param == 'unpublished=true') {
    url += '?unpublished=false';
    window.location.href = url;

  } else if (document.getElementById("published").checked !== "checked") {
    url += '?unpublished=true';
    window.location.href = url;

  } else {
    url += '?unpublished=false';
    window.location.href = url;
  }
};

