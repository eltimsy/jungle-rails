require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      @category = Category.find_by name: 'Electronics'
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!(
      name: "abc",
      quantity: 20,
      price: 100,
      category: @category)
      @product2 = Product.create!(
      name: "bbe",
      quantity: 50,
      price: 100,
      category: @category)
      # Setup at least one product that will NOT be in the order
      @product3 = Product.create!(
      name: "haha",
      quantity: 10,
      price: 200,
      category: @category)
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
      total_cents: 20000,
      email: "abc@abc.com",
      stripe_charge_id: "123kdsjf"
      )
      # 2. build line items on @order
      @line_item1 = LineItem.create!(
      order_id: @order,
      product_id: @product1,
      quantity: 1,
      item_price_cents: @product1.price,
      total_price_cents: @product1.price * 1
      )
      @line_item2 = LineItem.create!(
      order_id: @order,
      product_id: @product2,
      quantity: 1,
      item_price_cents: @product2.price,
      total_price_cents: @product2.price * 1
      )
      # ...
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      expect(@product1[:quantity]).to eql(19)
      expect(@product2[:qauntity]).to eql(49)
      # 5. use RSpec expect syntax to assert their new quantity values
      # ...
    end
    # pending test 2
    xit 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
    end
  end
end
