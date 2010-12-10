require 'bid'
require 'role_model'

# I was reallly thinking ALterEgo would be better than state machine here because of its philosophy.  Check it out.
#

class User < ActiveRecord::Base

  # Setup accessible (or protected) attributes for your model

  # Include default devise modules. Others available are:

  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :lockable

  #attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :user_tokens

  #alias_attribute :token, :authentication_token

  belongs_to :shipping_location, :class_name => "Location", :foreign_key => "shipping_location_id"
  acts_as_mappable :through => :shipping_location

  has_many :user_locations, :class_name => "UserLocation", :foreign_key => "user_id", :dependent => :destroy
  has_many :locations, :through => :user_locations

  has_many :user_credit_cards
  belongs_to :active_credit_card, :class_name => "::UserCreditCard"

  #acts_as_mappable :through => { :locations => :location }

#  attr_protected :email_verified, :facebook_verified

  has_many :bids
  has_many :auctions, :through => :bids

  def self.create_from_hash!(hash)
    create(:name => hash['user_info']['name'])
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session[:omniauth]
        t = user.user_tokens.build(:provider => data['provider'], :uid => data['uid'],
          :token => data['credentials']['token'],
           :secret => data['credentials']['secret'])
        t.save(:validate => false) if (t[:id].blank? rescue true)
        t
      end
    end
  end
  
  def apply_omniauth(omniauth)
    #add some info about the user

    fbinfo = ::Hashie::Mash.new((omniauth["user_info"] rescue {}))

    access_token = omniauth["credentials"]["token"] rescue nil

    #raise "Can't authorize!" unless valid_facebook_auth? fbinfo

    #self.facebok_id = fbinfo.id
    self.email ||= fbinfo.email
    self.first_name ||= fbinfo.first_name
    self.last_name ||= fbinfo.last_name
    #self.password ||= Devise.friendly_token[0,40]
    #self.birthday = Date.parse(fbinfo.birthday) rescue nil
    if changed? && !email.blank? && self.save(:validate => false)
      Rails.logger.warn "Persisting user failed: #{self.to_s} with errors:\n#{self.errors.full_messages.join("\n")}\n\n"
    end

    #self.name = omniauth['user_info']['name'] if name.blank?
    #self.nickname = omniauth['user_info']['nickname'] if nickname.blank?
    save(:validate => false)
    t = UserToken.find_or_initialize_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    t.apply_omniauth(omniauth)
    t
  end
  
  def password_required?
    ((user_tokens.empty? || !password.blank?) rescue nil) || super  
  end


  ### Setup roles
  include RoleModel

  roles_attribute :roles_mask
  roles :admin, :user

  def add_role!(new_role)
    self.roles = (self.role_symbols.to_a rescue []).push(new_role.to_sym).flatten.uniq.compact
    self.save(:validate => false)
  end

  # This is how a user places a bid on an auction.  It needs to be done this way to ensure normality of
  # bid cout, time and transaction safety.
  def bid_on!(auction)
    nb = nil
    nb2 = nil
    begin
      raise(BidError, "Invalid auction: #{auction.to_s}") unless aid = auction.to_id
      raise(BidError, "Could not find auction: #{aid}") unless a = Auction.find(aid)
      raise(BidError, "Auction is closed.") unless a.running?
      nb = self.bids.create(:user_id => self[:id], :auction_id => a[:id])
      nb2 = a.submit_bid!(nb) rescue nil # Maybe remove this...
      raise(BidError, "No Bid returned.") if nb2.blank?
      raise(BidError, nb2.errors.full_messages.join(', ')) unless nb2.valid?
    rescue Exception => e
      (nb2.blank? ? nb : nb2).errors.add(:bid, "Not able to create a valid bid submission: #{e.to_s}") rescue nil
      return (nb2.blank? ? nb : nb2)
    end

    nb2
  end

  def acceptible?
    (valid? && active?) rescue false
  end

  def provider(name = :facebook)
    self.user_tokens.find_by_provider(name.to_s) rescue nil
  end

  def facebook_client
    @fb_client ||= FBGraph::Client.new(
        :client_id => Appconf.integrations.facebook.id,
        :secret_id => Appconf.integrations.facebook.secret)
    if t = (provider(:facebook).token rescue nil)
      @fb_client.set_token(t)
    else
      @fb_client
    end
  end

  def facebook_admin?
    !(facebook_client.selection.me.connection("accounts").info!.data.data.select{ |p| p.id == "151550814881882" }.empty? rescue true)
  end

end
