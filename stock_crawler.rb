require_relative 'all_stocks'

# 列出 search_date 中，所有 ETF

# def get_all_etf_within_one_day
#   url = "https://www.twse.com.tw/rwd/zh/afterTrading/MI_INDEX?date=#{search_date}&type=0099P&response=json"
#   request_api(url)
# end

all_stocks = AllStocks.new
p all_stocks.get_all_stock_within_date