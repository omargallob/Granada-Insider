# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_granadainsider_session',
  :secret      => 'b4f2cbc2dd711caf4072fc57813e0d43acd9e8276431c67c58eb18afbfc4f7d38a92907aa059adfb291973ecbb9e6d0a1a815fb756898851655470dfa49e6cae'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
