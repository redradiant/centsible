class OmniController < ApplicationController
  def callback
=begin
1. ищем пользователя по uid + provider
2. если его нет то создаем пользователя и запись в o_datas
3  создаем сессию для пользователя
=end
     auth = request.env['rack.auth']
     user = User.find_by_provider_and_uid(auth['provider'],auth['uid'])
     if user.nil?
       user = User.create_by_auth(auth)
     end
     @user_session = UserSession.new(user)
     puts @user_session.save!
     if @user_session
       redirect_to '/', :notice => "Welcome, #{auth['user_info']['name']}"
     else
       redirect_to '/login', :alert => "Error login"
     end
  end
end
