class StockDecorator < SimpleDelegator

  def level
    if amount >= min_stock_level
      "normal"
    elsif amount == 0
      "out of stock"
    else
      "low"
    end
  end
end
