class AddPlayingCupToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :playing_cup, :boolean, default: false
  end
end
