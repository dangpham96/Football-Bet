class AddStatusToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :status, :integer
  end
end
