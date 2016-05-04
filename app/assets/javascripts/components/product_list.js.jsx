var ProductList = React.createClass({
  render: function() {
    return (
      <div>
        {this.props.posts.map(function(post){
          return <ProductListItem post={post} />;
        })}
      </div>
    );
  }
});
