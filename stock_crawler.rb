require_relative 'all_stocks'
require_relative 'unneeded_stocks'

# [股票代號、股票名稱、該日收盤價]
all_stocks = AllStocks.new.get_all_stock_within_date
unneeded_stocks = UnneededStocks.new.all_unneeded_stocks_code
needed_stock = all_stocks.reject! { |stock| unneeded_stocks.include? stock.first }

p needed_stock
