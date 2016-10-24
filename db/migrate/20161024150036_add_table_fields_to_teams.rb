class AddTableFieldsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :position, :integer, default: 0
    add_column :teams, :played, :integer, default: 0
    add_column :teams, :won, :integer, default: 0
    add_column :teams, :lost, :integer, default: 0
  end
end
