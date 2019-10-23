class CreateFootballClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :football_clubs do |t|
      t.string :name
      t.text :description
      t.integer :member
      t.string :stadium
      t.string :logo
      
      t.timestamps
    end
  end
end
