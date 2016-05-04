var Inbox = React.createClass({
  getInitialState: function() {
    return {
      conversations: this.props.conversations,
      messages: this.props.messages,
      selectedConversationId: this.props.selected_conversation_id,
      firstName: this.props.first_name,
      focused: false
    }
  },

   render: function() {
    var inboxClasses = classNames({
      "col-sm-4": true,
      "inbox": true,
      "hidden-xs": this.state.focus
    })
    var conversationClasses = classNames({
      "col-sm-8": true,
      "conversation": true,
      "hidden-xs": !this.state.focus
    })
    var messages
    if(this.state.loadingConversation) {
      messages = <div className="loader"></div>
    } else {
      messages =  <div id="messages">
                    <MessageList started_at={this.props.started_at} messages={this.state.messages} />
                  </div>
    }
    return(
      <div className="row">
        <div className={inboxClasses}>
          <div className="panel panel-default margin-top-15 padding-none white-bg" id="panel-inbox">
            <div className="panel-heading border-btm-light">
              <h4>{this.props.inbox}Conversations</h4>
            </div>
            <div className="panel-body padding-none panel-body-inbox" id="conversations">
              <ConversationList conversations={this.state.conversations} selectedConversationId={this.state.selectedConversationId}  onConversationSelection={this.handleConversationSelection} />
              <div className="conversation-preview" id="no-highlight">
                <p className="small margin-btm-3 gray-lighter text-center">
                  {this.props.end}
                </p>
              </div>
            </div>
          </div>
        </div>
        <div className={conversationClasses}>
          <div className="panel panel-default margin-top-15 padding-none" id="panel-conversation">
            <div className="panel-heading border-btm-light">
              <h4 className="montserrat" id="first-name">
                <a className="hidden-sm hidden-md hidden-lg text-decoration-none" onClick={this.handleBack}>{this.props.inbox} > </a>{this.state.firstName}
              </h4>
            </div>
            <div conversationId={this.state.selectedConversationId} className="panel-body panel-body-conversation padding-none">
              {messages}
            </div>
              <div id="new_message">
                <CreateMessage ref="createMessage" openTextarea={this.openTextarea} closeTextarea={this.closeTextarea} conversationId={this.state.selectedConversationId} write_a_reply={this.props.write_a_reply} submit={this.props.submit} onMessageCreation={this.handleMessageCreation} />
              </div>
          </div>
        </div>
      </div>
    )
  },

  handleConversationSelection: function(conversationId) {
    this.setState({
      selectedConversationId: conversationId,
      loadingConversation: true
    })
    var that = this
    $.ajax({
      type: 'GET',
     url: Routes.conversations_path({format: 'json', conversation_id: conversationId}),
      success: function(data) {
        that.setState({
          conversations: data.conversations,
          selectedConversationId: data.conversation_id,
          firstName: data.first_name,
          messages: data.messages,
          focus: true,
          loadingConversation: false
        })
        $('#messages').scrollTop($('#messages')[0].scrollHeight);
        $('#newTextarea').attr("data-id", conversationId);
        $('#message-input').focus();
      }
    })
  },

  handleMessageCreation: function(conversationId, content) {
    var that = this;
    console.log(conversationId);
    $.ajax({
      type: 'POST',
      data: { message: { content: content} },
      url: Routes.conversation_messages_path({
        format: 'json',
        conversation_id: conversationId,
        message: { content: content}
      }),
      success: function(data) {
        console.log(data);
        that.setState({
          selectedConversationId: data.selected_conversation_id,
          firstName: data.first_name,
          conversations: data.conversations,
          messages: data.messages
        })
        that.refs.createMessage.resetState()
      }
    })
  },

  openTextarea: function() {
    this.setState({
      focused: true
    })
  },

  closeTextarea: function() {
    this.setState({
      focused: false
    })
  },
  handleBack: function() {
    this.setState({
      focus: false
    })
  }
})
