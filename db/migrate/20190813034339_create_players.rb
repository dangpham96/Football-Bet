class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :position
      t.integer :number
      t.string :country
      t.datetime :birthday
      t.references :football_club, foreign_key: true
      
      t.timestamps
    end
  end
end
