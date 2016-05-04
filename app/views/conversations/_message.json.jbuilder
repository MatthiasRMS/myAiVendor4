json.extract! message, :id, :user, :read_at
json.writer_avatar_url  avatar_picture_json(message.user)
json.writer_first_name message.user.display_name
json.created_at message.created_at.strftime("%e/%m, %H:%M")
json.content simple_format(message.content)
