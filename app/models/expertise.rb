class Expertise < ActiveRecord::Base
  belongs_to :user
  has_many :practice_logs
  attr_accessible :name
  after_initialize :set_defaults
  validates_presence_of :user_id
  validates_format_of :color, :with => /^(#([0-9a-f]{3}|[0-9a-f]{6})|[a-z]+)$/i

  def seconds_remaining
    seconds_required - practice_logs.sum(:duration)
  end

  def hours_remaining
    seconds_remaining / 3600
  end

  private
  def set_defaults
    self.seconds_required ||= 10000.hours
  end
end
