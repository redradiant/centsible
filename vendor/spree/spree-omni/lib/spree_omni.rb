require 'spree_core'
require 'spree_omni_hooks'

module SpreeOmni
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)
    paths.app.views           = "app/views"
    paths.app.models          = "app/models"
    paths.app.controllers     = "app/controllers"
    paths.app.helpers         = "app/helpers"
    paths.config.initializers = "config/initializers/omniauth.rb"

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end

      # each user can use different socialnetwork for same account
      User.class_eval do
        has_many :o_datas
        # search user by provider and data
        # in migration exist index
        def self.find_by_provider_and_uid(provider,uid)
          self.joins(:o_datas).where(:o_datas => {:provider => provider,:uid => uid }).limit(1).first
        end

        def self.create_by_auth(auth)
          begin
          user = self.new
          user.login = auth['user_info']['nickname']
          user.persistence_token = Authlogic::Random.hex_token
          user.save!(false) # save without validation
          user.o_datas.create( 
                              :provider => auth['provider'],
                              :uid => auth['uid'],
                              :user_info => auth['user_info'],
                              :name => auth['user_info']['name']
                             )
          return user
          rescue =>e
            puts e
          end
        end
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
