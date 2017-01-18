class AddFirstHalfRoundToGames < ActiveRecord::Migration
  def change
    add_column :games, :first_second_game, :integer
    add_index :games, [:first_second_game]
  end
end
