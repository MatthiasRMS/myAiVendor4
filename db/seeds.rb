# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "rest-client"

msg = "hye"
session_id = Session.last.id
key = Digest::SHA1.hexdigest("--#{ENV['mms_secret']}--#{ENV['mms_token']}--")
session = Session.find(session_id)
sender_id = session.facebook_id
username = "Matthias"
profile_picture = {profile_pic: "https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/11425115_10152993512543697_2720240051556879751_n.jpg?oh=8db4ad4a71e18391f2b9a1eb42a72a25&oe=57D361F9"}.to_query
url = "http://mymessagingstore.herokuapp.com/api/v1/sessions?key=#{key}&fbid=#{sender_id}&msg=#{msg}&first_name=#{username}&sender=bot&context=#{session.context}&profile_picture=#{profile_picture}"
RestClient.post URI.encode(url), :content_type => :json, :accept => :json
