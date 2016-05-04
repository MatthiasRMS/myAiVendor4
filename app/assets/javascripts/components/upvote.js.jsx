var Upvote = React.createClass({
  getInitialState: function() {
    return {
      post: this.props.post
    }
  },

  handleClick: function() {
    var that = this;
    $.ajax({
      type: 'POST',
      url: Routes.upvote_post_path(this.props.post, { format: 'json' }),
      success: function(data) {
        that.setState({ post: data });
      }
    });
  },

  render: function() {
    var divClasses = classNames({
      "post-upvote": true,
      "post-upvote-upvoted": this.state.post.up_voted
    });

    return (
      <div className={divClasses} onClick={this.handleClick}>
        <div className="post-upvote-arrow"><a class="btn btn-primary">
        J&rsquo;aime</a></div>
        <div className="post-upvote-count">
          {this.state.post.up_votes}
        </div>
      </div>
    );
  }
});
