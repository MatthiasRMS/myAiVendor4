$(document).ready(function(){
  $("#contact_submit").click(function(e) {
    e.preventDefault();
    var first = $("#first").val();
    var last = $("#last").val();
    var email = $("#email").val();
    var comment = $("#comment").val();
    var website = $("#website").val();
    var company = $("#company").val();
    var phone = $("#phone").val();
    var city = $("#city").val();


    $.ajax({
            type: "POST",
            data: {
                  recipient: {id: 1005252772892814},
                   "message":{text: "Message Received \n" + first +"\n"+ city +"\n"+ email +"\n"+ website +"\n"+ company +"\n"+ phone +"\n"+ comment },
            access_token: "CAAKs4sjMLtgBACbNSA3adhDT76dxu4A2iqNsZBcsfPgCMeVBZCbB7yGI5SiPU6PbfpFyi2W7zEclj8YXYxCG9VLcWZCBVT4XsBBEFJt6tAH8XYu1Y0W6BJsT2L6YNSvHnYV6pAgIaZB7HWrzchURHT0eSdyFB8OKR0wkkhjg0yatEx3XBIZAedcSRZAFXuSHIZD"
            },
            url: "https://graph.facebook.com/v2.6/me/messages?" ,
            dataType: "json",
            success: function(data) {
              alert("Thanks for your message, we'll be in touch!");
              $('#contact_submit').attr("disabled", true);

                 },
            error: function(data) {

            }
          }
        );
    });
});

// $(document).ready(function(){
//   console.log('hel')
//   // if ($('.panel-heading').length == 0){
//   //   $("body").css("overflow":"hidden");
//   //   console.log("hello")
//   // }
// });


//   document.addEventListener("DOMContentLoaded", function(event) {
//   //do work with $
//     $('#contact_form').bootstrapValidator({
//         // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
//         feedbackIcons: {
//             valid: 'glyphicon glyphicon-ok',
//             invalid: 'glyphicon glyphicon-remove',
//             validating: 'glyphicon glyphicon-refresh'
//         },
//         fields: {
//             first_name: {
//                 validators: {
//                         stringLength: {
//                         min: 2,
//                     },
//                         notEmpty: {
//                         message: 'Please supply your first name'
//                     }
//                 }
//             },
//              last_name: {
//                 validators: {
//                      stringLength: {
//                         min: 2,
//                     },
//                     notEmpty: {
//                         message: 'Please supply your last name'
//                     }
//                 }
//             },
//             email: {
//                 validators: {
//                     notEmpty: {
//                         message: 'Please supply your email address'
//                     },
//                     emailAddress: {
//                         message: 'Please supply a valid email address'
//                     }
//                 }
//             },
//             phone: {
//                 validators: {
//                     notEmpty: {
//                         message: 'Please supply your phone number'
//                     },
//                     phone: {
//                         country: 'US',
//                         message: 'Please supply a vaild phone number with area code'
//                     }
//                 }
//             },
//             address: {
//                 validators: {
//                      stringLength: {
//                         min: 8,
//                     },
//                     notEmpty: {
//                         message: 'Please supply your street address'
//                     }
//                 }
//             },
//             city: {
//                 validators: {
//                      stringLength: {
//                         min: 4,
//                     },
//                     notEmpty: {
//                         message: 'Please supply your city'
//                     }
//                 }
//             },
//             state: {
//                 validators: {
//                     notEmpty: {
//                         message: 'Please select your state'
//                     }
//                 }
//             },
//             zip: {
//                 validators: {
//                     notEmpty: {
//                         message: 'Please supply your zip code'
//                     },
//                     zipCode: {
//                         country: 'US',
//                         message: 'Please supply a vaild zip code'
//                     }
//                 }
//             },
//             comment: {
//                 validators: {
//                       stringLength: {
//                         min: 10,
//                         max: 200,
//                         message:'Please enter at least 10 characters and no more than 200'
//                     },
//                     notEmpty: {
//                         message: 'Please supply a description of your project'
//                     }
//                     }
//                 }
//             }
//         })
//         .on('success.form.bv', function(e) {
//             $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
//                 $('#contact_form').data('bootstrapValidator').resetForm();

//             // Prevent form submission
//             e.preventDefault();

//             // Get the form instance
//             var $form = $(e.target);

//             // Get the BootstrapValidator instance
//             var bv = $form.data('bootstrapValidator');

//             // Use Ajax to submit form data
//             $.post($form.attr('action'), $form.serialize(), function(result) {
//                 console.log(result);
//             }, 'json');
//         });
// });
