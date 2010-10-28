class Expertise < ActiveRecord::Base
  # TODO: belongs_to :user
  has_many :practice_logs

  def initialize(attribs={})
    super(attribs)
    self.total_minutes_remaining = 600000
    self
  end
end
