class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.text :preparation
      t.float :total_calories

      t.timestamps
    end
  end
end
