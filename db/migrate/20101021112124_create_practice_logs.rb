class CreatePracticeLogs < ActiveRecord::Migration
  def self.up
    create_table :practice_logs do |t|
      t.date :occurred_on
      t.time :duration
      t.timestamps
    end
  end

  def self.down
    drop_table :practice_logs
  end
end
