class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.datetime :start_time
      t.datetime :finish_time
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end
