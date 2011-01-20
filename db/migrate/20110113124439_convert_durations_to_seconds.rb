class ConvertDurationsToSeconds < ActiveRecord::Migration
  # Use seconds for time values so that ActiveSupport::Duration is more natural to use.
  def self.up
    add_column :expertises, :seconds_required, :integer
    execute 'UPDATE expertises SET seconds_required = total_minutes_remaining * 60'
    execute 'UPDATE practice_logs SET duration = duration * 60'
    remove_column :expertises, :total_minutes_remaining
  end

  def self.down
    add_column :expertises, :total_minutes_remaining, :integer
    execute 'UPDATE practice_logs SET duration = duration / 60'
    execute 'UPDATE expertises SET total_minutes_remaining = seconds_required / 60'
    remove_column :expertises, :seconds_required
  end
end
