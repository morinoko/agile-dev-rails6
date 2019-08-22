class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  # If we destroy a cart, we want Rails also to
  # destroy any line items that are associated with that cart.

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)

    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
      current_item.price = product.price
    end

    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
