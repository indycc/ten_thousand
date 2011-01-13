class Expertise < ActiveRecord::Base
  belongs_to :user
  has_many :practice_logs

  validates_presence_of :user_id

  def initialize(attribs={})
    super(attribs)
    self.total_minutes_remaining = 600000
    self
  end
end
