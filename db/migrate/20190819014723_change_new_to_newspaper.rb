class ChangeNewToNewspaper < ActiveRecord::Migration[6.0]
  def change
    rename_table :news, :newspapers
  end
end
