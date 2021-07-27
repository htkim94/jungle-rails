require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new(name: 'example')
      @category.save
    end

    it 'should save successfully if all four fields are valid' do
      product = Product.new(name: 'product1', price: 1500, quantity: 1, category: @category)
      product.save

      expect(product).to be_valid
    end

    it 'should output error if no name given' do
      product = Product.new(price: 1500, quantity: 1, category: @category)
      product.save

      expect(product.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'should output error if no quantity given' do
      product = Product.new(price: 1500, name: "product1", category: @category)
      product.save

      expect(product.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it 'should output error if no price given' do
      product = Product.new(name: 'product1', quantity: 1, category: @category)
      product.save

      expect(product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it 'should output error if no category given' do
      product = Product.new(price: 1500, quantity: 1, name: "product1")
      product.save

      expect(product.errors.full_messages).to eq(["Category can't be blank"])
    end
  end
end