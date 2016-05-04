var CreateMessage = React.createClass({
  getInitialState: function() {
    return {
      focused: false
    }
  },

  render: function() {
    var fakeTextareaClasses = classNames({
      "hidden": this.state.focused
    })
    var textareaClasses = classNames({
      "focused": this.state.focused
    })
    var btnClasses = classNames({
      "btn": true,
      "flex-item": true,
      "hidden": !this.state.focused
    })

    return (
      <div className="message-input" id="newMessage">
        <textarea className={textareaClasses}
          id="newTextarea"
          placeholder="Votre message"
          ref="textarea"
          onClick={this.handleClick}
          onKeyUp={this.handleKeyUp}></textarea>
        <div className="actions flexbox-end">
          <button className={btnClasses + " btn-stop"} onClick={this.handleCancel}>Annuler</button>
          <button className={btnClasses + " btn-send"} onClick={this.createMessage}>Envoyer</button>
        </div>
      </div>
    )
  },

  handleClick: function() {
    this.setState({
      focused: true
    })
    this.props.openTextarea()
  },

  handleKeyUp: function(e) {
    if(e.which == 27) {
      this.handleCancel()
    }
  },

  handleCancel: function() {
    this.resetState()
  },

  createMessage: function() {
    if (typeof this.props.conversationId == "undefined") {
      var convId = $('#newTextarea').attr("data-id");
      }
    else {
      var convId = this.props.conversationId;
    };
    this.props.onMessageCreation(convId, $("#newTextarea").val())
  },

  resetState: function() {
    this.setState({
      focused: false
    });
    $("#newTextarea").val('');
    this.props.closeTextarea();
  },

  _textarea: function() {
    return this.refs.textarea;
  }
})
