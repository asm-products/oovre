# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
secret = Rails.env.production? ? ENV['SECRET_TOKEN'] : 'e8e6fb08f22d83f91f9a41e010b0a28f7dc85a48dd899944124c07d9a13b2abf5b3de421b1f85066c840de9cfddc009c73896b39b0c1150db2921db2bfad1f25'
Blogee::Application.config.secret_key = ENV['SECRET_TOKEN']