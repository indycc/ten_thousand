class Expertise < ActiveRecord::Base
  belongs_to :user
  has_many :practice_logs
  attr_accessible :name, :color
  after_initialize :set_defaults
  validates_presence_of :user_id, :name
  validates_format_of :color, :with => /^(#([0-9a-f]{3}|[0-9a-f]{6})|[a-z]+)$/i

  def seconds_remaining
    seconds_required - practice_logs.sum(:duration)
  end

  def hours_remaining
    seconds_remaining / 3600
  end

  def self.pick_default_color_for user
    %W(red green blue orange purple fuscia pink brown black gray)[user.expertises.count]
  end

  def time_spent(distance = 1.week)
    practice_logs.where('occurred_on >= ?', distance.ago).sum(:duration)
  end

  def to_sparkline(weeks = 26)
    logs = practice_logs.where('occurred_on > ?', weeks.weeks)
    logs = logs.inject([0]*weeks) { |res, log|
      res[weeks_ago = (Date.today - log.occurred_on).to_i / 7] += log.duration
      res
    }.reverse
    {
      :id => id,
      :remaining => [seconds_remaining, seconds_required - seconds_remaining],
      :recent => logs,
      :color => color,
    }
  end

  private
  def set_defaults
    self.seconds_required ||= 10000.hours
  end
end
