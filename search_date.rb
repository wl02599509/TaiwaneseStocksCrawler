require 'active_support/all'
require 'active_support/core_ext/date'

class SearchDate
  def date
    if today_is_holiday?
      Date.current.beginning_of_week + 4.days
    else
      Date.current
    end.strftime('%Y%m%d')
  end

  private

  def today_is_holiday?
    Date.current.strftime('%A') == 'Saturday' || 'Sunday'
  end
end