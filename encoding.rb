# require 'digest'
# require 'base64'
# require 'cgi'
# require 'time'
# require 'openssl'
# require 'json'
# require 'SecureRandom'

# SHARED_SECRET = SecureRandom.hex
# p SHARED_SECRET
# def signString(string_to_sign, shared_secret)
#   return OpenSSL::HMAC.digest('sha512', shared_secret, string_to_sign)
# end

# payload = {
#   :name => 'joe smith',
#   :category => 'people',
#   :action => 'transport',
#   :where => 'pluto',
#   :timestamp => Time.now.to_i.to_s
# }

# json_payload = JSON.generate(payload)
# signature = signString(json_payload, SHARED_SECRET)

# encoded_signature = Base64.urlsafe_encode64(signature)
# encoded_payload = Base64.urlsafe_encode64(json_payload)

# puts "/?data=#{encoded_payload}&signature=#{encoded_signature}"
# p "======================"
# puts "#{encoded_payload}"
# puts "#{encoded_signature}"

require 'openssl'
require 'digest/sha1'

# # create the cipher for encrypting
# cipher = OpenSSL::Cipher::Cipher.new("aes-128-cbc")
# cipher.encrypt

# # # you will need to store these for later, in order to decrypt your data
# cipher.key  = "aa40008a1338b30d8dfdbdfa44d45710"



# # # encrypt the message
#  p encrypted = cipher.update('b42f276c4ae84d4f')

class Encode
  def initialize(key)
    @salt= key
  end

  def encrypt(text)
     Digest::SHA1.hexdigest("--#{@salt}--#{text}--")
  end
end

e= Encode.new("This is a very hard key.")



