var ProductListItem = React.createClass({
  render: function() {
    return (
      <div className="post">
        <Upvote post={this.props.post}/>
        <div className="post-body">
          <h3>
            <a href={this.props.post.title} target="_blank">{this.props.post.title}</a>
          </h3>
          <p>{this.props.post.content}</p>
        </div>
        <div className="post-controls">
          <div className="post-control">
            <div className="user-badge-container ">
              <img src={this.props.post.user.picture_url} className="avatar"/>
            </div>
          </div>
        </div>
      </div>
    );
  }
});
