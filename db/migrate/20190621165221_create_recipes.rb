class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :blurb
      t.string :category
      t.integer :prep_time
      t.integer :cook_time
      t.text :ingredients
      t.text :directions
      t.string :user_id

      t.timestamps
    end
  end
end
