App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('.messages').append data['message']
    $("#messages").scrollTop($("#messages")[0].scrollHeight)


  speak: (message, id) ->
    @perform 'speak', message: message, id: id

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    console.log($(".global_showcase").attr("id"))
    App.room.speak event.target.value, $(".messages").attr("id")
    event.target.value = ''
    event.preventDefault()


