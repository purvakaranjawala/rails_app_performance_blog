class AddHotelReferencesToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :hotel, null: true, foreign_key: true
  end
end
