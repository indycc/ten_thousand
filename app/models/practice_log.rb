class PracticeLog < ActiveRecord::Base
  belongs_to :expertise
  belongs_to :user
end
