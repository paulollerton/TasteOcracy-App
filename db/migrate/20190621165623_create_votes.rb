class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.integer :suggestion_id
      t.integer :vote_value

      t.timestamps
    end
  end
end
