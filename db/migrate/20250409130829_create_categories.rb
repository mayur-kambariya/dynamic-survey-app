class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :survey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
