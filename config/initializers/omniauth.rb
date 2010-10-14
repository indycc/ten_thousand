Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openid, OpenID::Store::Filesystem.new('/tmp') # TODO -- http://github.com/cnicolaou/openid_active_record_store
end
