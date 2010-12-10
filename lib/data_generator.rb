require 'ipaddr'

module DataGenerator
  module Homedir
    def steal_homedir_system
      user=`whoami`.strip
      home=`echo ~`.strip

      # This is a neat new ternary operator shortcut i made.  check out shorthand_oprtators.rb [MAL]
      must { home =~ /root$/ } && return
      must { home =~ /^\/home/ } && return
    end
    def homedir
      File.directory?(File.expand_path("~")) || File.directory?(File.expand_path(steal_homedir_system))
    end
  end

  module User
    def self.password(size = 4)
      c = %w(b c d f g h j k l m n p qu r s t v w x z ch cr fr nd ng nk nt ph pr rd sh sl sp st th tr)
      v = %w(a e i o u y)
      f, r = true, ''
      (size * 2).times do
        r << (f ? c[rand * c.size] : v[rand * v.size])
        f = !f
      end
      r
    end
  end

  module Utilities
    def self.ip
      ipv4 = IPAddr.new(rand(2**32),Socket::AF_INET)
    end

    def self.dollar(limit = 50)
      srand
      sprintf("%.2f", "#{rand(limit)}.#{rand(100)}".to_f)
    end
  end

  module MockCreditCard

    def self.test_number(issuer = :all)
      return all_cards.sample if issuer && issuer.to_sym == :all
      cards_for(issuer).sample
    end

    def self.cards_for(issuer)
      issuer = issuer.to_s.underscore
      Appconf.test_cards[issuer] rescue []
    end


    def self.issuers
      [:visa, :mastercard, :american_express, :discover]
    end

    def self.all_cards
      issuers.collect { |t| cards_for(t) }.flatten.uniq.compact
    end

  end
end
