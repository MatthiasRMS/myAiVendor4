var Stats = React.createClass({
  render : function() {
    return(
      <div>
       <p><a href="#">{this.props.favorites + "favoris"}</a></p>
       <p><a href="#">{this.props.followers + "abonnés"}</a></p>
       <p><a href="#">{this.props.following + "abonnements"}</a></p>
      </div>
      )
  }
});
