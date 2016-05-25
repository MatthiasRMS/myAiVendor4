$(document).ready(function(){
  $("#wrapper").scrollTop($("#wrapper")[0].scrollHeight);

  // Enabling to refresh the context dashboard from the backer feature
  $('#context-input').click(function(e){e.preventDefault();
    var fbid = $(".facebook")[0].id
    var session_id = $('.panel-default')[0].id;
    $.ajax({
      type: "POST",
      data: {'fbid': fbid,
             'context': {
                     'intent': $("#browsing_choices").val(),
                     'category':$("#category").val(),
                     'brand':$("#brand").val(),
                     'pricerange':$("#price_range").val(),
                     'product':$("#product").val(),
                     'variant':$("#variant").val(),
                     'delivery_method':$("#delivery_method").val(),
                     'delivery_address':$("#delivery_address").val(),
                     'city':$("#city").val(),
                     'selected_store':$("#selected_store").val(),
                      },
            },
      url: "http://rails-bots.herokuapp.com/api/v1/session_update",
      dataType: "json",
      success: function(data) {
        console.log(data);
           },
      error: function(data) {
         console.log(data)
      }
    });
  });
});
