var BannerImage = React.createClass({
  render : function() {
    return(
      <div className='banner-cover' style={{backgroundImage: "url('" + this.props.banner_url + "')"}}></div>
    )
  }
});

