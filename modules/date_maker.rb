require 'date'

module DateMaker
  def make_date
    Date.today.strftime('%d%m%y')
  end
end
