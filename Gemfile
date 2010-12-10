source 'http://gems.github.com'
source 'http://rubygems.org'

#gem 'autocode'
gem 'rails', '3.0.3'
gem 'isolate-scenarios'
gem 'pg'
gem 'paperclip'
gem 'colored'
gem 'term-ansicolor', :require => 'term/ansicolor'
gem 'shiny'
gem 'geokit-rails3'
#gem 'transitions', :require => ["transitions", "active_record/transitions"], :git => 'git://github.com/nc/transitions.git', :require => ["transitions", "active_record/transitions"]
gem 'haml'
gem 'rdiscount'
gem 'bj'
gem 'nokogiri'
gem 'aws-s3', :require => 'aws/s3'
gem 'asin'
gem 'awesome_print', :require => 'ap'
gem 'activemerchant', :require => "active_merchant"
#gem 'cancan', :git => 'git://github.com/ryanb/cancan.git'
gem 'role_model'
#gem 'oa-oauth', '>= 0.1.6'
#gem 'omniauth', '>= 0.1.6'
#gem 'devise', :git => 'git://github.com/plataformatec/devise.git'
gem 'fbgraph'
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
#gem 'enumerated_attribute', :git => 'https://github.com/jeffp/enumerated_attribute.git'
#gem 'state_machine'
gem "nifty-generators"
gem 'sham'

# Spree
gem 'spree', :path => "vendor/spree_edge" #:git => 'git://github.com/railsdog/spree.git'
#gem 'spree-email-to-friend'
#gem 'formtastic', :git => "git://github.com/justinfrench/formtastic.git"
#gem 'dynamic_form', :git => 'git://github.com/rails/dynamic_form.git'
#gem 'contact_us', :require => 'contact_us', :git => 'git://github.com/greendog/spree_contact_us.git'
#gem 'spree_store_credits', :git => 'https://github.com/spree/spree-store-credits.git'
#gem 'spree_gift_cards', :git => 'https://github.com/spree/spree-gift-cards.git'

gem "i18n"
gem "globalize3"
gem "globalize_spree", :git => 'https://tomash@github.com/tomash/globalize-spree.git'
#gem "spree_store_credits"
#gem "spree_gift_cards"
#gem "spree_omni", :require => "spree_omni", :path => "vendor/spree/spree-omni"
gem "spree_social", :path => "vendor/spree/spree_social"
gem 'spree_contact_form', :git => 'https://github.com/joshnuss/spree-contact-form.git'
gem 'spree_testimonials', :git => 'https://github.com/joshnuss/spree-testimonials.git'

group :experimental do
  gem 'has_scope'
  gem 'suppress_validations', :git => 'git@github.com:redradiant/suppress_validations.git'
  gem "default_value_for"
  gem 'arspy'
  gem 'seed-fu'
  gem 'ruby-graphviz', :require => 'graphviz'
  gem 'alter-ego'
end


gem 'inherited_resources', '1.1.2'  # https://github.com/josevalim/inherited_resources

group :development, :test do
  platforms :mri_18 do
    gem "ruby-debug"
  end

  platforms :mri_19 do
    gem "ruby-debug19"
  end

  gem 'utility_belt'
  gem 'differ'
  gem 'rails3-generators'
  gem 'database_cleaner'

  # Data Generation
  gem 'faker'
  gem 'random_data'
  gem 'forgery'  # http://sevenwire.github.com/forgery/

  gem 'thin' # http://code.macournoyer.com/thin/doc/files/README.html

  gem 'nokogiri'
  gem 'wirble'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'spork'
  gem 'launchy'

  gem 'machinist', '>= 2.0.0.beta1'
end

group :test do
  gem 'rspec', '2.1.0'
  gem 'rspec-rails', '2.1.0'
  gem "webrat", "0.7.1"
  gem 'capybara'
  gem 'rcov'
  gem "autotest"
  gem 'mechanize'

  # Factories
  gem "ZenTest"
  gem 'fabrication'
end
