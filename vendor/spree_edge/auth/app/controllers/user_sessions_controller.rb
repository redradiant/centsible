class UserSessionsController < Devise::SessionsController
  include SpreeBase
  helper :users, 'spree/base'

  include Spree::CurrentOrder
  include Spree::AuthUser

  after_filter :associate_user, :only => :create

  ssl_required :new, :create, :destroy, :update
  ssl_allowed :login_bar

  # GET /resource/sign_in
  def new
    super
  end

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "UserSessions#new")

    if user_signed_in?
      respond_to do |format|
        format.html {
          flash[:notice] = t("logged_in_succesfully") unless session[:return_to]
          redirect_back_or_default(products_path)
        }
        format.js {
          user = resource.record
          render :json => {:ship_address => user.ship_address, :bill_address => user.bill_address}.to_json
        }
      end
    end
  end

  def destroy
    session.clear
    super
  end

  def nav_bar
    render :partial => "shared/nav_bar"
  end

  private

  def associate_user
    return unless current_user and current_order
    current_order.associate_user!(current_user)
    session[:guest_token] = nil
  end

  def accurate_title
    I18n.t(:log_in)
  end

end