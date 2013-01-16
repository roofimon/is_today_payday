class PayMaster
  attr_writer :current_date
  def initialize
    @current_date = Date.today
  end

  def today_is_payday(today)
    case
      when today.saturday?||today.sunday?
        "Stupid dude, who's gonna pay you on weekend"
      else
        "Today is payday dude, you gonna be rich"
    end
  end

  def when_is_my_payday
    payday = Date.new(@current_date.year, @current_date.month, 26)
    case
    when payday.sunday?
      "An actual payday is weekend so your Pay Master will pay you sooner and your payday is Friday, 24-"+payday.month.to_s.rjust(2,"0")+"-"+payday.year.to_s
    when payday.saturday?
      "An actual payday is weekend so your Pay Master will pay you sooner and your payday is Friday, 25-"+payday.month.to_s.rjust(2,"0")+"-"+payday.year.to_s
    else
      payday.strftime('%A')+", 26-"+payday.month.to_s.rjust(2,"0")+"-"+payday.year.to_s
    end
  end
end