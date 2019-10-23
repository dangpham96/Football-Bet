class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.text :content
      t.string :image
      t.integer :status
      t.references :category, foreign_key: true
      
      t.timestamps
    end
  end
end
