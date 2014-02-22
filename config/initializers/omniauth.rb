Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, ENV['FITBIT_ID'], ENV['FITBIT_SECRET']
end