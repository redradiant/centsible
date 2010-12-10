require 'openid'
require 'openid/store/filesystem'
require 'omniauth'
require 'oa-vkontakte'
require 'oa-mailru'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'consumer_key', 'consumer_secret'
  provider :linked_in, 'consumer_key', 'consumer_secret'
  provider :facebook, 'app_id', 'app_secret'
  provider :vkontakte_open_api, 'app_id'
  provider :github, 'consumer_key', 'consumer_secret'
  provider :MailRuApi, 'consumer_key', 'consumer_secret'
  provider :open_id, OpenID::Store::Filesystem.new('./tmp')
  provider :google_apps, OpenID::Store::Filesystem.new('./tmp')
end
