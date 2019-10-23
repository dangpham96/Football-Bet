class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.integer :round_number
      t.references :season, foreign_key: true

      t.timestamps
    end
  end
end
