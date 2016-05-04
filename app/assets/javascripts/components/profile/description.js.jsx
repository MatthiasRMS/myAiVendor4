var Description = React.createClass({
  getInitialState: function() {
    return {
      isEditing: false,
      description: this.props.description
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
    })
    return (

      <div>
        <h3 onClick={this.handleClick}>{this.props.display_name}</h3>
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
        description: this.state.description
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

  // <%= form_for (@user) do |f| %>


  //   <img id="img_prev" src="#" alt="your image" size="full" class="hidden"/>
  //     <%= f.attachinary_file_field :banner, as: :attachinary %>

  //   <div class="form-inputs">
  //     <div class="container">
  //       <div class="row">
  //         <div class="col-xs-12">
  //           <div class="form-actions">
  //             <%= f.submit %>
  //           </div>
  //         </div>
  //       </div>

  //   </div>
  // <% end %>

