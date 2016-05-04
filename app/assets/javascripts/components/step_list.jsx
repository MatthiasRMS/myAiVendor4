var stepList = React.createClass({
  render: function() {
    return (
      <div>
        {this.props.steps.map(function(step){
          return <stepListItem key={step.id} step={step} />;
        })}
      </div>
    );
  }
});
