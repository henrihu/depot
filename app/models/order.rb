class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :user

  attr_accessible :name, :address, :email, :pay_type

  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def add_user(user)
    # user_id = user.id
    self.user_id = user.id
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
