OrdersController.class_eval do
  after_filter :store_guest, :only => :populate
  before_filter :check_authorization

  private

  def store_guest
    return if current_user
    session[:guest_token] ||= @order.user.persistence_token
  end

  def check_authorization
    session[:guest_token] ||= params[:token]
    order = current_order || Order.find_by_number(params[:id])
    if order
      authorize! :edit, order
    else
      authorize! :create, Order
    end
  end

end
