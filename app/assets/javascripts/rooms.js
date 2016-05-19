$(document).ready(function(){

  // Enabling to refresh the context dashboard from the backer feature
  $('#context-input').click(function(e){e.preventDefault();
  var fbid = $(".facebook")[0].id
  console.log($('#browsing_choices').val());
  console.log($('#category').val());
  console.log($('#brand').val());
  console.log($('#price_range').val());
  var session_id = $('.panel-default')[0].id;
  $.ajax({
    type: "POST",
    data: { 'fbid': fbid,
           'context': {
                   'intent': $("#browsing_choices").val(),
                   'brand':$("#brand").val(),
                     },
          },
    url: "/session_update" + ,
    dataType: "json",
    success: function(data) {
      console.log(data);
         },
    error: function(data) {
       console.log(data)
    }
  }
);
  });

});
