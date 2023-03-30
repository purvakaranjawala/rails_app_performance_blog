class RenameRecipesIdToRecipeId < ActiveRecord::Migration[7.0]
  def change
    rename_column :receipe_infos, :recipes_id, :recipe_id
  end
end
