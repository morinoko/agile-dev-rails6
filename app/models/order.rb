class Order < ApplicationRecord
  enum pay_type: {
    "Check"          => 0,
    "Credit card"    => 1,
    "Purchase order" => 2
  }
  
  # all line items that belong to an order are to be 
  # destroyed whenever the order is destroyed
  has_many :line_items, dependent: :destroy

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
