class CreditCard < ActiveRecord::Base
  validates :number, :cvv, :expiration_month, :expiration_year, :firstname, :lastname, presence:true
  has_many :orders
end
