class AlterPracticeLogDurationToInteger < ActiveRecord::Migration
  def self.up
    change_column :practice_logs, :duration, :int
  end

  def self.down
    change_column :practice_logs, :duration, :time
  end
end
