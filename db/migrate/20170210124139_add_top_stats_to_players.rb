class AddTopStatsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :best_round_val, :boolean, default: false
    add_column :players, :best_round_points, :boolean, default: false
    add_column :players, :best_round_rebounds, :boolean, default: false
    add_column :players, :best_round_assists, :boolean, default: false
    add_column :players, :best_round_3points, :boolean, default: false
  end
end
