# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ToDo_session',
  :secret      => '8c6eebd1092d6104a44ec19d72f42e8182ec6fa7172b2b8d0f72c7f4b48cbdbc4091489b63521842ab598292816a33159ec974ff1a6c537479daa90b26124949'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
