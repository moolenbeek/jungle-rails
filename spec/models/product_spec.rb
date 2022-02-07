require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should validate :name, presence :true' do
      @category = Category.new
      @product = Product.new
      @product = Product.new(name: 'toaster', price: 10, quantity: 20, category: @category)
      expect(@product.name).to be_present
    end
    it 'should validate :price, presence :true' do
      @category = Category.new
      @product = Product.new(name: 'toaster', price: 10, quantity: 20, category: @category)

      expect(@product.price).to be_present
    end
    it 'should validate :quantity, presence :true' do
      @category = Category.new
      @product = Product.new(name: 'toaster', price: 10, quantity: 20, category: @category)

      expect(@product.quantity).to be_present
    end
    it 'should validate :category, presence :true' do
      @category = Category.new
      @product = Product.new(name: 'toaster', price: 10, quantity: 20, category: @category)

      expect(@product.category).to be_present
    end
  end
end