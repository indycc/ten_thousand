class AddColorToExpertise < ActiveRecord::Migration
  def self.up
    add_column :expertises, :color, :string
    execute "UPDATE expertises SET color = 'gray'"
  end

  def self.down
    remove_column :expertises, :color
  end
end
