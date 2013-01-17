class PayMaster
  attr_writer :current_date, :payday

  def initialize
    @current_date = Date.today
    @payday = Date.new(@current_date.year, @current_date.month, 26)
  end

  def is_payday
    case
      when @current_date.saturday?||@current_date.sunday?
        "Stupid dude, who's gonna pay you on weekend"
      when @current_date == @payday
        "Today is payday dude, you gonna be rich"
      else
        number_of_days = ((@payday-@current_date).to_i).to_s.rjust(2, "0")
        "Sorry dude you have to wait for #{number_of_days} days"
    end
  end

  def when_is_my_payday
    case
    when @payday.sunday?
      "An actual payday is weekend so your Pay Master will pay you sooner and your payday is Friday, 24-"+@payday.month.to_s.rjust(2,"0")+"-"+@payday.year.to_s
    when @payday.saturday?
      "An actual payday is weekend so your Pay Master will pay you sooner and your payday is Friday, 25-"+@payday.month.to_s.rjust(2,"0")+"-"+@payday.year.to_s
    else
      @payday.strftime('%A')+", 26-"+@payday.month.to_s.rjust(2,"0")+"-"+@payday.year.to_s
    end
  end
end