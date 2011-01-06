class PracticeLog < ActiveRecord::Base
  belongs_to :expertise
  belongs_to :user
  validates :expertise_id, :presence => true, :numericality => true
  validates :duration, :presence => true, :numericality => true

  has_event_calendar :start_at_field => 'occurred_on', :end_at_field => 'occurred_on'
  def all_day ; true ; end
  def color
    %W(x red green blue orange purple fuscia pink brown black gray)[expertise_id]
  end

  def name
    expertise.name
  end

  def practice_duration
    number = duration || 0
    ftime = ""
     
    hours = (number / 60).to_i
    ftime = hours.to_s if hours> 0
    number = number - (hours * 60)
    ftime += ":" if hours > 0 && number > 0 
    ftime +=  number.to_s if number > 0
    return ftime
  end

  def practice_duration=(ftime)
    if ftime.include?(":")
      hours, minutes = ftime.split(":")
      total_duration = hours.to_i * 60
      total_duration += minutes.to_i
      self.duration = total_duration
    else
      if ftime.match /^\d+$/
        self.duration = ftime.to_i
      elsif ftime.empty?
        self.duration = nil
      else
        raise "Duration should be a number"
      end
    end
  end
end
