var Avatar = React.createClass({
  render : function() {
    var avatar_style = {
      height: 300,
      width: 300,
      backgroundSize: 'cover'
    };

    return(
        <div style={{avatar_style}, {backgroundImage: "url('" + this.props.avatar_url + "')"}}></div>
      )
  }
});
