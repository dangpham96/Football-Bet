class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.references :season, foreign_key: true
      t.references :football_club, foreign_key: true
      t.integer :goals_number
      t.integer :goals_lost_number
      t.integer :games_win
      t.integer :games_lost
      t.integer :games_draw      
      
      t.timestamps
    end
  end
end
