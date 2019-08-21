class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  # If we destroy a cart, we want Rails also to
  # destroy any line items that are associated with that cart.
end
