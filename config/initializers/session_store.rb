# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ativitec_session',
  :secret      => 'eecf9b817079bfdea38bea8c4ffef574ce2397c6577177b151e11b1640d37f28e1347e337f9dff38b69e50265fd832ce6ba76390566c6e23640f279e93502106'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
