Omnisocial.setup do |config|
  
  # ==> Twitter
  # config.twitter 'APP_KEY', 'APP_SECRET'
  
  # ==> Facebook
  # config.facebook 'APP_KEY', 'APP_SECRET', :scope => 'publish_stream'
  
  if Rails.env.production?
    
    # Configs for production mode go here
    
  elsif Rails.env.development?
    
    # Configs for development mode go here
    config.twitter 'Rq2oBgdlhylDHMWbnvRw5w', '00MqddgC86iVeLVyrvo65vaEt9q52QMYCKUwssIcZ4'
    
  end
  
end
