Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'rH65V9NkTS7EhPtii7xJgQ', 'odUDYPZb0EXMweoH1ptCxqLWHW9WrD4PQl2uN0m94'
  # provider :facebook, 'APP_ID', 'APP_SECRET'
  # provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  # provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
end