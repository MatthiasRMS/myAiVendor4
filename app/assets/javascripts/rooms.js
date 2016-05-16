$(document).ready(function(){

  // Enabling to refresh the context dashboard from the backer feature
  $('#context-input').click(function(e){e.preventDefault();
  console.log($('#browsing_choices').val());
  console.log($('#category').val());
  console.log($('#brand').val());
  console.log($('#price_range').val());
  var session_id = $('.panel-default')[0].id;
  $.ajax({
    type: "PATCH",
    data: {'context': {
                   'browsing': $("#browsing").val(),
                   'category':$("#category").val(),
                     },
          },
    url: "/sessions/" + session_id,
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
