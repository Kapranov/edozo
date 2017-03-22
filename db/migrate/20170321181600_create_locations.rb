class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.text :address
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.text :image_data

      t.timestamps
    end
  end
end
