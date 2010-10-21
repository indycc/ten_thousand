class Expertise < ActiveRecord::Base
  def initialize(attribs={})
    super(attribs)
    self.total_minutes_remaining = 600000
    self
  end
end
