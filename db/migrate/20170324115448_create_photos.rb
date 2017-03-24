class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.text :image_data
      t.belongs_to :location, foreign_key: true

      t.timestamps
    end
  end
end
