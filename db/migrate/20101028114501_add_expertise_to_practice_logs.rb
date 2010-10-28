class AddExpertiseToPracticeLogs < ActiveRecord::Migration
  def self.up
    change_table :practice_logs do |t|
      t.belongs_to :expertise
    end
  end

  def self.down
    change_table :practice_logs do |t|
      t.remove_belongs_to :expertise
    end
  end
end
