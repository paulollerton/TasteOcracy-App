class RemoveUserIdFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :user_id, :string
  end
end
