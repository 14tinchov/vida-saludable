class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.float :weight
      t.float :height
      t.integer :physical_activity
      t.text :physical_activity_description
      t.text :other_diseases
      t.text :other_pleasures
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
