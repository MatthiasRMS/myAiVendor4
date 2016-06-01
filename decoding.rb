# require 'digest'
# require 'base64'
# require 'cgi'
# require 'uri'
# require 'time'
# require 'openssl'
# require 'json'
# require 'active_support/security_utils'

# SHARED_SECRET = "b06a03313c4d8bf6448416b57011d96e"

# def verifySignature(string_to_verify, signature, shared_secret)
#     return ActiveSupport::SecurityUtils::secure_compare(
#         OpenSSL::HMAC.digest('sha512', shared_secret, string_to_verify), signature)
# end


# url = '?data=eyJuYW1lIjoiam9lIHNtaXRoIiwiY2F0ZWdvcnkiOiJwZW9wbGUiLCJhY3Rpb24iOiJ0cmFuc3BvcnQiLCJ3aGVyZSI6InBsdXRvIiwidGltZXN0YW1wIjoiMTQ2NDc4NjA5OSJ9&signature=_RTuoEgcmkNLs6Q0E-12HIT013CAVLUr33eIPWPXvuR322gAdcowv_JmVGN0cvbAtauwYJep19r03eruPyFSww=='

# query = CGI::parse(URI(url).query)

# decoded_signature = Base64.urlsafe_decode64(query["signature"][0])
# decoded_json = Base64.urlsafe_decode64(query["data"][0])

# if verifySignature(decoded_json, decoded_signature, SHARED_SECRET)
#     puts "Valid signature"
# else
#     puts "Invalid signature"
# end

require 'openssl'
require 'digest/sha1'

# # create the cipher for encrypting
# cipher = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
# cipher.encrypt

# # you will need to store these for later, in order to decrypt your data
# key = Digest::SHA1.hexdigest("yourpass")
# iv = cipher.random_iv

# # load them into the cipher
# cipher.key = key
# cipher.iv = iv

# # encrypt the message
# encrypted = cipher.update('This is a secure message, meet at the clock-tower at dawn.')
# encrypted << cipher.final
# puts "encrypted: #{encrypted}\n"

# # now we create a sipher for decrypting
# cipher = OpenSSL::Cipher::Cipher.new("aes-256-cbc")
# cipher.decrypt
# cipher.key = key
# cipher.iv = iv

# # and decrypt it
# decrypted = cipher.update(encrypted)
# decrypted << cipher.final
# puts "decrypted: #{decrypted}\n"

# now we create a sipher for decrypting

# encrypted = "U\xF49\xA9\xDCE@\xC1M`\xBC\xB5it\xF3R"
# cipher = OpenSSL::Cipher::Cipher.new("aes-128-cbc")
# cipher.key = "aa40008a1338b30d8dfdbdfa44d45710"


# # and decrypt it
# decrypted = cipher.update(encrypted)
# puts "decrypted: #{decrypted}\n"
