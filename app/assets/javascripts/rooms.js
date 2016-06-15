$(document).ready(function(){
  $("#wrapper").scrollTop($("#wrapper")[0].scrollHeight);
});

// send updates to the bot's backend
$('#context-input').click(function(e){
  e.preventDefault();
  var fbid = $(".facebook")[0].id
  var session_id = $('.panel-default')[0].id;
  var data = {}
  $(".panel-body input").slice(0, $(this).length - 3).each(function() {
    if($(this).val() != ""){
      data[$(this).attr("id")] = $(this).val();
    }
  });
  $(".panel-body select").slice(0, $(this).length).each(function() {
    if($(this).val() != ""){
      data[$(this).attr("id")] = $(this).val();
     }
  });
   data["fbid"] = gon.fbid + 1;
   console.log(data);
  $.ajax({
    type: "POST",
    data: data,
    url: gon.endpoint,
    dataType: "json",
    success: function(data) {
      console.log(data);
         },
    error: function(data) {
       console.log(data)
    }
  });
});
