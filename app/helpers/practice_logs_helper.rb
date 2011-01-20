module PracticeLogsHelper

  def format_time(number)
    ftime = ""
    hours = (number / 3600).to_i
    ftime = pluralize(hours, "hour") if hours > 0
    number = (number - (hours * 3600)) / 60
    ftime += " " if hours > 0 && number > 0 
    ftime += pluralize(number, "minute") if number > 0
    return ftime
  end
  
end

