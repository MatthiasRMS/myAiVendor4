App.room = App.cable.subscriptions.create {channel: "RoomChannel", room: $(".messages").attr("id")},
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("connected")

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log("disconnected")

  received: (data) ->
    console.log("RECEIVED")
    console.log("hello")
    console.log($(".panel-heading")[0].id)
    console.log(data["room"])
    console.log($(".panel-heading")[0].id == data["room"])
    if $(".panel-heading")[0].id == data["room"]
      console.log("here is true")
      $('.messages').append data['message']

    if window.location.href != "http://www.mymessagingstore.com/rooms"
      $("#"+data["room"]).css("color", "red")
      $(".flexbox-columns-start").prepend($("#"+data["room"]))
    else
      $('.messages').append data['message']
      $("#mainColumn").prepend($("#" + data["room"]))
      $("div#" + data["room"]).find("#status").text(data["status"])
      $("#wrapper").scrollTop($("#wrapper")[0].scrollHeight)
  speak: (message, id) ->
    @perform 'speak', message: message, id: id

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value, $(".messages").attr("id"),
    event.target.value = ''
    event.preventDefault()


