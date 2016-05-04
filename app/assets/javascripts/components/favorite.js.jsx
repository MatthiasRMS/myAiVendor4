var Favorite = React.createClass({
  getInitialState: function() {
    return {
      category: this.props.category
    }
  },

  handleClick: function() {
    var that = this;

    $.ajax({
      type: 'POST',
      url: Routes.favorite_category_path(this.props.category, { format: 'json' }),
      success: function(data) {
        that.setState({ category: data });
      }
    });
  },

  render: function() {
    var divClasses = classNames({
      "favorite-card": true,
      "favorite-card-upvoted": this.state.category.up_voted,
    });
    var checkClasses = classNames({
       "fa fa-check": this.state.category.up_voted
    });
    var url = "url('" + this.props.category.category_url + "')"
    var hidClasses = classNames({
     "hidden": this.props.category.ancestry,
     "col-xs-12 col-sm-4 col-md-3": true
    });
    return (
      <div className={hidClasses}>
        <div className={divClasses} onClick={this.handleClick} style={{backgroundImage: url}}>
          <h2>{this.props.category.name}</h2>
          <i className={checkClasses}></i>
        </div>
      </div>
    );
  }
});
