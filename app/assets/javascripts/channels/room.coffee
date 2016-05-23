App.room = App.cable.subscriptions.create {channel: "RoomChannel", room: $(".messages").attr("id")},
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    if data["room"] == 0
      console.log(data["room"])
      console.log("received in index")
      $("#"+data["room"]).css("color", "red")
      $(".flexbox-columns-start").prepend($("#"+data["room"]))
    else
      $('.messages').append data['message']
      console.log("received")
      console.log(data)
      $("#mainColumn").prepend($("#" + data["room"]))
      console.log($("#"+data["room"]))
      $("#wrapper").scrollTop($("#wrapper")[0].scrollHeight)
      context = data['context'].replace(/=>/g, ":")
      parsed_context = JSON.parse(context)
      $('#browsing_choices').val(parsed_context.intent)
      $('#brand').val(parsed_context.brand)
      console.log($("#"+data["room"]))
  speak: (message, id) ->
    @perform 'speak', message: message, id: id

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    console.log(App.cable.subscriptions)
    App.room.speak event.target.value, $(".messages").attr("id"),
    event.target.value = ''
    event.preventDefault()


