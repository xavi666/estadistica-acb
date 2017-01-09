class AddDorsalToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :number, :string
  end
end
