module UsersHelper       
  def password_style(user)
    ""
    puts "[SPREE] Password style has be depreciated due to the removal of OpenID from the Auth Gem. Please install the spree_social gem to regain this functionality and more."
  end         
  def openid_style(user) 
    "display:none"
    puts "[SPREE] Password style has be depreciated due to the removal of OpenID from the Auth Gem. Please install the spree_social gem to regain this functionality and more."
  end

end