var ConversationList = React.createClass({
  render: function() {
    var that = this
    return (
    <div>
      <div className="flexbox-columns-start">
        {this.props.conversations.map(function(conversation, index){
          return <ConversationListItem
                    conversation={conversation}
                    key={index}
                    onConversationSelection={that.props.onConversationSelection}
                    selectedConversationId={that.props.selectedConversationId}
                  />;
        })}
        <div className="end-of-messages">
          <p>Fin des messages</p>
        </div>
      </div>
    </div>
    )
  }
});

$("#validate-categories").click(function(e) {
  if($(".favorite-card-upvoted").length < 2) {
    e.preventDefault();
    $(".pusher").append("<h3 class='text-center' style='color:red;'>Veuillez sélectionner au moins 2 catégories</h3>")
  }
});
