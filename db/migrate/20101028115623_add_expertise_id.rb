class AddExpertiseId < ActiveRecord::Migration
  def self.up
	  add_column :practice_logs, :expertise_id, :integer
  end

  def self.down
	  remove_column :practice_logs, :expertise_id
  end
end
