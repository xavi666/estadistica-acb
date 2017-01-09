class AddAcbShortCodeOTeam < ActiveRecord::Migration
  def change
    add_column :teams, :acb_short_code, :string
  end
end
