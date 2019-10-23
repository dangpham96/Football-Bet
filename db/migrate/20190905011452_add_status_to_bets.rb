class AddStatusToBets < ActiveRecord::Migration[6.0]
  def change
    add_column :bets, :status, :integer
  end
end
