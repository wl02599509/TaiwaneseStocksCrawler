require_relative 'request_api'
require_relative 'search_date'

class AllStocks
  # 列出 search_date 中，所有股票的資訊
  def get_all_stock_within_date
    url = "https://www.twse.com.tw/rwd/zh/afterTrading/MI_INDEX?date=#{SearchDate.new.latest_trade_date}&type=ALLBUT0999&response=json"

    stacks_json = RequestApi.new(url).parsed_json

    select_stack_part = stacks_json['tables'].select do |part|
      next if part['title'].nil?
      part['title'].include?('每日收盤行情(全部(不含權證、牛熊證))')
    end.first

    stacks = select_stack_part['data']
    needed_field_idx = [0, 1, 8]
    stacks.map do |stack|
      stack.keep_if.with_index { |_v, field_idx| needed_field_idx.include?(field_idx) }
    end
  end
end
