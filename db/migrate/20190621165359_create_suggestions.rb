class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.text :content
      t.integer :vote_count

      t.timestamps
    end
  end
end
