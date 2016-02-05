require 'rails_helper'

RSpec.describe StockDecorator do
  let(:item) { FactoryGirl.create(:item, amount: amount, min_stock_level: 10) }
  let(:stock_decorator) { StockDecorator.new(item) }

  context 'normal stock' do
    let(:amount) { 10 }
    it 'provides a stock level for normal' do
      expect(stock_decorator.level).to eq('normal')
    end

    it 'allows access to all item attributes' do
      expect(stock_decorator.amount).to eq(item.amount)
      expect(stock_decorator.name).to eq(item.name)
      expect(stock_decorator.description).to eq(item.description)
    end
  end

  context 'low stock' do
    let(:amount) { 5 }
    it 'provides a stock level for low' do
      puts item.amount
      puts item.min_stock_level
      expect(stock_decorator.level).to eq('low')
    end
  end

  context 'out of stock' do
    let(:amount) { 0 }
    it 'provides a stock level for out of stock' do
      expect(stock_decorator.level).to eq('out of stock')
    end
  end
end
