class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address_line1
      t.string :city
      t.references :addressable, polymorphic: true
      t.timestamps
    end
  end
end
