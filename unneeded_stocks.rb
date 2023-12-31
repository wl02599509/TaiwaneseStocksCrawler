require_relative 'search_date'
require_relative 'request_api'

class UnneededStocks
  def all_unneeded_stocks_code
    all_etf_code + all_biotech_medical_code
  end

  private

  def all_etf_code
    url = "https://www.twse.com.tw/rwd/zh/afterTrading/MI_INDEX?date=#{SearchDate.new.latest_trade_date}&type=0099P&response=json"

    RequestApi.new(url).parsed_json['tables']
                       .find { |h| h.has_key?('data') }['data']
                       .map { |etf| etf.first }
  end

  def all_biotech_medical_code
    url = "https://www.twse.com.tw/rwd/zh/afterTrading/MI_INDEX?date=#{SearchDate.new.latest_trade_date}&type=22&response=json"

    RequestApi.new(url).parsed_json['tables']
                       .find { |h| h.has_key?('data') }['data']
                       .map { |etf| etf.first }
  end
end
