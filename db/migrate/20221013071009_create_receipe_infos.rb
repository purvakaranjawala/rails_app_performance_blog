class CreateReceipeInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :receipe_infos do |t|
      t.string :title
      t.text :ingredients
      t.string :speciality
      t.string :origin
      t.references :recipes, null: false
      t.datetime :posted_at

      t.timestamps
    end
  end
end
