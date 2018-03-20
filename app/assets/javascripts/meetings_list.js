document.addEventListener("turbolinks:load", function() {
  var options = {
      valueNames: [ 'title', 'email' ]
  };

  var meetingsList = new List('meetings_list', options);
});
