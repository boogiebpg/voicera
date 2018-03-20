document.addEventListener("turbolinks:load", function() {
  var options = {
      valueNames: [ 'start_time', 'end_time', 'highlight_text' ]
  };

  var highlightsList = new List('highlights_list', options);
});
