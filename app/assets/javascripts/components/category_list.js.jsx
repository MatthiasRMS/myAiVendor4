var CategoryList = React.createClass({
  render: function() {
    return (
      <div className="category-grid">
        <div className="container">
          <div className="row">
            {this.props.categories.map(function(category, index){
              return <Favorite category={category} key={index}/>
            })}
          </div>
        </div>
      </div>
    );
  }
});
