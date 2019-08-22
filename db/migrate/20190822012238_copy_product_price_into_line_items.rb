class CopyProductPriceIntoLineItems < ActiveRecord::Migration[6.0]
  def up
    # copy over price from product so line items are able to reflect the price
    # of products when added
    LineItem.all.each do |line_item|
      product = Product.find(line_item.product_id)
      line_item.price = product.price
      line_item.save!
    end
  end

  def down
    LineItem.all.each do |line_item|
      line_item.price = nil
      line_item.save!
    end
  end
end
