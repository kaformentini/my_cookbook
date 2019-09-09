class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :cook_time
      t.string :ingredients
      t.string :cook_method

      t.timestamps
    end
  end
end
