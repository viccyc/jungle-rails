require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save a product with all required fields present' do
      @category = Category.new(name: 'Sports')
      @product = Product.new(name: 'snowboard', price: 500, quantity: 32, category: @category)
      @product.save!
      expect(@product).to be_present
    end
    it 'should throw a name required error when the name parameter is missing from product creation' do
      @category = Category.new(name: 'Sports')
      @product = Product.new(price: 500, quantity: 32, category: @category)
      @product.save
      expect(@product.errors.full_messages[0]).to eql("Name can't be blank")
    end
    it 'should throw a price required error when the price parameter is missing from product creation' do
      @category = Category.new(name: 'Sports')
      @product = Product.new(name: 'snowboard', quantity: 32, category: @category)
      @product.save
      expect(@product.errors.full_messages[2]).to eql("Price can't be blank")
    end
    it 'should throw a quantity required error when the quantity parameter is missing from product creation' do
      @category = Category.new(name: 'Sports')
      @product = Product.new(name: 'snowboard', price: 500, category: @category)
      @product.save
      expect(@product.errors.full_messages[0]).to eql("Quantity can't be blank")
    end
    it 'should throw a category required error when the category parameter is missing from product creation' do
      @category = Category.new(name: 'Sports')
      @product = Product.new(name: 'snowboard', quantity: 32, price: 500)
      @product.save
      expect(@product.errors.full_messages[0]).to eql("Category can't be blank")
    end
  end
end
