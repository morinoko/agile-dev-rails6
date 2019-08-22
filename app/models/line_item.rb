class LineItem < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :cart
  belongs_to :order, optional: true
  
  def total_price
    price * quantity
  end
end
