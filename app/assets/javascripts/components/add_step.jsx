var AddStep = React.createClass({
  getInitialState: function(){
    return {
      content: this.props.content
    }
  },

  handleKeyUp: function(e) {
    this.setState({
      content: this.refs.addStep.value,
    })
  },

  handleValidation: function() {
    var that = this;
    this.props.addSteps(this.state.step);
  },

  handleValidation: function() {
    var that = this
    $.ajax({
      type: "POST",
      data: {block: { content: that.state.content } },
      url: Routes.create_block_path({format: 'json'}),
      success: function(data) {
       that.setState({
         content: ""
       })
      }
    })
  },

  render: function(){
    return (
      <div>
      <textarea onKeyUp={this.handleKeyUp} value={this.state.value} ref="addStep"></textarea>
      <button onClick={this.handleValidation}>submit</button>
      </div>
    )
  }
})
