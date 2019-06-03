require 'date'

module DateFormatter
  def make_date
    Date.today.strftime('%d%m%y')
  end
end
