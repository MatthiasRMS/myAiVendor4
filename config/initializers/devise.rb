# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # Devise will use the `secret_key_base` as its `secret_key`
  # by default. You can change it below and use your own secret key.
  config.secret_key = '895d338956801f9fac6413c421e3d908361fcd61541c08bcef05c98c5cb2e2738aabe2fcd8b5ac2b47ac7c4918717d427f23f396a413d74d32d0177b652950d6'

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  # available as additional gems.
  require 'devise/orm/active_record'



  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@]+@[^@]+\z/


  config.reset_password_within = 6.hours


  config.sign_out_via = :delete

end
