class RemoveStringFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :string, :string
  end
end
