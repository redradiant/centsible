class UserCreditCard < ActiveRecord::Base

  #include ActiveMerchant::Billing::CreditCardMethods  
  #validates_with CardValidator

  has_one :location
  belongs_to :user

  def params_for_cc
    p = self.attributes.symbolize_keys.slice(:first_name, :last_name, :number, :verification_value).merge(
      :month => self.expiration_date.month,
      :year => self.expiration_date.year,
      :start_month => (self.start_date.month rescue nil),
      :start_year => (self.start_date.year rescue nil)
      )
    p.compact_by_values
  end

  def cc
    return @cc if (!@cc.blank? && @cc.valid?) rescue false
    @cc = ActiveMerchant::Billing::CreditCard.new(params_for_cc)
  end

  def has_cc?
    !params_for_cc.blank? && 
    (params_for_cc.blank.assert_not_blank!(:first_name, :last_name, :number, :verification_value, :month, :year) rescue false) &&
    cc.kind_of?(ActiveMerchant::Billing::CreditCard)
  end

  def valid_cc?
    cc.valid? rescue false
  end
end


