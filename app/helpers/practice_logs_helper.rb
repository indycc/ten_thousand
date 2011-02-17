module PracticeLogsHelper

  def format_time(number)
    ftime = ""
    if number == 0 
      ftime = "0 minutes"
    else
      hours = (number / 3600).to_i
      ftime = pluralize(hours, "hour") if hours > 0
      number = (number - (hours * 3600)) / 60
      ftime += " " if hours > 0 && number > 0 
      ftime += pluralize(number, "minute") if number > 0
    end
    return ftime
  end
  
end

