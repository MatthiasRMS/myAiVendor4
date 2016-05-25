var Profile = React.createClass({
  render : function() {
    return(
      <div>
        <BannerImage banner_picture={this.props.banner_url}/>
        <div className="profile-header col-xs-12">
          <Avatar avatar_picture={this.props.avatar_picture_url}/>
          <Stats favorites={this.props.favorites} followers={this.props.followers} following={this.props.following} />
          <PeopleDescription display_name={this.props.display_name} description={this.props.description} />
          <ActionButton />
        </div>
      </div>
    )
  }
});
