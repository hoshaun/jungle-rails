require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should validate' do
      @category = Category.new(name: "CategoryName")
      @category.save
      @product = Product.new(
        name: 'ProductName', 
        price: 100, 
        quantity: 1, 
        category: @category
      )
      expect(@product).to be_valid
    end

    it 'should not validate when name is nil' do
      @category = Category.new(name: "CategoryName")
      @category.save
      @product = Product.new(
        name: nil, 
        price: 100, 
        quantity: 1, 
        category: @category
      )
      expect(@product).to be_invalid
    end

    it 'should not validate when price is empty' do
      @category = Category.new(name: "CategoryName")
      @category.save
      @product = Product.new(
        name: 'ProductName', 
        price: "", 
        quantity: 1, 
        category: @category
      )
      expect(@product).to be_invalid
    end

    it 'should not validate when quantity is nil' do
      @category = Category.new(name: "CategoryName")
      @category.save
      @product = Product.new(
        name: 'ProductName', 
        price: 100, 
        quantity: nil, 
        category: @category
      )
      expect(@product).to be_invalid
    end

    it 'should not validate when category is nil' do
      @category = Category.new(name: "CategoryName")
      @category.save
      @product = Product.new(
        name: 'ProductName', 
        price: 100, 
        quantity: 1, 
        category: nil
      )
      expect(@product).to be_invalid
    end
  end
end