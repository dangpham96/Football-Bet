class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.references :user, foreign_key: true
      t.references :match, foreign_key: true
      t.integer :result
      
      t.timestamps
    end
  end
end
