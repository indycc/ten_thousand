class PracticeLog < ActiveRecord::Base
  belongs_to :expertise
  belongs_to :user
  validates :expertise_id, :presence => true, :numericality => true
  validates :duration, :presence => true, :numericality => true
  validates :occurred_on, :presence => true
  validates_each :duration do |model, attr, value|
    model.errors.add(attr, "Duration cannot be zero") if value == 0
  end

  has_event_calendar :start_at_field => 'occurred_on', :end_at_field => 'occurred_on'

  after_initialize :set_defaults

  # Used by event calendar
  def all_day ; true ; end
  def color ; expertise.color ; end

  def name
    expertise.name
  end

  def practice_duration
    return nil if duration.nil?
    minutes, seconds = duration / 60, duration % 60
    hours, minutes = minutes / 60, minutes % 60
    
    case
    when hours == 0
      "#{minutes}"
    else
      "#{hours}:#{minutes}"
    end
  end

  def practice_duration=(ftime)
    self.duration =
      case ftime
      when /^\d+$/, Numeric
        ftime.to_i.minutes
      when /^(\d+):(\d+)$/
        $1.to_i.hours + $2.to_i.minutes
      when /(\d+) hours?/
        $1.to_i.hours
      when /(\d+) minutes?/
        $1.to_i.minutes
      else
        nil
      end
  end

  def reset_values!
    changed_attributes.keys.each{ |attr| reset_attribute! attr }
  end

  private
  def set_defaults
    self.duration ||= 0
  end
end
