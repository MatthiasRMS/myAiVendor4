var Block = React.createClass({

  render: function() {
    var pClasses = classNames({
      "hidden": true
    })

    return (
       <div><div>hello</div></div>
      // <div><textarea ></textarea>
      //   <textarea id="edit" name="content"></textarea>
      // </div>
    )
  },

  handleClick: function() {
    this.setState({
      isEditing: true
    })
  },
})
