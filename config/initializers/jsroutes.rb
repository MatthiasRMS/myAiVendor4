JsRoutes.setup do |config|
  config.include = [
    /^posts_sub_categories$/,
    /^upvote_post$/,
    /^user$/,
    /^favorite_category$/,
    /^conversations$/,
    /^conversation_messages$/
  ]
end
