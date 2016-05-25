var Profile = React.createClass({
  getInitialState: function() {
    return {
      isEditing: false
    }
  },

  render: function() {
    var pClasses = classNames({
      "hidden": this.state.isEditing
    })
    var textareaClasses = classNames({
      "hidden": !this.state.isEditing
    })
    var buttonClasses = classNames({
      "hidden": !this.state.isEditing,
      "btn": true,
      "btn-maker-default": true
    })
    return (
      <div>
        <h3 onClick={this.handleClick}>Matériel</h3>
        <p className={pClasses}>{this.state.description}</p>
        <textarea className={textareaClasses} defaultValue={this.state.description} onKeyUp={this.handleKeyUp}></textarea>
        <button className={buttonClasses} onClick={this.handleEdition}>Edit</button>
      </div>
    )
  },

  handleClick: function() {
    this.setState({
      isEditing: true
    })
  },

  handleKeyUp: function(e) {
    if (e.which == 27) {
      this.setState({
        isEditing: false,
        description: ''
      })
    } else {
      this.setState({
        description: $("textarea").val()
      })
    }
  },

  handleEdition: function() {
    var that = this
    $.ajax({
      type: 'PATCH',
      data: {user: {description: $("textarea").val()}},
      url: Routes.user_path({format: 'json', id: this.props.id}),
      success: function(data) {
        that.setState({
          isEditing: false,
          description: data.description
        })
      }
    })
  }
})
