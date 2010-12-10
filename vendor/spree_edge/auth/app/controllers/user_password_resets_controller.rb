class UserPasswordResetsController < Devise::PasswordsController
  include SpreeBase
  helper :users, 'spree/base'
  
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  
  def new
    super
  end
  
  def create
    super
  end
  
  def edit
    super
  end
  
  def update
    super
  end
  #def new
  #  render
  #end
  #
  #def create
  #  @user = User.find_by_email(params[:email])
  #  if @user
  #    @user.deliver_password_reset_instructions!
  #    flash.notice = t("password_reset_instructions_are_mailed")
  #    redirect_to root_url
  #  else
  #    flash[:error] = t("no_user_found")
  #    render :action => :new
  #  end
  #end
  #
  #def edit
  #  render
  #end
  #
  #def update
  #  @user.password = params[:user][:password]
  #  @user.password_confirmation = params[:user][:password_confirmation]
  #  if @user.save
  #    flash.notice = t("password_updated")
  #    redirect_to account_url
  #  else
  #    render :action => :edit
  #  end
  #end
  #
  #private
  #  def load_user_using_perishable_token
  #    @user = User.find_using_perishable_token(params[:id])
  #    unless @user
  #      flash.notice = t("password_reset_token_not_found")
  #      redirect_to root_url
  #    end
  #  end
  #
  #  def accurate_title
  #    I18n.t(:forgot_password)
  #  end

end
