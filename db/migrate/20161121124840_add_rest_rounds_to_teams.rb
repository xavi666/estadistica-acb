class AddRestRoundsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :rest_round_1, :string, default: 0
    add_column :teams, :rest_round_2, :string, default: 0
  end
end
