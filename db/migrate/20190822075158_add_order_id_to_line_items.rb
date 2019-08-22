class AddOrderIdToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :line_items, :order, null: true, foreign_key: true
  end
end
