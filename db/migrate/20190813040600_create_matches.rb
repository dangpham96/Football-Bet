class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :home_team_id
      t.integer :guest_team_id
      t.datetime :start_time
      t.datetime :finish_time
      t.integer :goals_home_team
      t.integer :goals_guest_team
      t.references :round, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
