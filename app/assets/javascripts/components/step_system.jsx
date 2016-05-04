var StepSystem = React.createClass({
  getInitialState: function() {
    return {
       steps: []
    }
  },

  addSteps: function(step) {
    var steps = this.state.steps;
    steps.push(step);
    this.setState({steps: steps})
  },

  render: function() {
    return (
      <div>
        <StepList steps={this.state.steps}/>
        <AddSteps addsteps={this.addSteps}/>
      </div>

    );
  }
});
