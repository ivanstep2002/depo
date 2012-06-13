class CombineItemsInCart < ActiveRecord::Migration
  def up
    
end

  def down
# split items with quantity>1 into multiple items
LineItem.where("quantity>1").each do |line_item|
# add individual items
line_item.quantity.times do
LineItem.create cart_id: line_item.cart_id,
product_id: line_item.product_id, quantity: 1
end
# remove original item
line_item.destroy
end
end
end

