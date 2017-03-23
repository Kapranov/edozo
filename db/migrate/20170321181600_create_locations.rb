class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.text :address
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.text :image_data
      t.text :floorplan_data
      t.text :description
      t.decimal :price_paid, precision: 12, scale: 3

      t.timestamps
    end
    add_index :locations, :user_id
  end
end
