class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :string
      t.string :position

      t.timestamps null: false
    end
  end
end
