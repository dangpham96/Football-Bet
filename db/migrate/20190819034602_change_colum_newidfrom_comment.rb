class ChangeColumNewidfromComment < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :new_id, :newspaper_id
  end
end
