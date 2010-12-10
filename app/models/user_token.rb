class UserToken < ActiveRecord::Base
  belongs_to :user
  #validates_presence_of :user_id, :uid, :provider
  #validates_uniqueness_of :uid, :scope => :provider

  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

  def self.create_from_hash(hash, user = nil)
    user ||= User.create(hash)
    self.create(hash.merge(:user => user).merge(hash['credentials']))
    #, :uid => hash['uid'], :provider => hash['provider'])
  end

  def apply_omniauth(omniauth)
    return false if (omniauth['credentials'].blank? rescue true)
    self.attributes = {
      :provider => omniauth['provider'],
      :user_id => self.user_id,
      :uid => omniauth['uid'],
      :token => omniauth['credentials']['token'],
      :secret => omniauth['credentials']['secret']
      }
    self.save
  end
end
