require 'omniauth/builder'
require 'omniauth/openid'
require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openid # TODO -- http://github.com/cnicolaou/openid_active_record_store
  provider :openid, nil, :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
#  provider :twitter
end
