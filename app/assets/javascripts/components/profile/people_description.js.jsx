var PeopleDescription = React.createClass({
  render : function() {
    return(
      <div>
        <h3>{this.props.display_name}</h3>
        <p>{this.props.description}</p>
      </div>
      )
  }
});
