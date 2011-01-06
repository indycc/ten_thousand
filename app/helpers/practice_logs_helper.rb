module PracticeLogsHelper

  def format_time(number)
    ftime = ""
    hours = (number / 60).to_i
    ftime = pluralize(hours, "hour") if hours > 0
    number = number - (hours * 60)
    ftime += " " if hours > 0 && number > 0 
    ftime += pluralize(number, "minute") if number > 0
    return ftime
  end
  
end

