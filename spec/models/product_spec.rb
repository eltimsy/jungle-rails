require 'rails_helper'
require 'pp'

RSpec.describe Product, type: :model do
  describe Product do
    it 'should create a product if all fields are correct' do
      @category = Category.create! name: 'Apparel'
      @product = Product.new(
      name: 'abc',
      price: 10,
      quantity: 1)
      @product.category = @category
      # pp @product
      @product.valid?
      expect(@product.errors.size).to eql(0)
    end
    describe 'Validations' do
      it 'should give an error if name is missing' do
        @category = Category.create! name: 'Apparel'
        @product = Product.new()
        @product.category = @category
        @product.name = ""
        @product.valid?
        expect(@product.errors[:name]).to include("can't be blank")
      end
      it 'should give an error if price is missing' do
        @category = Category.create! name: 'Apparel'
        @product = Product.new()
        @product.category = @category
        @product.price = nil
        @product.valid?
        expect(@product.errors[:price]).to include("is not a number")
      end
      it 'should give an error if quantity is missing' do
        @category = Category.create! name: 'Apparel'
        @product = Product.new()
        @product.category = @category
        @product.quantity = nil
        @product.valid?
        expect(@product.errors[:quantity]).to include("can't be blank")
      end
      it 'should give an error if category is missing' do
        @category = Category.create! name: 'Apparel'
        @product = Product.new()
        @product.valid?
        expect(@product.errors[:category]).to include("can't be blank")
      end
    end
  end
end
