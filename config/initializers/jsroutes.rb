JsRoutes.setup do |config|
  # Whitelist routes to include on the Front-End
  # NOTE: if you add a new route here, do not forget to run:
  #       $ rake tmp:cache:clear
  #       before restarting your `rails s`.
  config.include = [
    /^posts_sub_categories$/,
    /^upvote_post$/,
    /^user$/,
    /^favorite_category$/,
    /^conversations$/,
    /^conversation_messages$/
  ]
end
